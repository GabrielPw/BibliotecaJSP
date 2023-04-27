package br.com.gabrielxavier.DAO;

import br.com.gabrielxavier.database.DatabaseConnection;
import br.com.gabrielxavier.model.Livro;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.util.List;

public class LivroDAO {

    public void salvarLivro(Livro livro){
        EntityManager em = DatabaseConnection.getEntityManagerFactory().createEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();
            em.persist(livro);
            transaction.commit();
            System.out.println("Livro: " + livro.getTitulo() + " foi salvo.");
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    public static List<Livro> buscarLivros(String query) {
        EntityManager em = DatabaseConnection.getEntityManagerFactory().createEntityManager();

        try {
            String jpql = "SELECT l FROM Livro l WHERE l.titulo LIKE :query OR l.autor.nome LIKE :query";
            TypedQuery<Livro> queryExecutar = em.createQuery(jpql, Livro.class);
            queryExecutar.setParameter("query", "%" + query + "%");
            List<Livro> livros = queryExecutar.getResultList();
            return livros;
        } finally {
            em.close();
        }
    }
}
