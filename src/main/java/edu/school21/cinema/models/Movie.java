package edu.school21.cinema.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Movie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private Date dateOfRelease;
    private int restrictions;
    private String description;
    @OneToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "session_movie",
            joinColumns = @JoinColumn(name = "movie_id"),
            inverseJoinColumns = @JoinColumn(name = "session_id"))
    private List<CinemaSession> sessions;

    public Movie(String title, Date dateOfRelease, int restrictions, String description) {
        this.title = title;
        this.dateOfRelease = dateOfRelease;
        this.restrictions = restrictions;
        this.description = description;
    }


}
