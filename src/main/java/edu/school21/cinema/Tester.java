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
        MovieHall movieHall1 = new MovieHall(200);
        Movie movie = new Movie("Очень страшное кино", new Date(), 18, "Комедия");
        Movie movie1 = new Movie("Mortal Combat", new Date(), 18, "Боевик");
        CinemaSession cinemaSession = new CinemaSession(movieHall, movie, "21.11.2021", 540);
        CinemaSession cinemaSession1 = new CinemaSession(movieHall1, movie1, "22.12.2021", 700);
        entityManager.getTransaction().begin();
        entityManager.persist(cinemaSession);
        entityManager.persist(cinemaSession1);
        entityManager.getTransaction().commit();
    }
}
