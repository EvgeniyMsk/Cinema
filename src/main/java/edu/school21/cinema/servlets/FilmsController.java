package edu.school21.cinema.servlets;

import edu.school21.cinema.models.Movie;
import edu.school21.cinema.services.MovieService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Controller
public class FilmsController {
    private String uploadPath = "/Users/qsymond/Desktop/images";
    @Autowired
    private MovieService movieService;

    @GetMapping("/films")
    public String films(Model model, HttpServletRequest request) throws IOException {
        model.addAttribute("movies", movieService.getAll());
        request.setAttribute("movies", movieService.getAll());
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
        return "/chat/films";
    }

    @GetMapping("/films/{id}/content")
    @ResponseBody
    public byte[] getContent(@PathVariable("id") String id) throws IOException {
        String uploadPath = "/Users/qsymond/Desktop/images";
        Movie movie = movieService.getMovieById(Long.parseLong(id));
        return FileUtils.readFileToByteArray(new File(uploadPath + "/" + movie.getPosterUrl()));
    }

    @GetMapping("/films/{id}/chat")
    public String goChat(@PathVariable("id") String id, Model model, HttpServletRequest request) {
        try {
            if (movieService.getMovieById(Long.parseLong(id)) != null) {
                model.addAttribute("movie", movieService.getMovieById(Long.parseLong(id)));
                request.setAttribute("movie", movieService.getMovieById(Long.parseLong(id)));
                byte[] fileContent = FileUtils.readFileToByteArray(new File(uploadPath + "/" + movieService.getMovieById(Long.parseLong(id)).getPosterUrl()));
                String image = Base64.getEncoder().encodeToString(fileContent);
                request.setAttribute("image", image);
                return "/chat/chat";
            }
            return "redirect:/";
        } catch (Exception e) {
            return "redirect:/";
        }
    }

}
