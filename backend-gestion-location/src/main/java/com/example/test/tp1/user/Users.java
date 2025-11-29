package com.example.test.tp1.user;

import java.util.List;

import com.example.test.tp1.maison.Maisons;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Users {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
private boolean isactive;
private String email;
private String tel;
private String password;
@OneToMany(mappedBy="users",cascade = CascadeType.ALL)
private List<Maisons> maisons;

public void ajoutmaison(Maisons maison){
  maisons.add(maison);
  maison.setUsers(this);
}
}
