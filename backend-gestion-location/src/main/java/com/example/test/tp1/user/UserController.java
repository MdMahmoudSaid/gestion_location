package com.example.test.tp1.user;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;





@RestController
public class UserController {
@Autowired    
private UserService service;

@PostMapping
public void add(@RequestBody Users x) {
    service.insert(x);
}
@GetMapping("get")
public List<Users> Get(){
   return service.AllUsers();
}
@DeleteMapping("delete/{id}")
public Map<String,String> delete(@PathVariable Integer id){
       return service.delete(id);
}

@GetMapping("findByid/{id}")
public Map<String,Object> Get(@PathVariable Integer id) {
    return service.store(id);
}

@PutMapping("update/{id}")
public Map<String,Object> putMethodName(@PathVariable Integer id, @RequestBody Users x) {

    return service.Update(x, id);
}

@GetMapping("user/maisons/{id}")
public Map<String,Object> maisons(@PathVariable int id) {
    return service.getmaison(id);
}




}
