package com.smd.web_final.controller;

import com.smd.web_final.model.Venda_card;
import com.smd.web_final.repository.Venda_cardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/venda-cards")
@CrossOrigin(origins = "*")
public class Venda_cardController {

    @Autowired
    private Venda_cardRepository vendaCardRepository;

    @GetMapping
    public List<Venda_card> listar() {
        return vendaCardRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Venda_card> buscar(@PathVariable Integer id) {
        return vendaCardRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Venda_card criar(@RequestBody Venda_card vc) {
        return vendaCardRepository.save(vc);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Venda_card> atualizar(@PathVariable Integer id, @RequestBody Venda_card vc) {
        if (!vendaCardRepository.existsById(id)) return ResponseEntity.notFound().build();
        vc.setId(id);
        return ResponseEntity.ok(vendaCardRepository.save(vc));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Integer id) {
        if (!vendaCardRepository.existsById(id)) return ResponseEntity.notFound().build();
        vendaCardRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}