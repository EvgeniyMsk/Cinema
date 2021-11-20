package edu.school21.cinema.servlets;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class AdminController {
    @GetMapping("/admin/halls")
    public String halls(Model model) {
        return "/admin/halls";
    }

    @PostMapping("/admin/halls")
    public String createHall(Model model) {
        return "/admin/halls";
    }

    @GetMapping("/admin/films")
    public String films(Model model) {
        return "/admin/films";
    }

    @GetMapping("/admin/sessions")
    public String sessions(Model model) {
        return "/admin/sessions";
    }
}
