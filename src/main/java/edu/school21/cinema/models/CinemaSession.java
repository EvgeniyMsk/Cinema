package edu.school21.cinema.models;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@NoArgsConstructor
public class CinemaSession {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String date;

    @ManyToOne(cascade = CascadeType.PERSIST)
    private MovieHall movieHall;

    @ManyToOne(cascade = CascadeType.PERSIST)
    private Movie movie;
    private int ticketCost;

    public CinemaSession(MovieHall movieHall, Movie movie, String date, int ticketCost) {
        this.movieHall = movieHall;
        this.movie = movie;
        this.date = date;
        this.ticketCost = ticketCost;
    }

    @Override
    public String toString() {
        return "CinemaSession{" +
                "id=" + id +
                ", date=" + date +
                ", movieHall=" + movieHall.getId() +
                ", movie=" + movie.getTitle() +
                ", ticketCost=" + ticketCost +
                '}';
    }
}
