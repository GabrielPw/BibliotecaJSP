package br.com.gabrielxavier.servlet;

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
import java.util.stream.Collectors;

@WebServlet(urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Livro> livros = new ArrayList<>(List.of(
                new Livro(1L, "A Revolução dos Bichos", "George Orwell", "https://m.media-amazon.com/images/I/91BsZhxCRjL.jpg"),
                new Livro(2L, "Crime e Castigo", "Fiódor Dostoiévski", "https://m.media-amazon.com/images/I/916WkSH4cGL.jpg"),
                new Livro(3L, "1984", "George Orwell", "https://m.media-amazon.com/images/I/819js3EQwbL.jpg"),
                new Livro(4L, "Frankenstein", "Mary Shelley", "https://kbimages1-a.akamaihd.net/bd3fce8f-a9a0-4cb0-a539-d8779090ba51/1200/1200/False/frankenstein-557.jpg"),
                new Livro(5L, "A Metamorfose", "Franz Kafka", "https://m.media-amazon.com/images/I/71QLwli7GUL.jpg"),
                new Livro(6L, "Discurso do Método", "René Descartes", "https://m.media-amazon.com/images/I/81+nKmcY6fL.jpg"))
        );

        String query = request.getParameter("query").toLowerCase();

        List<Livro> livrosEncontrados = livros.stream().filter(livro -> String.format("%s - %s", livro.getTitulo().toLowerCase(), livro.getAutor().toLowerCase())
                        .contains(query))
                        .collect(Collectors.toList());

        request.setAttribute("livrosEncontrados", livrosEncontrados);
        request.setAttribute("query", query);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/livrosEncontrados.jsp");
        dispatcher.forward(request, response);
    }
}
