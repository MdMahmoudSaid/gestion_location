package com.example.test.tp1.register;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.test.tp1.user.UserRepository;
import com.example.test.tp1.user.Users;

@Service
public class RegisterService {

    @Autowired 
    private UserRepository userrepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    public void register(String email,String tel,String rawpassword){
        Optional<Users> existemail= userrepository.findByEmail(email);
        if(existemail.isPresent()){
           throw new IllegalArgumentException("Cette Email est déja pris");
        }
        String encodepassword=passwordEncoder.encode(rawpassword);
        
        Users user= new Users();
        user.setEmail(email);
        user.setTel(tel);
        user.setPassword(passwordEncoder.encode(rawpassword));
        userrepository.save(user);
    }

}
