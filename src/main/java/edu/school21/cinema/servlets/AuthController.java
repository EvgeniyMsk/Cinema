package edu.school21.cinema.servlets;

import edu.school21.cinema.models.AuthHistory;
import edu.school21.cinema.models.CinemaUser;
import edu.school21.cinema.models.roles.ERole;
import edu.school21.cinema.repositories.RoleRepository;
import edu.school21.cinema.services.CinemaUserService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.*;

@Controller
public class AuthController {
    @Autowired
    private String avatarPath;

    @Autowired
    private CinemaUserService cinemaUserService;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    RoleRepository roleRepository;

    @GetMapping("/auth/register")
    public String register(@ModelAttribute ("user")CinemaUser cinemaUser) {
        return "/auth/register";
    }

    @PostMapping("/auth/register")
    public String signUp(@ModelAttribute ("user")CinemaUser cinemaUser, HttpServletRequest request) {
        cinemaUser.setRoles(Collections.singleton(new ERole(1L, "USER")));
        cinemaUser.setAuthHistory(new ArrayList<>());
        cinemaUser.setPassword(bCryptPasswordEncoder.encode(cinemaUser.getPassword()));
        cinemaUser.getAuthHistory().add(new AuthHistory(cinemaUser, "register", new Date().toString(), request.getRemoteAddr()));
        if (cinemaUserService.createCinemaUser(cinemaUser)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", cinemaUserService.getCinemaUserByUserName(cinemaUser.getUsername()));
            return "redirect:/";
        }
        return "redirect:/auth/register";
    }

    @GetMapping("/auth/profile")
    public String profile(HttpServletRequest request, Model model) {
        model.addAttribute("user", cinemaUserService.getCinemaUserByUserName(request.getUserPrincipal().getName()));
        return "/auth/profile";
    }

    @GetMapping("/auth/profile/avatar")
    @ResponseBody
    public byte[] downloadAvatar(Principal principal) throws IOException {
        CinemaUser cinemaUser = cinemaUserService.getCinemaUserByUserName(principal.getName());
        return downloadAvatar(cinemaUser, avatarPath);
    }

    @PostMapping("/auth/profile/avatar")
    public String uploadAvatar(@RequestParam("file") MultipartFile file, Principal principal) throws IOException {
        CinemaUser cinemaUser = cinemaUserService.getCinemaUserByUserName(principal.getName());
        loadAvatar(file, cinemaUser);
        return "redirect:/auth/profile";
    }

    private void loadAvatar(MultipartFile file, CinemaUser cinemaUser) throws IOException {
        if (file.getBytes().length > 0) {
            File uploadDir = new File(avatarPath + "/" + cinemaUser.getId());
            if (!uploadDir.exists())
            { uploadDir.mkdir(); }
            String uuidFile = UUID.nameUUIDFromBytes(file.getBytes()).toString();
            String resultFileName = uuidFile + "." + FilenameUtils.getExtension(file.getOriginalFilename());
            file.transferTo(new File(avatarPath + "/" + cinemaUser.getId() + "/" + resultFileName));
        }
    }

    private byte[] downloadAvatar(CinemaUser cinemaUser, String path) throws IOException {
        File imagesDir0 = new File(avatarPath);
        if (!imagesDir0.exists())
            imagesDir0.mkdir();
        File imagesDir = new File(avatarPath + "/" + cinemaUser.getId());
        if (!imagesDir.exists())
            imagesDir.mkdir();
        File image = new File(avatarPath + "/" + cinemaUser.getId());
        if ((Objects.requireNonNull(image.listFiles()).length != 0)) {
            File[] files = image.listFiles();
            Arrays.sort(files, (f1, f2) -> Long.valueOf(f1.lastModified()).compareTo(f2.lastModified()));
            byte[] fileContent = FileUtils.readFileToByteArray(files[files.length - 1]);
            return fileContent;
        }
        return null;
    }
}
