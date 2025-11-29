package com.example.test.tp1.maison;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
@AllArgsConstructor
@Setter
@Getter
public class MaisonReponse {
    private Long id;
    private String localisation;
    private double prix;
    private String description;
    private double altitude;
    private double longitude;   
    private List<String> images;
    private String tel;
}
