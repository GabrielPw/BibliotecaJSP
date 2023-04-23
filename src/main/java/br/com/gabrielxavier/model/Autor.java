package br.com.gabrielxavier.model;

import br.com.gabrielxavier.database.DatabaseConnection;
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
    List<Livro> livros  = new ArrayList<>();

    public Autor() {
    }

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

    public void salvarAutor(){
        EntityManager em = DatabaseConnection.getEntityManagerFactory().createEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();
            em.persist(this);
            transaction.commit();

            System.out.println("Autor: " + this.getNome() + " foi salvo.");
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    static public List<Autor> getAllAutores() {
        EntityManager em = DatabaseConnection.getEntityManagerFactory().createEntityManager();
        List<Autor> autores = em.createQuery("SELECT a FROM Autor a", Autor.class).getResultList();
        em.close();
        return autores;
    }
}
