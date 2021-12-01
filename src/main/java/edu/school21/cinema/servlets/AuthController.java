package edu.school21.cinema.servlets;

import edu.school21.cinema.models.CinemaUser;
import edu.school21.cinema.models.roles.ERole;
import edu.school21.cinema.services.CinemaUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

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
        if (cinemaUserService.authorize(cinemaUser)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", cinemaUserService.getCinemaUserByUserName(cinemaUser.getUserName()));
            return "/auth/profile";
        }
        return "/auth/login";
    }

    @GetMapping("/auth/register")
    public String register(@ModelAttribute ("newUser")CinemaUser cinemaUser) {
        return "/auth/register";
    }

    @PostMapping("/auth/signUp")
    public String signUp(@ModelAttribute ("newUser")CinemaUser cinemaUser, HttpServletRequest request) {
        cinemaUser.setRole(ERole.USER);
        cinemaUserService.createCinemaUser(cinemaUser);
        HttpSession session = request.getSession();
        session.setAttribute("user", cinemaUserService.getCinemaUserByUserName(cinemaUser.getUserName()));
        return "/auth/profile";
    }

    @GetMapping("/auth/profile")
    public String profile() {
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
        return "/auth/login";
    }
}
