package edu.school21.cinema.servlets;

import edu.school21.cinema.models.CinemaSession;
import edu.school21.cinema.models.Movie;
import edu.school21.cinema.models.MovieHall;
import edu.school21.cinema.services.CinemaSessionService;
import edu.school21.cinema.services.MovieHallService;
import edu.school21.cinema.services.MovieService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;


@Controller
public class AdminController {
    private String uploadPath = "/Users/qsymond/Desktop/images";
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
                return "/admin/editHall";
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
    public String films(Model model, HttpServletRequest request) throws IOException {
        String dir = System.getProperty("user.dir");
        System.out.println("current dir = " + dir);
        model.addAttribute("movies", movieService.getAll());
        model.addAttribute("movie", new Movie());
        List<String> images = new ArrayList<>();
        for (Movie movie : movieService.getAll())
        {
            if (movie.getPosterUrl() != null) {
                byte[] fileContent = FileUtils.readFileToByteArray(new File(uploadPath + "/" + movie.getPosterUrl()));
                String encodedString = Base64.getEncoder().encodeToString(fileContent);
                images.add(encodedString);
            }
        }
        request.setAttribute("images", images);
        request.setAttribute("movies", movieService.getAll());
        return "/admin/films";
    }

    @PostMapping("/admin/films")
    public String addFilms(@ModelAttribute ("movie") Movie movie,
                           @ModelAttribute("releaseDate") String dateOfRelease,
                           @RequestParam("file") MultipartFile file) throws ParseException, IOException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
        Date date = formatter.parse(dateOfRelease);
        movie.setDateOfRelease(date);
        if (file.getBytes().length > 0) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists())
            { uploadDir.mkdir(); }
            String uuidFile = UUID.nameUUIDFromBytes(file.getBytes()).toString();
            String resultFileName = uuidFile + "." + FilenameUtils.getExtension(file.getOriginalFilename());
            file.transferTo(new File(uploadPath + "/" + resultFileName));
            movie.setPosterUrl(resultFileName);
            movie.setHasImage(true);
        }
        movieService.createMovie(movie);
        return "redirect:/admin/films";
    }

    @GetMapping("/admin/films/{id}")
    public String editMovies(@PathVariable("id") String id, Model model, HttpServletRequest request) {
        try {
            if (movieService.getMovieById(Long.parseLong(id)) != null) {
                model.addAttribute("movie", movieService.getMovieById(Long.parseLong(id)));
                request.setAttribute("movie", movieService.getMovieById(Long.parseLong(id)));
                if (movieService.getMovieById(Long.parseLong(id)).getPosterUrl() != null) {
                    byte[] fileContent = FileUtils.readFileToByteArray(new File(uploadPath + "/" + movieService.getMovieById(Long.parseLong(id)).getPosterUrl()));
                    String image = Base64.getEncoder().encodeToString(fileContent);
                    request.setAttribute("image", image);
                }
                return "/admin/editFilm";
            }
            return "redirect:/admin/films";
        } catch (Exception e) {
            return "redirect:/admin/films";
        }
    }

    @PostMapping("/admin/films/{id}/delete")
    public String deleteMovies(@PathVariable("id") Long id) throws IOException {
        Movie movie = movieService.getMovieById(id);
        movieService.deleteMovie(movie);
        return "redirect:/admin/films";
    }

    @PostMapping("/admin/films/{id}/update")
    public String updateMovies(@PathVariable("id") String id,
                               @ModelAttribute ("movie") Movie movie,
                               @ModelAttribute("releaseDate") String dateOfRelease,
                               @RequestParam("file")MultipartFile file) throws ParseException, IOException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
        Date date = formatter.parse(dateOfRelease);
        movie.setDateOfRelease(date);
        if (file.getBytes().length > 0) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists())
            { uploadDir.mkdir(); }
            String uuidFile = UUID.nameUUIDFromBytes(file.getBytes()).toString();
            String resultFileName = uuidFile + "." + FilenameUtils.getExtension(file.getOriginalFilename());
            file.transferTo(new File(uploadPath + "/" + resultFileName));
            movie.setPosterUrl(resultFileName);
            movie.setHasImage(true);
        }
        else {
            movie.setPosterUrl(movieService.getMovieById(Long.parseLong(id)).getPosterUrl());
            movie.setHasImage(movieService.getMovieById(Long.parseLong(id)).isHasImage());
        }
        movieService.updateMovie(movie);
        return "redirect:/admin/films";
    }

//    CinemaSessions
    @GetMapping("/admin/sessions")
    public String cinemaSessions(Model model) {
        model.addAttribute("cinemaSessions", cinemaSessionService.getAll());
        model.addAttribute("cinemaSession", new CinemaSession());
        model.addAttribute("movies", movieService.getAll());
        model.addAttribute("movieHalls", movieHallService.getAll());
        return "/admin/sessions";
    }

    @PostMapping("/admin/sessions")
    public String addCinemaSession(@ModelAttribute("sessionDateTime") String sessionDateTime,
                                   @ModelAttribute("movieHallId") String movieHallId,
                                   @ModelAttribute("movieId") String movieId,
                                   @ModelAttribute("ticketCost") String ticketCost) throws ParseException {
        String[] data = sessionDateTime.split("T");
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(data[0]);
        stringBuilder.append(" ");
        stringBuilder.append(data[1]);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm", Locale.ENGLISH);
        LocalDateTime localDateTime = LocalDateTime.parse(stringBuilder, formatter);
        MovieHall movieHall = movieHallService.getMovieHallById(Long.parseLong(movieHallId));
        Movie movie = movieService.getMovieById(Long.parseLong(movieId));
        CinemaSession cinemaSession = new CinemaSession(movieHall, movie, localDateTime, Integer.parseInt(ticketCost));
        cinemaSessionService.createCinemaSession(cinemaSession);
        return "redirect:/admin/sessions";
    }

    @GetMapping("/admin/sessions/{id}")
    public String editCinemaSessions(@PathVariable("id") String id, Model model) {
        try {
            if (cinemaSessionService.getCinemaSessionById(Long.parseLong(id)) != null) {
                model.addAttribute("cinemaSession", cinemaSessionService.getCinemaSessionById(Long.parseLong(id)));
                model.addAttribute("movies", movieService.getAll());
                model.addAttribute("movieHalls", movieHallService.getAll());
                return "/admin/editSession";
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
    public String updateCinemaSessions(@PathVariable("id") String id,
                                       @ModelAttribute ("cinemaSessionDateTime") String cinemaSessionDateTime,
                                       @ModelAttribute ("movieHallId") String movieHallId,
                                       @ModelAttribute ("movieId") String movieId,
                                       @ModelAttribute ("ticketCost") String ticketCost) {
        String[] data = cinemaSessionDateTime.split("T");
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(data[0]);
        stringBuilder.append(" ");
        stringBuilder.append(data[1]);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm", Locale.ENGLISH);
        LocalDateTime localDateTime = LocalDateTime.parse(stringBuilder, formatter);
        CinemaSession cinemaSession = cinemaSessionService.getCinemaSessionById(Long.parseLong(id));
        cinemaSession.setDate(localDateTime);
        cinemaSession.setMovie(movieService.getMovieById(Long.parseLong(movieId)));
        cinemaSession.setMovieHall(movieHallService.getMovieHallById(Long.parseLong(movieHallId)));
        cinemaSession.setTicketCost(Integer.parseInt(ticketCost));
        cinemaSessionService.updateCinemaSession(cinemaSession);
        return "redirect:/admin/sessions";
    }
}
