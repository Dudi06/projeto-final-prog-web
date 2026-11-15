package com.smd.web_final.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smd.web_final.model.Venda;

public interface VendaRepository extends JpaRepository<Venda, Integer> {
    
}