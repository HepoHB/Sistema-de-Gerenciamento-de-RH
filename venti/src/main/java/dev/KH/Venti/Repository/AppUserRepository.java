package dev.KH.Venti.Repository;

import dev.KH.Venti.Model.AppUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AppUserRepository extends JpaRepository<AppUser, Long> {


}
