package com.smd.web_final.model;
import java.util.Currency;
import jakarta.persistence.*;

@Entity
@Table(name = "card_cardset")
public class Card_cardset {
    
    @Column(name = "card_id", nullable = false)
    private Integer card_id;

    @Column(name = "cardset_id", nullable = false)
    private Integer cardset_id;

    @Column(name = "set_name")
    private String set_name;

    @Column(name = "set_code")
    private String set_code;

    @Column(name = "set_rarity")
    private String set_rarity;

    @Column(name = "set_rarity_code")
    private String set_rarity_code;

    @Column(name = "set_price")
    private Currency set_price;

    public Integer getCard_id() {
        return card_id;
    }

    public void setCard_id(Integer card_id) {
        this.card_id = card_id;
    }

    public Integer getCardset_id() {
        return cardset_id;
    }

    public void setCardset_id(Integer cardset_id) {
        this.cardset_id = cardset_id;
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

    public String getSet_rarity() {
        return set_rarity;
    }

    public void setSet_rarity(String set_rarity) {
        this.set_rarity = set_rarity;
    }

    public String getSet_rarity_code() {
        return set_rarity_code;
    }

    public void setSet_rarity_code(String set_rarity_code) {
        this.set_rarity_code = set_rarity_code;
    }

    public Currency getSet_price() {
        return set_price;
    }

    public void setSet_price(Currency set_price) {
        this.set_price = set_price;
    }
    
}
