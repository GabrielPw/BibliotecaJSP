package br.com.gabrielxavier.model;

import br.com.gabrielxavier.database.DatabaseConnection;
import br.com.gabrielxavier.enuns.CategoriaLivroEnum;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
public class Livro {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String titulo;

    @ElementCollection(fetch = FetchType.EAGER)
    @Enumerated(EnumType.STRING)
    private List<CategoriaLivroEnum> categorias;

    @Column(columnDefinition = "TEXT")
    private String urlFotoCapa;

    @ManyToOne
    private Autor autor;

    public Livro(){

    }

    public Livro(Long id, String titulo, Autor autor, String urlFotoCapa, List<CategoriaLivroEnum> categorias) {
        this.id = id;
        this.titulo = titulo;
        this.autor = autor;
        this.urlFotoCapa = urlFotoCapa;
        this.categorias = categorias;
    }


    static public List<Livro> getAllLivros() {
        EntityManager em = DatabaseConnection.getEntityManagerFactory().createEntityManager();
        List<Livro> livros = em.createQuery("SELECT l FROM Livro l", Livro.class).getResultList();
        em.close();
        return livros;
    }

    // Obtem lista com n livros aleatórios do banco de dados.
    static public List<Livro> getRecomendados(int numeroDeLivros) {
        EntityManager em = DatabaseConnection.getEntityManagerFactory().createEntityManager();
        List<Livro> livros = em.createQuery("SELECT l FROM Livro l ORDER BY RAND()", Livro.class)
                .setMaxResults(numeroDeLivros)
                .getResultList();
        em.close();
        return livros;
    }
}
