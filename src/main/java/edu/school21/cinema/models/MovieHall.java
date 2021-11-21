package edu.school21.cinema.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
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
    @OneToMany(mappedBy = "movieHall", fetch = FetchType.EAGER, orphanRemoval = true)
    private List<CinemaSession> sessionList;
    public MovieHall(int seatsCount) {
        this.seatsCount = seatsCount;
        this.sessionList = new ArrayList<>();
    }
}
