package com.jason.baseball.services;

import com.jason.baseball.models.Player;
import com.jason.baseball.repositories.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
@Service
public class PlayerService {

    @Autowired
    private PlayerRepository playerRepository;

    public List<Player> getAll() {

        return playerRepository.findAll();
    }

    public Player create(Player newPlayer) {

        return playerRepository.save(newPlayer);
    }

    public Player getById(Long id) {

        return playerRepository.findById(id).orElse(null);
    }

    public Player update(Player editPlayer) {
        return playerRepository.save(editPlayer);
    }

    public void deleteById(Long id) {
        playerRepository.deleteById(id);
    }


}
