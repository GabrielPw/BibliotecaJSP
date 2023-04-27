package br.com.gabrielxavier.servlet;


import br.com.gabrielxavier.DAO.AutorDAO;
import br.com.gabrielxavier.DAO.LivroDAO;
import br.com.gabrielxavier.enuns.CategoriaLivroEnum;
import br.com.gabrielxavier.model.Autor;
import br.com.gabrielxavier.model.Livro;
import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet ("/gerenciadorLivros")
public class GerenciadorDeLivrosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // se a requisição tiver o parâmetro 'query' significa que o usuário está pesquisando por um livro na aba 'editar livros'.
        // Caso contrário, ele simplesmente está acessando a URI /gerenciadorLivros sem fazer nenhuma busca nela.
        if(request.getParameterMap().containsKey("query")){

            System.out.println("Usuário fazendo busca na barra de pesquisa...");
            String query = request.getParameter("query");

            // Busca livros relacionados à pesquisa do usuário
            List<Livro> livros = LivroDAO.buscarLivros(query);

            Gson gson = new Gson();

            // setando o atributo de lista de livros para null para evitar problemas de recursividade (StackOverflowError).
            livros.forEach(livro -> {
                livro.getAutor().setLivros(null);
            });

            String livrosJson = gson.toJson(livros);

            System.out.println("JSON: " + livrosJson);

            // Configura a resposta da solicitação AJAX
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(livrosJson);

        } else{
            List<Autor> autores = Autor.getAllAutores();
            request.setAttribute("autores", autores);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/gerenciadorRecursos.jsp");
            dispatcher.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Discernindo se o método POST foi chamado por cadastrar livro ou por cadastrar autor.
        boolean cadastrandoLivro = request.getParameterMap().containsKey("cadastrarLivro");
        boolean cadastrandoAutor = request.getParameterMap().containsKey("cadastrarAutor");

        System.out.println("var: livro - " + cadastrandoLivro + "\n" + "var: autor - " + cadastrandoAutor);
        if (cadastrandoLivro) {
            // Cadastrar livro
            // Obtendo parâmetros
            String titulo = request.getParameter("titulo");
            String nomeAutor = request.getParameter("autor");
            String urlFoto = request.getParameter("urlFoto");
            List<String> categoriasString = List.of(request.getParameterValues("categorias"));
            List<CategoriaLivroEnum> categoriasEnum = new ArrayList<>();

            // Percorre a lista de categorias armazenadas na lista de string para transformar cada string em um valor da Enum.
            for (String categoria : categoriasString){
                if (CategoriaLivroEnum.getNames().contains(categoria)){
                    System.out.println("Contem categoria: " + categoria);
                    categoria = SearchServlet.removerAcentos(categoria.toUpperCase());
                    categoriasEnum.add(CategoriaLivroEnum.valueOf(categoria));
                }
            }

            AutorDAO autorDAO = new AutorDAO();
            LivroDAO livroDAO = new LivroDAO();
            Autor autor =  autorDAO.acharAutorPorNome(nomeAutor);

            Livro livro = new Livro();
            livro.setTitulo(titulo);
            livro.setAutor(autor);
            livro.setUrlFotoCapa(urlFoto);
            livro.setCategorias(categoriasEnum);

            livroDAO.salvarLivro(livro);

            System.out.println("\n\n");
            System.out.println("Novo livro cadastrado!");

            // Redirecionando para homePage
            response.sendRedirect(request.getContextPath() + "/home");

        } else if (cadastrandoAutor) {
            // Cadastrar autor
            System.out.println("\n\n");
            System.out.println("Novo autor cadastrado!");

        }
    }
}
