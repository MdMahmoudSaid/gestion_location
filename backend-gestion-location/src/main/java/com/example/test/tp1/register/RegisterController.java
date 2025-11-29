package com.example.test.tp1.register;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;


@RestController
@RequestMapping("/api/auth")
public class RegisterController {
    @Autowired
    private RegisterService service;

    @PostMapping("/register")
    public ResponseEntity<Object> register(@RequestBody RegisterRequest request) {
      try {
         service.register(request.getEmail(), request.getTel(), request.getPassword());
         return ResponseEntity.ok(Map.of("message", "Utilisateur inscrit avec succès !"));
      } catch (Exception e) {
         return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
      }
   }

}
