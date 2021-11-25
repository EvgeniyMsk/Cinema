package edu.school21.cinema.models;

import edu.school21.cinema.models.roles.ERole;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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

    public CinemaUser(String userName, String password, ERole role) {
        this.userName = userName;
        this.password = password;
        this.role = role;
    }
}
