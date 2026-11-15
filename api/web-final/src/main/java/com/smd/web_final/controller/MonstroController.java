package com.smd.web_final.controller;

import com.smd.web_final.model.Monstro;
import com.smd.web_final.repository.MonstroRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/monstros")
public class MonstroController {

    @Autowired
    private MonstroRepository monstroRepository;

    @GetMapping
    public List<Monstro> listar() {
        return monstroRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Monstro> buscar(@PathVariable Integer id) {
        return monstroRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Monstro criar(@RequestBody Monstro monstro) {
        return monstroRepository.save(monstro);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Monstro> atualizar(@PathVariable Integer id, @RequestBody Monstro monstro) {
        if (!monstroRepository.existsById(id)) return ResponseEntity.notFound().build();
        monstro.setId(id);
        return ResponseEntity.ok(monstroRepository.save(monstro));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Integer id) {
        if (!monstroRepository.existsById(id)) return ResponseEntity.notFound().build();
        monstroRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}