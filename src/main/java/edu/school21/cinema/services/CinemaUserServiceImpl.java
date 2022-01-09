package edu.school21.cinema.services;

import edu.school21.cinema.models.AuthHistory;
import edu.school21.cinema.models.CinemaUser;
import edu.school21.cinema.repositories.CinemaUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public class CinemaUserServiceImpl implements CinemaUserService {
    @Autowired
    private CinemaUserRepository cinemaUserRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

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
    public CinemaUser getCinemaUserByUserName(String username) {
        return cinemaUserRepository.getUserByUsername(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        CinemaUser cinemaUser = cinemaUserRepository.getUserByUsername(username);
        if (cinemaUser == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return cinemaUser;
    }
}
