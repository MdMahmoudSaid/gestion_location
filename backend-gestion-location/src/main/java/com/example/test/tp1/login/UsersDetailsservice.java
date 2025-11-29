package com.example.test.tp1.login;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.test.tp1.user.UserRepository;
import com.example.test.tp1.user.Users;
@Service
public class UsersDetailsservice implements UserDetailsService {
    @Autowired
    UserRepository repository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Users user=repository.findByEmail(email).orElseThrow(()-> new UsernameNotFoundException("Cette email ne pas valide"));
        return org.springframework.security.core.userdetails.User.withUsername(email).password(user.getPassword()).roles("USER").build();
    }

}

