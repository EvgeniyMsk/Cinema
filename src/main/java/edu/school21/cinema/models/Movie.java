package edu.school21.cinema.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
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
    private String dateOfRelease;
    private int restrictions;
    private String description;
    @OneToMany(mappedBy = "movie",fetch = FetchType.EAGER, orphanRemoval = true)
    private List<CinemaSession> sessions;

    public Movie(String title, String dateOfRelease, int restrictions, String description) {
        this.title = title;
        this.dateOfRelease = dateOfRelease;
        this.restrictions = restrictions;
        this.description = description;
        this.sessions = new ArrayList<>();
    }
}
