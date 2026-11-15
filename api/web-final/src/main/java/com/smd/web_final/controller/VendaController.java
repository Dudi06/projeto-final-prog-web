package com.smd.web_final.controller;

import com.smd.web_final.model.Venda;
import com.smd.web_final.repository.VendaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/vendas")
public class VendaController {

    @Autowired
    private VendaRepository vendaRepository;

    @GetMapping
    public List<Venda> listar() {
        return vendaRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Venda> buscar(@PathVariable Integer id) {
        return vendaRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Venda criar(@RequestBody Venda venda) {
        if (venda.getData_hora() == null) {
            venda.setData_hora(LocalDateTime.now());   // 💡
        }
        return vendaRepository.save(venda);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Venda> atualizar(@PathVariable Integer id, @RequestBody Venda venda) {
        if (!vendaRepository.existsById(id)) return ResponseEntity.notFound().build();
        venda.setId(id);
        return ResponseEntity.ok(vendaRepository.save(venda));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Integer id) {
        if (!vendaRepository.existsById(id)) return ResponseEntity.notFound().build();
        vendaRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}