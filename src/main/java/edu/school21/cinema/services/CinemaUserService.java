package edu.school21.cinema.services;

import edu.school21.cinema.models.CinemaUser;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public interface CinemaUserService {
    List<CinemaUser> getAll();
    CinemaUser getCinemaUserById(Long id);
    CinemaUser getCinemaUserByUserName(String username);
    boolean createCinemaUser(CinemaUser cinemaUser);
    void updateCinemaUser(CinemaUser cinemaUser);
    void deleteCinemaUser(CinemaUser cinemaUser);
    boolean authorize(CinemaUser cinemaUser, HttpServletRequest request);
}
