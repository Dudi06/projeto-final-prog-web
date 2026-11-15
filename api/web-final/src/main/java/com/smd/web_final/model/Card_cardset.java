package com.smd.web_final.model;

import java.math.BigDecimal;
import jakarta.persistence.*;

@Entity
@Table(
        name = "card_cardset",
        uniqueConstraints = @UniqueConstraint(
                name = "uk_card_cardset",
                columnNames = {"card_id", "cardset_id"}
        )
)
public class Card_cardset {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

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
    private BigDecimal set_price;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

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

    public BigDecimal getSet_price() {
        return set_price;
    }

    public void setSet_price(BigDecimal set_price) {
        this.set_price = set_price;
    }
    
}
