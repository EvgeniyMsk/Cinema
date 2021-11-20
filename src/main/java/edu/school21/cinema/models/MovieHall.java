package edu.school21.cinema.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class MovieHall {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private int seatsCount;
    @OneToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "session_moviehall",
            joinColumns = @JoinColumn(name = "moviehall_id"),
            inverseJoinColumns = @JoinColumn(name = "session_id"))
    private List<CinemaSession> sessionList;
    public MovieHall(int seatsCount) {
        this.seatsCount = seatsCount;
    }
}
