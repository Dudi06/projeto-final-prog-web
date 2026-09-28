package com.smd.web_final.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class Controller {
    @GetMapping("/hello")
    public Map<String, String> hello() {
        return Map.of("message", "Olá da api!");
    }
}