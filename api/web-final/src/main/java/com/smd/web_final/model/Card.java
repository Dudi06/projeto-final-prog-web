package com.smd.web_final.model;

import java.util.Currency;

public class Card {
 
    private Integer id;
    private String nome;
    private String type;
    private String humanReadableCardType;
    private String frameType;
    private String desc;
    private String ygoprodeck_url;
    private Currency cardmarket_price;
    private Currency tcgplayer_price;
    private Currency ebay_price;
    private Currency amazon_price;
    private Currency coolstuffinc_price;

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

    public String getYgoprodeck_url() {
        return ygoprodeck_url;
    }

    public void setYgoprodeck_url(String ygoprodeck_url) {
        this.ygoprodeck_url = ygoprodeck_url;
    }

    public Currency getCardmarket_price() {
        return cardmarket_price;
    }

    public void setCardmarket_price(Currency cardmarket_price) {
        this.cardmarket_price = cardmarket_price;
    }

    public Currency getTcgplayer_price() {
        return tcgplayer_price;
    }

    public void setTcgplayer_price(Currency tcgplayer_price) {
        this.tcgplayer_price = tcgplayer_price;
    }

    public Currency getEbay_price() {
        return ebay_price;
    }

    public void setEbay_price(Currency ebay_price) {
        this.ebay_price = ebay_price;
    }

    public Currency getAmazon_price() {
        return amazon_price;
    }

    public void setAmazon_price(Currency amazon_price) {
        this.amazon_price = amazon_price;
    }

    public Currency getCoolstuffinc_price() {
        return coolstuffinc_price;
    }

    public void setCoolstuffinc_price(Currency coolstuffinc_price) {
        this.coolstuffinc_price = coolstuffinc_price;
    }
}
