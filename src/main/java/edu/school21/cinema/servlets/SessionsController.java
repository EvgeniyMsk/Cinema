package edu.school21.cinema.servlets;

import edu.school21.cinema.models.CinemaSession;
import edu.school21.cinema.models.Movie;
import edu.school21.cinema.services.CinemaSessionService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Controller
public class SessionsController {
    private String uploadPath = "C:/Users/User/Desktop/images";
    @Autowired
    private CinemaSessionService cinemaSessionService;

    @GetMapping("/sessions/search")
    @ResponseBody
    public List<CinemaSession> searchSessions(@RequestParam("filmName") String filmName, HttpServletRequest request) throws IOException {
        List<CinemaSession> cinemaSessions = cinemaSessionService.findCinemaSessionByText(filmName);
        List<String> images = new ArrayList<>();
        for (CinemaSession cinemaSession : cinemaSessions)
        {
            if (cinemaSession.getMovie().getPosterUrl() != null) {
                byte[] fileContent = FileUtils.readFileToByteArray(new File(uploadPath + "/" + cinemaSession.getMovie().getPosterUrl()));
                String encodedString = Base64.getEncoder().encodeToString(fileContent);
                images.add(encodedString);
            }
        }
        request.setAttribute("images", images);
        request.setAttribute("images", cinemaSessionService);
        return cinemaSessions;
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
