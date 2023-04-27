package br.com.gabrielxavier.model;

import br.com.gabrielxavier.database.DatabaseConnection;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
public class Autor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    String nome;
    @Column(name = "descricao", columnDefinition = "TEXT")
    String descricao;
    @Column(name = "urlFoto", columnDefinition = "TEXT")
    String urlFoto;

    @OneToMany(mappedBy = "autor", fetch = FetchType.EAGER)
    List<Livro>  livros  = new ArrayList<>();

    public Autor() {
    }

    public Autor(String nome, String descricao, String urlFoto) {
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


    static public List<Autor> getAllAutores() {
        EntityManager em = DatabaseConnection.getEntityManagerFactory().createEntityManager();
        List<Autor> autores = em.createQuery("SELECT a FROM Autor a", Autor.class).getResultList();
        em.close();
        return autores;
    }

    static public List<Autor> getRecomendados(int numeroDeAutores) {
        EntityManager em = DatabaseConnection.getEntityManagerFactory().createEntityManager();
        List<Autor> autor = em.createQuery("SELECT a FROM Autor a ORDER BY RAND()", Autor.class)
                .setMaxResults(numeroDeAutores)
                .getResultList();
        em.close();
        return autor;
    }
}
