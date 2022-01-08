package edu.school21.cinema.repositories;

import edu.school21.cinema.models.roles.ERole;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import java.util.List;

@Repository
@Transactional
public class RoleRepositoryImpl implements RoleRepository{
    @PersistenceContext(type = PersistenceContextType.TRANSACTION)
    private EntityManager entityManager;

    public List<ERole> getAll() {
        return entityManager.createQuery("from ERole", ERole.class).getResultList();
    }

    @Override
    public ERole getRoleByName(String roleName) {
        for (ERole role : getAll())
            if (role.getName().equals(roleName))
                return role;
        return null;
    }
}
