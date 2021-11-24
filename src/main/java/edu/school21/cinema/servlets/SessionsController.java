package edu.school21.cinema.servlets;

import edu.school21.cinema.models.CinemaSession;
import edu.school21.cinema.models.Person;
import edu.school21.cinema.services.CinemaSessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
}
