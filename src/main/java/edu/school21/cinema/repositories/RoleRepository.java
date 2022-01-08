package edu.school21.cinema.repositories;

import edu.school21.cinema.models.roles.ERole;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository {
    ERole getRoleByName(String roleName);
}
