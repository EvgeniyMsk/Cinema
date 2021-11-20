package edu.school21.cinema.repositories;

import edu.school21.cinema.models.CinemaSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CinemaSessionRepository {
    List<CinemaSession> getAll();
    CinemaSession getCinemaSessionById(Long id);
    void createCinemaSession(CinemaSession cinemaSession);
    void removeCinemaSession(CinemaSession cinemaSession);
}
