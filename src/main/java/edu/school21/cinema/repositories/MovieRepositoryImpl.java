package edu.school21.cinema.repositories;

import edu.school21.cinema.models.CinemaSession;
import edu.school21.cinema.models.Movie;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import java.util.List;

@Repository
@Transactional
public class MovieRepositoryImpl implements MovieRepository{
    @PersistenceContext(type = PersistenceContextType.TRANSACTION)
    private EntityManager entityManager;

    @Override
    public List<Movie> getAll() {
        return entityManager.createQuery("from Movie", Movie.class).getResultList();
    }

    @Override
    public Movie getMovieById(Long id) {
        return entityManager.find(Movie.class, id);
    }

    @Override
    public void createMovie(Movie movie) {
        entityManager.merge(movie);
    }

    @Override
    public void updateMovie(Movie movie) {
        Movie temp = entityManager.find(Movie.class, movie.getId());
        if (temp != null) {
            movie.setSessions(temp.getSessions());
            entityManager.merge(movie);
        }
    }

    @Override
    public void deleteMovie(Movie movie) {
        Movie persistentInstance = entityManager.find(Movie.class, movie.getId());
        entityManager.remove(persistentInstance);
    }

}
