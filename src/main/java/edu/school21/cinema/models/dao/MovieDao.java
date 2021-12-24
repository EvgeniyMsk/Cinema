package edu.school21.cinema.models.dao;

import edu.school21.cinema.models.Movie;
import lombok.Data;

@Data
public class MovieDao {
    private String name;
    private String posterUrl;

    public MovieDao(Movie movie) {
        this.name = movie.getTitle();
        this.posterUrl = movie.getPosterUrl();
    }
}
