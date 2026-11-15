package com.smd.web_final.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smd.web_final.model.Card;

public interface CardRepository extends JpaRepository<Card, Integer> {
    
}