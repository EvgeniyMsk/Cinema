package edu.school21.cinema.services;

import edu.school21.cinema.models.AuthHistory;
import edu.school21.cinema.models.CinemaUser;
import edu.school21.cinema.repositories.CinemaUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public class CinemaUserServiceImpl implements CinemaUserService {
    @Autowired
    private CinemaUserRepository cinemaUserRepository;

    @Override
    public List<CinemaUser> getAll() {
        return cinemaUserRepository.getAll();
    }

    @Override
    public CinemaUser getCinemaUserById(Long id) {
        return cinemaUserRepository.getUserById(id);
    }

    @Override
    public boolean createCinemaUser(CinemaUser cinemaUser) {
        return cinemaUserRepository.createUser(cinemaUser);
    }

    @Override
    public void updateCinemaUser(CinemaUser cinemaUser) {
        cinemaUserRepository.updateUser(cinemaUser);
    }

    @Override
    public void deleteCinemaUser(CinemaUser cinemaUser) {
        cinemaUserRepository.deleteUser(cinemaUser);
    }

    @Override
    public boolean authorize(CinemaUser cinemaUser, HttpServletRequest request) {
        CinemaUser temp = cinemaUserRepository.getUserByUsername(cinemaUser.getUserName());
        if (temp != null)
        {
            boolean isSuccess = temp.getPassword().equals(cinemaUser.getPassword());
            if (isSuccess)
            {
                temp.getAuthHistory().add(new AuthHistory(temp, "authorize", new Date().toString(), request.getRemoteAddr()));
                updateCinemaUser(temp);
            }
            return isSuccess;
        }
        return false;
    }

    @Override
    public CinemaUser getCinemaUserByUserName(String username) {
        return cinemaUserRepository.getUserByUsername(username);
    }
}
