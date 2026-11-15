package com.smd.web_final.model;

import java.math.BigDecimal;
import jakarta.persistence.*;

@Entity
@Table(
        name = "venda_card",
        uniqueConstraints = @UniqueConstraint(
                name = "uk_venda_card",
                columnNames = {"card_id", "venda_id"}
        )
)
public class Venda_card {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "card_id", nullable = false)
    private Integer card_id;

    @Column(name = "venda_id", nullable = false)
    private Integer venda_id;

    @Column(name = "preco")
    private BigDecimal preco;

    @Column(name = "quantidade")
    private Integer quantidade;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

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

    public BigDecimal getPreco() {
        return preco;
    }

    public void setPreco(BigDecimal preco) {
        this.preco = preco;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

}
