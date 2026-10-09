package com.smd.web_final.model;

public class Cardset {
    
    private Integer id;
    private String set_name;
    private String set_code;
    private Integer num_of_cards;
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
