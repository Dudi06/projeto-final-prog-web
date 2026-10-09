package com.smd.web_final.model;

import java.util.Currency;

public class Venda_card {
    
    private Integer card_id;
    private Integer venda_id;
    private Currency preco;
    private String quantidade;

    public Integer getCard_id() {
        return card_id;
    }

    public void setCard_id(Integer card_id) {
        this.card_id = card_id;
    }

    public Integer getVenda_id() {
        return venda_id;
    }

    public void setVenda_id(Integer venda_id) {
        this.venda_id = venda_id;
    }

    public Currency getPreco() {
        return preco;
    }

    public void setPreco(Currency preco) {
        this.preco = preco;
    }

    public String getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(String quantidade) {
        this.quantidade = quantidade;
    }

}
