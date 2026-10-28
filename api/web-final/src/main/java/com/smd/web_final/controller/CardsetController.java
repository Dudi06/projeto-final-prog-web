package com.smd.web_final.controller;

import com.smd.web_final.model.Cardset;
import com.smd.web_final.repository.CardsetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/cardsets")
@CrossOrigin(origins = "*")
public class CardsetController {

    @Autowired
    private CardsetRepository cardsetRepository;

    @GetMapping
    public List<Cardset> listar() {
        return cardsetRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Cardset> buscar(@PathVariable Integer id) {
        return cardsetRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Cardset criar(@RequestBody Cardset cardset) {
        return cardsetRepository.save(cardset);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Cardset> atualizar(@PathVariable Integer id, @RequestBody Cardset cardset) {
        if (!cardsetRepository.existsById(id)) return ResponseEntity.notFound().build();
        cardset.setId(id);
        return ResponseEntity.ok(cardsetRepository.save(cardset));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Integer id) {
        if (!cardsetRepository.existsById(id)) return ResponseEntity.notFound().build();
        cardsetRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}