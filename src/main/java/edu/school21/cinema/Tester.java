package edu.school21.cinema;

import edu.school21.cinema.models.CinemaSession;
import edu.school21.cinema.models.Movie;
import edu.school21.cinema.models.MovieHall;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.Date;

public class Tester {
    public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("CinemaUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        MovieHall movieHall = new MovieHall(100);
        Movie movie = new Movie("Очень страшное кино", new Date(), 18, "Комедия");
//        CinemaSession cinemaSession = new CinemaSession(movieHall, movie, new Date(100), 540);
//        CinemaSession cinemaSession1 = new CinemaSession(movieHall, movie, new Date(200), 700);
//        entityManager.getTransaction().begin();
//        entityManager.persist(cinemaSession);
//        entityManager.persist(cinemaSession1);
//        entityManager.getTransaction().commit();
        CinemaSession cinemaSession = entityManager.find(CinemaSession.class, 1L);
        CinemaSession cinemaSession1 = entityManager.find(CinemaSession.class, 2L);
        System.out.println(cinemaSession);
        System.out.println(cinemaSession1);
    }
}
