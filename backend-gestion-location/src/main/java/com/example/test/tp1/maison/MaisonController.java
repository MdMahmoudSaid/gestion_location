package com.example.test.tp1.maison;

import org.springframework.web.bind.annotation.RestController;



import java.io.IOException;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;





@RestController
@RequestMapping("api/auth/maison")
public class MaisonController {

    @Autowired 
    private MaisonService service;

    @PostMapping(value = "ajout/{user_id}",consumes = "multipart/form-data")
    public ResponseEntity<?> postMethodName(@PathVariable int user_id, @ModelAttribute MaisonDTO maisons) {
        try{
        service.add(
        user_id,maisons.getLocalisation(),maisons.getPrix(),maisons.getDescription(),maisons.getAltitude(),maisons.getLongitude(),maisons.getImages());
        return ResponseEntity.ok().body("Maison crees avec succes !");
    }
        catch(IOException e){
           return ResponseEntity.status(500).body("Erreur lors de la creation de maison"+e.getMessage());
        }
    }

        @GetMapping("Affiche/{user_id}")
        public ResponseEntity<?> Afficher(@PathVariable int user_id){
            return service.AfficheSerice(user_id);
        }

        @GetMapping("All")
        public ResponseEntity<?> getAll() {
            return service.Allservice();
        }
        @GetMapping("find/{id}")
        public ResponseEntity<?> getMethodName(@PathVariable Long id) {
            return service.find(id);
        }
                

        @DeleteMapping("delete/{id}")
        public void delete(@PathVariable Long id){
            service.deleteservice(id);

        }

        @PatchMapping(value = "modifier/{id}",consumes="multipart/form-data")
        public ResponseEntity<?> modifier(@PathVariable Long id,@ModelAttribute MaisonDTO reponse){
           try{
            service.Modifierservice(id, reponse.getLocalisation(), reponse.getPrix(), reponse.getDescription(), reponse.getAltitude(), reponse.getLongitude(), reponse.getImages());
            return ResponseEntity.ok().body("Maison modifier avec succes");
           }catch(Exception e){
            return ResponseEntity.status(500).body("Erreur lors de la creation de maison"+e.getMessage());
           }
        }

        
}


    


    


