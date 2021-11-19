package edu.school21.cinema;

import edu.school21.cinema.models.MovieHall;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Tester {
    public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("CinemaUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        MovieHall movieHall = new MovieHall(123);
        entityManager.getTransaction().begin();
        entityManager.persist(movieHall);
        entityManager.getTransaction().commit();
    }
}
