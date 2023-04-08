package br.com.gabrielxavier.model;

import br.com.gabrielxavier.enuns.CategoriaLivroEnum;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Livro {

    Long id;
    String titulo;
    List<CategoriaLivroEnum> categorias;
    String autor;
    String urlFotoCapa;

    public Livro(Long id, String titulo, String autor, String urlFotoCapa, List<CategoriaLivroEnum> categorias) {
        this.id = id;
        this.titulo = titulo;
        this.autor = autor;
        this.urlFotoCapa = urlFotoCapa;
        this.categorias = categorias;
    }

}
