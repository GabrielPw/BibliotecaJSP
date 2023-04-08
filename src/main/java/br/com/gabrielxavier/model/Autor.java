package br.com.gabrielxavier.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Autor {

    Long id;
    String nome;
    String descricao;
    String urlFoto;

    public Autor(Long id, String nome, String descricao, String urlFoto) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.urlFoto = urlFoto;
    }
}
