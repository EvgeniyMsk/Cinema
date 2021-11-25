package edu.school21.cinema.services;

import edu.school21.cinema.models.CinemaUser;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CinemaUserService {
    List<CinemaUser> getAll();
    CinemaUser getCinemaUserById(Long id);
    void createCinemaUser(CinemaUser cinemaUser);
    void updateCinemaUser(CinemaUser cinemaUser);
    void deleteCinemaUser(CinemaUser cinemaUser);
}
