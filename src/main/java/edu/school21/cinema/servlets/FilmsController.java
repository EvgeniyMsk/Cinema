package edu.school21.cinema.servlets;

import edu.school21.cinema.models.Movie;
import edu.school21.cinema.services.MovieHallService;
import edu.school21.cinema.services.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;

@Controller
public class FilmsController {
    @Autowired
    private MovieService movieService;

    @GetMapping("/films")
    public String films(Model model, HttpServletRequest request) {
        model.addAttribute("movies", movieService.getAll());
        request.setAttribute("movies", movieService.getAll());
        return "/chat/films";
    }

    @GetMapping("/films/{id}/chat")
    public String goChat(@PathVariable("id") String id, Model model, HttpServletRequest request) {
        try {
            if (movieService.getMovieById(Long.parseLong(id)) != null) {
                model.addAttribute("movie", movieService.getMovieById(Long.parseLong(id)));
                request.setAttribute("movie", movieService.getMovieById(Long.parseLong(id)));
                return "/chat/chat";
            }
            return "redirect:/";
        } catch (Exception e) {
            return "redirect:/";
        }
    }

}
