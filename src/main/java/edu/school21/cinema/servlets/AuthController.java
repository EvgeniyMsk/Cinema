package edu.school21.cinema.servlets;

import edu.school21.cinema.models.AuthHistory;
import edu.school21.cinema.models.CinemaUser;
import edu.school21.cinema.models.roles.ERole;
import edu.school21.cinema.services.CinemaUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class AuthController {
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
