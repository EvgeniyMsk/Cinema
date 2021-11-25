package edu.school21.cinema.servlets;

import edu.school21.cinema.models.CinemaSession;
import edu.school21.cinema.services.CinemaSessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class SessionsController {
    @Autowired
    private CinemaSessionService cinemaSessionService;

    @GetMapping("/sessions/search")
    @ResponseBody
    public List<CinemaSession> searchSessions(@RequestParam("filmName") String filmName) {
        return cinemaSessionService.findCinemaSessionByText(filmName);
    }

    @GetMapping("/sessions")
    public String sessions() {
        return "/sessions/sessionSearch";
    }

    @GetMapping("/sessions/{id}")
    public String editCinemaSessions(@PathVariable("id") String id, Model model, HttpServletRequest request) {
        try {
            if (cinemaSessionService.getCinemaSessionById(Long.parseLong(id)) != null) {
                model.addAttribute("cinemaSession", cinemaSessionService.getCinemaSessionById(Long.parseLong(id)));
                request.setAttribute("cinemaSession", cinemaSessionService.getCinemaSessionById(Long.parseLong(id)));
                return "/sessions/showSession";
            }
            return "redirect:/sessions";
        } catch (Exception e) {
            return "redirect:/sessions";
        }
    }
}
