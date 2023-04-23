package br.com.gabrielxavier.servlet;


import br.com.gabrielxavier.model.Autor;
import br.com.gabrielxavier.model.Livro;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet ("/gerenciadorLivros")
public class GerenciadorDeLivrosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Autor> autores = Autor.getAllAutores();

        request.setAttribute("autores", autores);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/gerenciadorRecursos.jsp");
        dispatcher.forward(request, response);
    }
}
