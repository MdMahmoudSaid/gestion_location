package com.example.test.tp1.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class MaisonDTO {
    private Long id;
    private String localisation;
    private double prix;
    private String description;
}
