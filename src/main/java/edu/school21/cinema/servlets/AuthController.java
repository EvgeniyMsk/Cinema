package edu.school21.cinema.servlets;

import edu.school21.cinema.models.CinemaUser;
import edu.school21.cinema.models.roles.ERole;
import edu.school21.cinema.services.CinemaUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AuthController {
    @Autowired
    private CinemaUserService cinemaUserService;

    @GetMapping("/auth/login")
    public String login() {
        return "/auth/login";
    }

    @GetMapping("/auth/register")
    public String register() {
        return "/auth/register";
    }

    @PostMapping("/auth/signUp")
    public String signUp(@ModelAttribute ("newUser")CinemaUser cinemaUser) {
        return "redirect:/auth/profile";
    }
}
