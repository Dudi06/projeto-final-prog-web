package com.smd.web_final.controller;

import com.smd.web_final.model.Card_cardset;
import com.smd.web_final.repository.Card_cardsetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/card-cardsets")
@CrossOrigin(origins = "*")
public class Card_cardsetController {

    @Autowired
    private Card_cardsetRepository cardCardsetRepository;

    @GetMapping
    public List<Card_cardset> listar() {
        return cardCardsetRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Card_cardset> buscar(@PathVariable Integer id) {
        return cardCardsetRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Card_cardset criar(@RequestBody Card_cardset cc) {
        return cardCardsetRepository.save(cc);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Card_cardset> atualizar(@PathVariable Integer id, @RequestBody Card_cardset cc) {
        if (!cardCardsetRepository.existsById(id)) return ResponseEntity.notFound().build();
        cc.setId(id);
        return ResponseEntity.ok(cardCardsetRepository.save(cc));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Integer id) {
        if (!cardCardsetRepository.existsById(id)) return ResponseEntity.notFound().build();
        cardCardsetRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}