package br.com.gabrielxavier.model;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class Autor {

    Long id;
    String nome;
    String descricao;
    String urlFoto;
    List<Livro> livros  = new ArrayList<>();

    public Autor(Long id, String nome, String descricao, String urlFoto) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.urlFoto = urlFoto;

    }

    public void addLivros(List<Livro> livros){

        this.livros = livros;
    }

    public void addLivro(Livro livro){

        this.livros.add(livro);
    }
}
