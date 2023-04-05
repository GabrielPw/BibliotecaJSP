package br.com.gabrielxavier.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Livro {

    Long id;
    String titulo;
    String autor;
    String urlFotoCapa;

    public Livro(Long id, String titulo, String autor, String urlFotoCapa) {
        this.id = id;
        this.titulo = titulo;
        this.autor = autor;
        this.urlFotoCapa = urlFotoCapa;
    }

}
