package com.smd.web_final.controller;

import com.smd.web_final.model.Usuario;
import com.smd.web_final.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

//lidar com a senha sendo devolvida no get/post

@RestController
@RequestMapping("/api/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @GetMapping
    public List<Usuario> listar() {
        return usuarioRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Usuario> buscar(@PathVariable Integer id) {
        return usuarioRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/login/{login}")
    public ResponseEntity<Usuario> buscarPorLogin(@PathVariable String login) {
        Usuario u = usuarioRepository.findByLogin(login);
        return (u != null) ? ResponseEntity.ok(u) : ResponseEntity.notFound().build();
    }

    @PostMapping
    public Usuario criar(@RequestBody Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Usuario> atualizar(@PathVariable Integer id, @RequestBody Usuario usuario) {
        return usuarioRepository.findById(id)
                .map(existente -> {
                    // Campos que o cliente DEVE poder alterar, deixa administrador de fora
                    if (usuario.getNome()     != null) existente.setNome(usuario.getNome());
                    if (usuario.getEmail()    != null) existente.setEmail(usuario.getEmail());
                    if (usuario.getEndereco() != null) existente.setEndereco(usuario.getEndereco());
                    if (usuario.getLogin()    != null) existente.setLogin(usuario.getLogin());
                    if (usuario.getSenha()    != null) existente.setSenha(usuario.getSenha());

                    return ResponseEntity.ok(usuarioRepository.save(existente));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Integer id) {
        if (!usuarioRepository.existsById(id)) return ResponseEntity.notFound().build();
        usuarioRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}