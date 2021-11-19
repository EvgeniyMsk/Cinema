package edu.school21.cinema.repositories;

import edu.school21.cinema.models.Movie;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface MovieRepository {
    List<Movie> getAll();
    Movie getMovieById(Long id);
    void createMovie(String title, Date dateOfRelease, int restrictions, String description);
    void updateMovie(Movie movieHall);
    void deleteMovie(Long id);
}
