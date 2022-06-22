package com.jason.baseball.controllers;

import com.jason.baseball.models.LoginUser;
import com.jason.baseball.models.Player;
import com.jason.baseball.models.User;
import com.jason.baseball.services.PlayerService;
import com.jason.baseball.services.TeamService;
import com.jason.baseball.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
@Controller
public class PlayerController {

    @Autowired
    private PlayerService playerService;

    @Autowired
    private TeamService teamService;

    @Autowired
    private UserService userService;

    @GetMapping("/home")
    public String players(Model model) {

        model.addAttribute("allPlayers", playerService.getAll());

        return "players.jsp";
    }

    @GetMapping("/players/new")
    public String newPlayer(@ModelAttribute("newPlayer") Player newPlayer, Model model) {
        model.addAttribute("allTeams", teamService.getAll());

        return "newPlayer.jsp";
    }

    @PostMapping("/players/create")
    public String createPlayer(@Valid @ModelAttribute("newPlayer") Player newPlayer, BindingResult result) {

        if(result.hasErrors()) {
            return "newPlayer.jsp";
        }

        playerService.create(newPlayer);

        return "redirect:/home";
    }

    @GetMapping("/players/{id}")
    public String profile(@PathVariable Long id, Model model) {
        model.addAttribute("player", playerService.getById(id));

        return "profile.jsp";
    }

    //Rendering the update page
    @GetMapping("/players/{id}/edit")
    public String editPlayer(@PathVariable Long id, @ModelAttribute("editPlayer") Player editPlayer, Model model) {
        model.addAttribute("player", playerService.getById(id));

        return "editPlayer.jsp";
    }

    @PutMapping("/players/{id}/update")
    public String updatePlayer(@Valid @ModelAttribute("editPlayer")Player editPlayer, BindingResult result, Model model) {

        if(result.hasErrors()) {
            model.addAttribute(editPlayer);
            return "editPlayer.jsp";
        }

        playerService.update(editPlayer);
        return "redirect:/home";
    }

    @DeleteMapping("players/{id}/destroy")
    public String destroyPlayer(@PathVariable Long id) {

        playerService.deleteById(id);


        return "redirect:/home";
    }

    @GetMapping("/")
    public String index(Model model) {

        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser,
                           BindingResult result, Model model, HttpSession session) {


        User user = userService.register(newUser, result);



        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }

        session.setAttribute("userId", user.getId());


        return "redirect:/home";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
                        BindingResult result, Model model, HttpSession session) {
        User user = userService.login(newLogin, result);
        // Add once service is implemented:
        // User user = userServ.login(newLogin, result);

        if(result.hasErrors() || user == null) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }

        session.setAttribute("userId", user.getId());

        return "redirect:/home";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();

//    	session.setAttribute("userId", null);
        return "redirect:/";
    }

}

