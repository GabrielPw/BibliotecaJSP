package br.com.gabrielxavier.model;

import br.com.gabrielxavier.database.DatabaseConnection;
import br.com.gabrielxavier.enuns.CategoriaLivroEnum;
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
    Long id;
    String titulo;

    @ElementCollection(fetch = FetchType.EAGER)
    @Enumerated(EnumType.STRING)
    List<CategoriaLivroEnum> categorias;

    @Column(columnDefinition = "TEXT")
    String urlFotoCapa;

    @ManyToOne
    Autor autor;

    public Livro(){

    }

    public Livro(Long id, String titulo, Autor autor, String urlFotoCapa, List<CategoriaLivroEnum> categorias) {
        this.id = id;
        this.titulo = titulo;
        this.autor = autor;
        this.urlFotoCapa = urlFotoCapa;
        this.categorias = categorias;
    }

    public void salvarLivro(){
        EntityManager em = DatabaseConnection.getEntityManagerFactory().createEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();
            em.persist(this);
            transaction.commit();
            System.out.println("Livro: " + this.getTitulo() + " foi salvo.");
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    static public List<Livro> getAllLivros() {
        EntityManager em = DatabaseConnection.getEntityManagerFactory().createEntityManager();
        List<Livro> livros = em.createQuery("SELECT l FROM Livro l", Livro.class).getResultList();
        em.close();
        return livros;
    }
}
