package com.smd.web_final.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smd.web_final.model.Cardset;

public interface CardsetRepository extends JpaRepository<Cardset, Integer> {
    
}