package br.com.gabrielxavier.servlet;

import br.com.gabrielxavier.enuns.CategoriaLivroEnum;
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
                new Livro(1L, "A Revolução dos Bichos", "George Orwell", "https://m.media-amazon.com/images/I/91BsZhxCRjL.jpg", List.of(CategoriaLivroEnum.FICCAO_POLITICA)),
                new Livro(2L, "Crime e Castigo", "Fiódor Dostoiévski", "https://m.media-amazon.com/images/I/916WkSH4cGL.jpg", List.of(CategoriaLivroEnum.TRAGEDIA)),
                new Livro(2L, "Os Irmãos Karamazov", "Fiódor Dostoiévski", "https://imgs.search.brave.com/cg7w8Y1FTtk_LjiyfxzK1Sf9DYf9c4CcW9ZCPp2J1lU/rs:fit:500:770:1/g:ce/aHR0cHM6Ly9pbWcu/YmVydHJhbmQucHQv/aW1hZ2VzL29zLWly/bWFvcy1rYXJhbWF6/b3Ytdm9sdW1lLWlp/LWZpb2Rvci1kb3N0/b2lldnNraS9ORFY4/TWpRM09ERXlOREo4/TWpBNU5qTTBOVGQ4/TVRZeU1UVTFNVFl3/TURBd01BPT0vNTAw/eA", List.of(CategoriaLivroEnum.TRAGEDIA)),
                new Livro(3L, "1984", "George Orwell", "https://m.media-amazon.com/images/I/819js3EQwbL.jpg", List.of(CategoriaLivroEnum.DISTOPIA, CategoriaLivroEnum.FICCAO_POLITICA)),
                new Livro(4L, "Frankenstein", "Mary Shelley", "https://kbimages1-a.akamaihd.net/bd3fce8f-a9a0-4cb0-a539-d8779090ba51/1200/1200/False/frankenstein-557.jpg", List.of(CategoriaLivroEnum.MISTERIO, CategoriaLivroEnum.TERROR)),
                new Livro(5L, "A Metamorfose", "Franz Kafka", "https://m.media-amazon.com/images/I/71QLwli7GUL.jpg", List.of(CategoriaLivroEnum.FICCAO_ABSURDA)),
                new Livro(6L, "Discurso do Método", "René Descartes", "https://m.media-amazon.com/images/I/81+nKmcY6fL.jpg", List.of(CategoriaLivroEnum.FILOSOFIA)),
                new Livro(7L, "o Mundo como vontande e como representação", "Arthur Schopenhauer", "https://imgs.search.brave.com/IShZNIxi-5vvuqgfdNWhvbIcTnm26ZAlI4Bt_CG6aIg/rs:fit:600:859:1/g:ce/aHR0cHM6Ly9odHRw/Mi5tbHN0YXRpYy5j/b20vRF9OUV9OUF8y/WF84NDE5NjktTUxC/NDMyMTgzOTI5ODJf/MDgyMDIwLUYuanBn", List.of(CategoriaLivroEnum.FILOSOFIA)),
                new Livro(8L, "Guerra e Paz", "Liev Tolstói", "https://http2.mlstatic.com/D_NQ_NP_661636-MLB48631324828_122021-O.jpg", List.of(CategoriaLivroEnum.FILOSOFIA))
        )
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
