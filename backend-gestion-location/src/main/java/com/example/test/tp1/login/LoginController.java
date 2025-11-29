package com.example.test.tp1.login;

import java.util.HashMap;
import java.util.Map;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.test.tp1.user.UserRepository;
import com.example.test.tp1.user.Users;

@RestController
@RequestMapping("/api/auth")
public class LoginController {
    @Autowired 
    private UserRepository userrepository;
     @Autowired
     private AuthenticationManager authenticationManager;
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest request){
        try{
            authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getEmail(),request.getPassword())
            );
            Users user =userrepository.findByEmail(request.getEmail()).get();
            int id=user.getId();
            String tel =user.getTel();
            String email=user.getEmail();
            Map<String,Object> map =new HashMap<>();
            map.put("message", "Connection avec succes");
            map.put("user_id", id);
            map.put("tel", tel);
            map.put("email", email);
            // Ensure frontend receives an empty list (not null) if user has no maisons
            map.put("maisons", user.getMaisons() == null ? Collections.emptyList() : user.getMaisons());
            return ResponseEntity.ok().body(map);
        } catch(Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
       
    }
}
