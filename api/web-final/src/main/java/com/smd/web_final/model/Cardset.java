package com.smd.web_final.model;
import jakarta.persistence.*;

@Entity
@Table(name = "cardset")
public class Cardset {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "set_name")
    private String set_name;
    
    @Column(name = "set_code")
    private String set_code;

    @Column(name = "num_of_cards")
    private Integer num_of_cards;

    @Column(name = "set_image")
    private String set_image;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSet_name() {
        return set_name;
    }

    public void setSet_name(String set_name) {
        this.set_name = set_name;
    }

    public String getSet_code() {
        return set_code;
    }

    public void setSet_code(String set_code) {
        this.set_code = set_code;
    }

    public Integer getNum_of_cards() {
        return num_of_cards;
    }

    public void setNum_of_cards(Integer num_of_cards) {
        this.num_of_cards = num_of_cards;
    }

    public String getSet_image() {
        return set_image;
    }

    public void setSet_image(String set_image) {
        this.set_image = set_image;
    }


}
