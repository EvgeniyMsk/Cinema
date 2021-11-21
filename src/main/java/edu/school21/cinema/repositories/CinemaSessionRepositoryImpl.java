package edu.school21.cinema.repositories;

import edu.school21.cinema.models.CinemaSession;
import edu.school21.cinema.models.MovieHall;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class CinemaSessionRepositoryImpl implements CinemaSessionRepository{
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<CinemaSession> getAll() {
        return entityManager.createQuery("from CinemaSession", CinemaSession.class).getResultList();
    }

    @Override
    public CinemaSession getCinemaSessionById(Long id) {
        return entityManager.find(CinemaSession.class, id);
    }

    @Override
    public void createCinemaSession(CinemaSession cinemaSession) {
        entityManager.persist(cinemaSession);
    }

    @Override
    public void updateCinemaSession(CinemaSession cinemaSession) {
        entityManager.merge(cinemaSession);
    }

    @Override
    public void deleteCinemaSession(CinemaSession cinemaSession) {
        CinemaSession persistentInstance = entityManager.merge(cinemaSession);
        entityManager.remove(persistentInstance);
    }
}
