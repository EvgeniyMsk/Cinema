package edu.school21.cinema.servlets;

import edu.school21.cinema.models.CinemaSession;
import edu.school21.cinema.models.Movie;
import edu.school21.cinema.models.MovieHall;
import edu.school21.cinema.services.CinemaSessionService;
import edu.school21.cinema.services.MovieHallService;
import edu.school21.cinema.services.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.Date;


@Controller
public class AdminController {
    @Autowired
    private MovieHallService movieHallService;
    @Autowired
    private MovieService movieService;
    @Autowired
    private CinemaSessionService cinemaSessionService;

//    MovieHalls
    @GetMapping("/admin/halls")
    public String halls(Model model) {
        model.addAttribute("movieHalls", movieHallService.getAll());
        model.addAttribute("movieHall", new MovieHall());
        return "/admin/halls";
    }

    @PostMapping("/admin/halls")
    public String addHalls(@ModelAttribute ("movieHall") MovieHall movieHall) {
        movieHallService.createMovieHall(movieHall);
        return "redirect:/admin/halls";
    }

    @GetMapping("/admin/halls/{id}")
    public String editHalls(@PathVariable("id") String id, Model model) {
        try {
            if (movieHallService.getMovieHallById(Long.parseLong(id)) != null) {
                model.addAttribute("movieHall", movieHallService.getMovieHallById(Long.parseLong(id)));
                return "/admin/showHall";
            }
            return "redirect:/admin/halls";
        } catch (Exception e) {
            return "redirect:/admin/halls";
        }
    }

    @PostMapping("/admin/halls/{id}/delete")
    public String deleteHalls(@PathVariable("id") Long id) {
        MovieHall movieHall = movieHallService.getMovieHallById(id);
        movieHallService.deleteMovieHall(movieHall);
        return "redirect:/admin/halls";
    }

    @PostMapping("/admin/halls/{id}/update")
    public String updateHalls(@PathVariable("id") String id, @ModelAttribute ("movieHall") MovieHall movieHall) {
        movieHallService.updateMovieHall(movieHall);
        return "redirect:/admin/halls";
    }

//    Movies
    @GetMapping("/admin/films")
    public String films(Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        model.addAttribute("movies", movieService.getAll());
        model.addAttribute("movie", new Movie());
        return "/admin/films";
    }

    @PostMapping("/admin/films")
    public String addFilms(@ModelAttribute ("movie") Movie movie) {
        movieService.createMovie(movie);
        return "redirect:/admin/films";
    }

    @GetMapping("/admin/films/{id}")
    public String editMovies(@PathVariable("id") String id, Model model) {
        try {
            if (movieService.getMovieById(Long.parseLong(id)) != null) {
                model.addAttribute("movie", movieService.getMovieById(Long.parseLong(id)));
                return "/admin/showFilm";
            }
            return "redirect:/admin/films";
        } catch (Exception e) {
            return "redirect:/admin/films";
        }
    }

    @PostMapping("/admin/films/{id}/delete")
    public String deleteMovies(@PathVariable("id") Long id) {
        Movie movie = movieService.getMovieById(id);
        movieService.deleteMovie(movie);
        return "redirect:/admin/films";
    }

    @PostMapping("/admin/films/{id}/update")
    public String updateMovies(@PathVariable("id") String id, @ModelAttribute ("movie") Movie movie) {
        movieService.updateMovie(movie);
        return "redirect:/admin/films";
    }

//    CinemaSessions
    @GetMapping("/admin/sessions")
    public String cinemaSessions(Model model) {
        model.addAttribute("cinemaSessions", cinemaSessionService.getAll());
        model.addAttribute("cinemaSession", new CinemaSession());
        return "/admin/sessions";
    }

    @PostMapping("/admin/sessions")
    public String addCinemaSession(@ModelAttribute ("cinemaSession") CinemaSession cinemaSession) {
        cinemaSessionService.createCinemaSession(cinemaSession);
        return "redirect:/admin/sessions";
    }

    @GetMapping("/admin/sessions/{id}")
    public String editCinemaSessions(@PathVariable("id") String id, Model model) {
        try {
            if (cinemaSessionService.getCinemaSessionById(Long.parseLong(id)) != null) {
                model.addAttribute("cinemaSession", cinemaSessionService.getCinemaSessionById(Long.parseLong(id)));
                return "/admin/showSession";
            }
            return "redirect:/admin/sessions";
        } catch (Exception e) {
            return "redirect:/admin/sessions";
        }
    }

    @PostMapping("/admin/sessions/{id}/delete")
    public String deleteCinemaSessions(@PathVariable("id") Long id) {
        CinemaSession cinemaSession = cinemaSessionService.getCinemaSessionById(id);
        cinemaSessionService.deleteCinemaSession(cinemaSession);
        return "redirect:/admin/sessions";
    }

    @PostMapping("/admin/sessions/{id}/update")
    public String updateCinemaSessions(@PathVariable("id") String id, @ModelAttribute ("cinemaSession") CinemaSession cinemaSession) {
        cinemaSessionService.updateCinemaSession(cinemaSession);
        return "redirect:/admin/sessions";
    }
}
