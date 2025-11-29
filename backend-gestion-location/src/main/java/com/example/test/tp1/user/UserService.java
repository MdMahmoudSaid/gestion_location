package com.example.test.tp1.user;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class UserService {
@Autowired
private UserRepository repository;

public String
 insert(Users x){
    
    if (x == null) {
        return "Aucun utilisateur reçu !";
    } else {
        repository.save(x);
        return "Utilisateur reçu : " + x;
        
    }
}

public List<Users> AllUsers(){
    List<Users> users =repository.findAll();
    return users;
}

public Map<String,String> delete(Integer id){
    Map<String,String> reponse= new HashMap<>();
    Optional<Users> user=repository.findById(id);
    if(user.isPresent()){
        repository.deleteById(id);
        reponse.put("message","Utilisateur supprimé avec succès.");
    }else{
        reponse.put("message", "Cet utilisateur n'est pas présent.") ;
    }
    return reponse;

   
}
public Map<String,Object> store(Integer id){

    Map<String,Object> reponse = new HashMap<>();
    Optional<Users> user =repository.findById(id);
    if(user.isPresent()){
        reponse.put("user",user.get());
        reponse.put("massage", "Utilisateur trouvé avec succès.");
    }else{
        reponse.put("message","Cet utilisateur n'est pas présent.");
        
    }

    return reponse;

}
public Map<String,Object> Update(Users x,Integer id){
    Map<String,Object> reponse = new HashMap<>();
    Optional<Users> existinguser =repository.findById(id);
    if(existinguser.isPresent()){
        Users user=existinguser.get();
        user.setEmail(x.getEmail());
        user.setPassword(x.getPassword());
        repository.save(user);
        reponse.put("massage", "Utilisateur Modifier avec succès.");
    }else{
        reponse.put("message","Cet utilisateur n'est pas présent.");
        
    }

    return reponse;
}


public Map<String,Object> getmaison(int id){
    Map<String,Object> reponse=new HashMap<>();
    Optional<Users> user=repository.findById(id);
    if(user.isPresent()){
        List<MaisonDTO> maisons =user.get().getMaisons().stream().map(maison->new MaisonDTO(maison.getId(),maison.getLocalisation(),maison.getPrix(),maison.getDescription())).toList();
        reponse.put("maison",maisons);
        
    }else{
        reponse.put("message", "Cet utilisateur n'est pas présent.");
    }
    return reponse;
}



}
