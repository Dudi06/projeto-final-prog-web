package com.smd.web_final.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smd.web_final.model.Monstro;

public interface MonstroRepository extends JpaRepository<Monstro, Integer> {
    
}