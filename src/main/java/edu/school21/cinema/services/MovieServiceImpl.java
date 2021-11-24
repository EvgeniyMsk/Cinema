package edu.school21.cinema.services;

import edu.school21.cinema.models.Movie;
import edu.school21.cinema.repositories.MovieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.security.Principal;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.util.zip.DataFormatException;
import java.util.zip.Deflater;
import java.util.zip.Inflater;
import java.util.List;

@Service
public class MovieServiceImpl implements MovieService {
    public static final Logger LOG = LoggerFactory.getLogger(MovieServiceImpl.class);

    @Autowired
    private MovieRepository movieRepository;

    @Override
    public List<Movie> getAll() {
        return movieRepository.getAll();
    }

    @Override
    public Movie getMovieById(Long id) {
        return movieRepository.getMovieById(id);
    }

    @Override
    public void createMovie(Movie movie) {
        movieRepository.createMovie(movie);
    }

    @Override
    public void updateMovie(Movie movie) {
        movieRepository.updateMovie(movie);
    }

    @Override
    public void deleteMovie(Movie movie) {
        movieRepository.deleteMovie(movie);
    }
}
