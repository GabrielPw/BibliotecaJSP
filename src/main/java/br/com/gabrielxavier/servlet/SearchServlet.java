package br.com.gabrielxavier.servlet;

import br.com.gabrielxavier.DAO.AutorDAO;
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
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        boolean temResultado = true;
        List<Autor> autores = new ArrayList<>();
        List<Livro> livros = new ArrayList<>();

        autores = AutorDAO.obterTodos();
        livros = Livro.getAllLivros();

        // Se NÃO existir nem 'query, nem 'category'.
        if (!request.getParameterMap().containsKey("query") && !request.getParameterMap().containsKey("category")){
            response.sendRedirect(request.getContextPath() + "/home");
        }else if(request.getParameterMap().containsKey("query")){

            // Se parâmetro for 'query'
            String query = request.getParameter("query").toLowerCase();

            List<Livro> livrosEncontrados = livros.stream().filter(livro -> String.format("%s - %s", livro.getTitulo().toLowerCase(), livro.getAutor().getNome().toLowerCase())
                            .contains(query))
                    .collect(Collectors.toList());

            request.setAttribute("livrosEncontrados", livrosEncontrados);
            request.setAttribute("query", query);

            if(livrosEncontrados.size() == 0){
                temResultado = false;
                request.setAttribute("temResultado", temResultado);

            }

            System.out.println("temResultado: " + temResultado);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/livrosEncontrados.jsp");
            dispatcher.forward(request, response);
        }else{
            // se parâmetro for 'categoria'.
            String category = request.getParameter("category");

            System.out.println("Valor que está sendo buscado na ENUM: " + removerAcentos(category.toUpperCase()));
            CategoriaLivroEnum categoriaPassada = CategoriaLivroEnum.valueOf(removerAcentos(category.toUpperCase()));

            List<Livro> livrosEncontrados = livros.stream().filter(livro -> livro.getCategorias().toString().contains(categoriaPassada.toString())).collect(Collectors.toList());

            request.setAttribute("livrosEncontrados", livrosEncontrados);
            request.setAttribute("category", category.toLowerCase());

            if(livrosEncontrados.size() == 0){
                temResultado = false;
                request.setAttribute("temResultado", temResultado);
            }

            System.out.println("temResultado: " + temResultado);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/livrosEncontrados.jsp");
            dispatcher.forward(request, response);

        }
    }

    public static String removerAcentos(String str) {
        str = Normalizer.normalize(str, Normalizer.Form.NFD);
        str = str.replaceAll("[^\\p{ASCII}]", "");
        str = str.replaceAll("\\s+", "_");
        str = str.replaceAll("-", "");
        return str;
    }
}
