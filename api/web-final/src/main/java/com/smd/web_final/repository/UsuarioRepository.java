package com.smd.web_final.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smd.web_final.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {
    Usuario findByLogin(String login);
}