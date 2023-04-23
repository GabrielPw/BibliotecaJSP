package br.com.gabrielxavier.database;

import br.com.gabrielxavier.model.Autor;
import br.com.gabrielxavier.model.Livro;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class DatabaseConnection {

    private static EntityManagerFactory emf;

    private DatabaseConnection() {}

    public static EntityManagerFactory getEntityManagerFactory() {
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("biblioteca_jsp");
        }
        return emf;
    }
}
