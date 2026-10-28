package com.smd.web_final.controller;

import com.smd.web_final.model.Card;
import com.smd.web_final.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/cards")
@CrossOrigin(origins = "*")
public class CardController {

    @Autowired
    private CardRepository cardRepository;

    @GetMapping
    public List<Card> listar() {
        return cardRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Card> buscar(@PathVariable Integer id) {
        return cardRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Card criar(@RequestBody Card card) {
        return cardRepository.save(card);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Card> atualizar(@PathVariable Integer id, @RequestBody Card card) {
        if (!cardRepository.existsById(id)) return ResponseEntity.notFound().build();
        card.setId(id);
        return ResponseEntity.ok(cardRepository.save(card));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Integer id) {
        if (!cardRepository.existsById(id)) return ResponseEntity.notFound().build();
        cardRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}