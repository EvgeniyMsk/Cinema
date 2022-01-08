package edu.school21.cinema;

import edu.school21.cinema.models.AuthHistory;
import edu.school21.cinema.models.CinemaUser;
import edu.school21.cinema.models.roles.ERole;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Tester {
    public static void main(String[] args) {
//        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("CinemaUnit");
//        EntityManager entityManager = entityManagerFactory.createEntityManager();
//        CinemaUser cinemaUser = new CinemaUser("admin", "password", ERole.ADMIN);
//        CinemaUser cinemaUser = entityManager.find(CinemaUser.class, 1L);
//        AuthHistory authHistory = new AuthHistory(cinemaUser, "register", "now", "localhost");
//        AuthHistory authHistory = new AuthHistory(cinemaUser, "auth", "now", "localhost");
//        cinemaUser.getAuthHistory().add(authHistory);
//        entityManager.getTransaction().begin();
//        entityManager.persist(authHistory);
//        entityManager.persist(cinemaUser);
//        entityManager.getTransaction().commit();
    }
}
