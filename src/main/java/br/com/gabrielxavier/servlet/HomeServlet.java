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

        List<Autor> autores;
        List<Livro> livros;

        // Obtem todos os livros do banco.
        autores = Autor.getAllAutores();
        livros = Livro.getAllLivros();

        // Pegando itens aleatórios dentro da lista de livros (esses elementos aleatórios serão recomendado na HomePage)
        Random random = new Random();
        List<Livro> livrosRecomendados = new ArrayList<>();

        // adicionando 6 livros aleatórios na lista de livros recomendados.
        while (livrosRecomendados.size() < 6){

            int indiceAleatorio = random.nextInt(livros.size());

            // se o livro aleatório obtido NÃO estiver na lista de recomendados ele será adicionado.
            if(!livrosRecomendados.contains(livros.get(indiceAleatorio))) {
                livrosRecomendados.add(livros.get(indiceAleatorio));
            }
        }

        request.setAttribute("livros", livrosRecomendados);
        request.setAttribute("autores", autores);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}
