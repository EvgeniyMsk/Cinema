package edu.school21.cinema.repositories;

import edu.school21.cinema.models.CinemaSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CinemaSessionRepositoryImpl implements CinemaSessionRepository{
    @Override
    public List<CinemaSession> getAll() {
        return null;
    }

    @Override
    public CinemaSession getCinemaSessionById(Long id) {
        return null;
    }

    @Override
    public void removeCinemaSession(CinemaSession session) {

    }
}
