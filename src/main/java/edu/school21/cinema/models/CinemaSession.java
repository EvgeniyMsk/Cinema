package edu.school21.cinema.models;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@Entity
@NoArgsConstructor
public class CinemaSession {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Date date;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinTable(name = "session_moviehall",
    joinColumns = @JoinColumn(name = "session_id"),
    inverseJoinColumns = @JoinColumn(name = "moviehall_id"))
    private MovieHall movieHall;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinTable(name = "session_movie",
            joinColumns = @JoinColumn(name = "session_id"),
            inverseJoinColumns = @JoinColumn(name = "movie_id"))
    private Movie movie;
    private int ticketCost;

    public CinemaSession(MovieHall movieHall, Movie movie, Date date, int ticketCost) {
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
