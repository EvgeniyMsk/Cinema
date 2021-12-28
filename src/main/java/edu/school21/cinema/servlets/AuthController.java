package edu.school21.cinema.servlets;

import edu.school21.cinema.models.AuthHistory;
import edu.school21.cinema.models.CinemaUser;
import edu.school21.cinema.models.roles.ERole;
import edu.school21.cinema.services.CinemaUserService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class AuthController {
    private String avatarPath = "C:/Users/User/Desktop/avatars";

    @Autowired
    private CinemaUserService cinemaUserService;

    @GetMapping("/auth/login")
    public String login(@ModelAttribute ("user")CinemaUser cinemaUser) {
        return "/auth/login";
    }

    @PostMapping("/auth/signIn")
    public String signIn(@ModelAttribute ("user")CinemaUser cinemaUser, HttpServletRequest request) {
        if (cinemaUserService.authorize(cinemaUser, request)) {
            HttpSession session = request.getSession();
            CinemaUser user =  cinemaUserService.getCinemaUserByUserName(cinemaUser.getUserName());
            session.setAttribute("user", user);
            return "/auth/profile";
        }
        return "/auth/login";
    }

    @GetMapping("/auth/register")
    public String register(@ModelAttribute ("user")CinemaUser cinemaUser) {
        return "/auth/register";
    }

    @PostMapping("/auth/signUp")
    public String signUp(@ModelAttribute ("user")CinemaUser cinemaUser, HttpServletRequest request) {
        cinemaUser.setRole(ERole.USER);
        cinemaUser.setAuthHistory(new ArrayList<>());
        cinemaUser.getAuthHistory().add(new AuthHistory(cinemaUser, "register", new Date().toString(), request.getRemoteAddr()));
        if (cinemaUserService.createCinemaUser(cinemaUser)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", cinemaUserService.getCinemaUserByUserName(cinemaUser.getUserName()));
            return "/auth/profile";
        }
        return "/auth/register";
    }

    @GetMapping("/auth/profile")
    public String profile(Model model, HttpServletRequest request) {
        CinemaUser cinemaUser = (CinemaUser) request.getSession().getAttribute("user");
        model.addAttribute(cinemaUser);
        return "/auth/profile";
    }

    @GetMapping("/auth/profile/avatar")
    @ResponseBody
    public byte[] downloadAvatar(HttpServletRequest request) throws IOException {
        CinemaUser cinemaUser = (CinemaUser) request.getSession().getAttribute("user");
        File imagesDir = new File(avatarPath + cinemaUser.getId());
        if (!imagesDir.exists())
            imagesDir.mkdir();
        File image = new File(avatarPath + cinemaUser.getId());
        if ((Objects.requireNonNull(image.listFiles()).length != 0)) {
            File[] files = image.listFiles();
            Arrays.sort(files, (f1, f2) -> Long.valueOf(f1.lastModified()).compareTo(f2.lastModified()));
            byte[] fileContent = FileUtils.readFileToByteArray(files[files.length - 1]);
            return fileContent;
        }
        return null;
    }

    @PostMapping("/auth/profile/avatar")
    public String uploadAvatar(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException {
        CinemaUser cinemaUser = (CinemaUser) request.getSession().getAttribute("user");
        if (cinemaUser == null)
            return "/error/error";
        else if (file.getBytes().length > 0) {
                File uploadDir = new File(avatarPath + "/" + cinemaUser.getId());
                if (!uploadDir.exists())
                { uploadDir.mkdir(); }
                String uuidFile = UUID.nameUUIDFromBytes(file.getBytes()).toString();
                String resultFileName = uuidFile + "." + FilenameUtils.getExtension(file.getOriginalFilename());
                file.transferTo(new File("/" + resultFileName));
        }
        return "/auth/profile";
    }

    @GetMapping("/auth/logout")
    public String getLogout() {
        return "/auth/profile";
    }

    @PostMapping("/auth/logout")
    public String logout(@ModelAttribute ("user")CinemaUser cinemaUser, HttpServletRequest req) {
        HttpSession session = req.getSession();
        session.removeAttribute("user");
        return "redirect:/auth/login";
    }
}
