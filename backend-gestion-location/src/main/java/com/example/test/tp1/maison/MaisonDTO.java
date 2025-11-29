package com.example.test.tp1.maison;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class MaisonDTO {
    private String localisation;
    private double prix;
    private String description;
    private double altitude;
    private double longitude; 
    private List<MultipartFile> images;
}
