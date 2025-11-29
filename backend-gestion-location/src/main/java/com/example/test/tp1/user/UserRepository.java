package com.example.test.tp1.user;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;


public interface UserRepository extends JpaRepository<Users,Integer>{
     
    Optional<Users> findByEmail(String email);
}
