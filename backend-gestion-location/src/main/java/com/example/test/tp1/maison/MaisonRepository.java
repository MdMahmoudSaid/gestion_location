package com.example.test.tp1.maison;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;


public interface MaisonRepository extends JpaRepository<Maisons,Long> {
   
 List<Maisons> findByIsactiveTrue();
}
