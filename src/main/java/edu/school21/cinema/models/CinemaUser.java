package edu.school21.cinema.models;

import edu.school21.cinema.models.roles.ERole;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CinemaUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String userName;
    private String password;
    private ERole role;
    @OneToMany(mappedBy = "cinemaUser", cascade = CascadeType.MERGE, fetch = FetchType.EAGER, orphanRemoval = true)
    private List<AuthHistory> authHistory;

    public CinemaUser(String userName, String password, ERole role) {
        this.userName = userName;
        this.password = password;
        this.role = role;
        this.authHistory = new ArrayList<>();
    }
}
