package br.com.gabrielxavier.servlet;

import br.com.gabrielxavier.enuns.CategoriaLivroEnum;
import br.com.gabrielxavier.model.Autor;
import br.com.gabrielxavier.model.Livro;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.service(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Autor> autoresRecomendados;
        List<Livro> livrosRecomendados;

        // Obtem livros e autores recomendados para exibir na homePage.
        autoresRecomendados = Autor.getRecomendados(6);
        livrosRecomendados = Livro.getRecomendados(6);

        request.setAttribute("livros", livrosRecomendados);
        request.setAttribute("autores", autoresRecomendados);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}
