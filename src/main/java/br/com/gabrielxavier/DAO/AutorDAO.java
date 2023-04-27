package br.com.gabrielxavier.DAO;

import br.com.gabrielxavier.database.DatabaseConnection;
import br.com.gabrielxavier.model.Autor;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

public class AutorDAO {

    public void salvarAutor(Autor autor){
        EntityManager em = DatabaseConnection.getEntityManagerFactory().createEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();
            em.persist(autor);
            transaction.commit();

            System.out.println("Autor: " + autor.getNome() + " foi salvo.");
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    public Autor acharAutorPorNome(String nome){

        EntityManager em = DatabaseConnection.getEntityManagerFactory().createEntityManager();
        TypedQuery<Autor> query = em.createQuery("SELECT a FROM Autor a WHERE a.nome = :nome", Autor.class);
        query.setParameter("nome", nome);
        Autor autor = query.getSingleResult();
        em.close();
        return autor;
    }
}
