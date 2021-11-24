package edu.school21.cinema.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Type;

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
    private Date dateOfRelease;
    private int restrictions;
    private String description;
    @Lob
    @Type(type = "org.hibernate.type.BinaryType")
    public byte[] imageBytes;
    @OneToMany(mappedBy = "movie",cascade = CascadeType.MERGE, fetch = FetchType.EAGER, orphanRemoval = true)
    @JsonIgnore
    private List<CinemaSession> sessions;

    public Movie(String title, Date dateOfRelease, int restrictions, String description) {
        this.title = title;
        this.dateOfRelease = dateOfRelease;
        this.restrictions = restrictions;
        this.description = description;
        this.sessions = new ArrayList<>();
    }
}
