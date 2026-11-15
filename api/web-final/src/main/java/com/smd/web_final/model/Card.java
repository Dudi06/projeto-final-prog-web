package com.smd.web_final.model;
import java.math.BigDecimal;
import jakarta.persistence.*;

@Entity
@Table(name = "card")
public class Card {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;
    
    @Column(name = "nome")
    private String nome;

    @Column(name = "type")
    private String type;

    @Column(name = "\"humanReadableCardType\"")
    private String humanReadableCardType;

    @Column(name = "\"frameType\"")
    private String frameType;

    @Column(name = "\"desc\"")
    private String desc;

    @Column(name = "race")
    private String race;

    @Column(name = "ygoprodeck_url")
    private String ygoprodeck_url;

    @Column(name = "cardmarket_price")
    private BigDecimal cardmarket_price;
    
    @Column(name = "tcgplayer_price")
    private BigDecimal tcgplayer_price;
    
    @Column(name = "ebay_price")
    private BigDecimal ebay_price;
    
    @Column(name = "amazon_price")
    private BigDecimal amazon_price;
    
    @Column(name = "coolstuffinc_price")
    private BigDecimal coolstuffinc_price;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getHumanReadableCardType() {
        return humanReadableCardType;
    }

    public void setHumanReadableCardType(String humanReadableCardType) {
        this.humanReadableCardType = humanReadableCardType;
    }

    public String getFrameType() {
        return frameType;
    }

    public void setFrameType(String frameType) {
        this.frameType = frameType;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getRace() { return race; }

    public void setRace(String race) { this.race = race; }

    public String getYgoprodeck_url() {
        return ygoprodeck_url;
    }

    public void setYgoprodeck_url(String ygoprodeck_url) {
        this.ygoprodeck_url = ygoprodeck_url;
    }

    public BigDecimal getCardmarket_price() {
        return cardmarket_price;
    }

    public void setCardmarket_price(BigDecimal cardmarket_price) {
        this.cardmarket_price = cardmarket_price;
    }

    public BigDecimal getTcgplayer_price() {
        return tcgplayer_price;
    }

    public void setTcgplayer_price(BigDecimal tcgplayer_price) {
        this.tcgplayer_price = tcgplayer_price;
    }

    public BigDecimal getEbay_price() {
        return ebay_price;
    }

    public void setEbay_price(BigDecimal ebay_price) {
        this.ebay_price = ebay_price;
    }

    public BigDecimal getAmazon_price() {
        return amazon_price;
    }

    public void setAmazon_price(BigDecimal amazon_price) {
        this.amazon_price = amazon_price;
    }

    public BigDecimal getCoolstuffinc_price() {
        return coolstuffinc_price;
    }

    public void setCoolstuffinc_price(BigDecimal coolstuffinc_price) {
        this.coolstuffinc_price = coolstuffinc_price;
    }
}
