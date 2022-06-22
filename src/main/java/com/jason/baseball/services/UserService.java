package com.jason.baseball.services;

import com.jason.baseball.models.LoginUser;
import com.jason.baseball.models.User;
import com.jason.baseball.repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.Optional;

@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;


    public User register(User newUser, BindingResult result) {
        Optional<User> possibleUser = userRepository.findByEmail(newUser.getEmail());

        if(possibleUser.isPresent()) {
            result.rejectValue("email", "Matches", "That email is already taken");

        }
        if(!newUser.getPassword().equals(newUser.getConfirm())){
            result.rejectValue("confirm", "Matches", "Your password's don't match");

        }
        if(result.hasErrors()) {
            return null;
        }

        String hashedPW = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashedPW);
        return userRepository.save(newUser);
    }

    public User login(LoginUser newLogin, BindingResult result) {

        Optional<User> possibleUser = userRepository.findByEmail(newLogin.getEmail());

        if(!possibleUser.isPresent()) {
            result.rejectValue("email", "Match", "Please enter a correct email and password");
            return null;
        }
        User user = possibleUser.get();
        if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
            result.rejectValue("email", "Match", "Please enter a correct email and password");
        }

        if(result.hasErrors()) {
            return null;
        }

        return user;


    }
    public User findById(Long id) {
        Optional<User> possibleUser = userRepository.findById(id);
        if(possibleUser.isPresent()) {
            return possibleUser.get();
        }
        return null;


    }
}
