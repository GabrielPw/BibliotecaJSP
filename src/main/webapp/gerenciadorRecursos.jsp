<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml" %>

<%@page import="br.com.gabrielxavier.enuns.CategoriaLivroEnum"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
	<title>Novo Livro</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://unpkg.com/@splidejs/splide@3.0.9/dist/css/splide.min.css" />
    <link rel="stylesheet" type="text/css" href="css/menu.css"/>
    <link rel="stylesheet" type="text/css" href="css/gerenciador.css"/>
</head>
<body>

    <!-- menu principal-->
    <jsp:include page="menu.jsp" />

    <div class="container">
        <h1>Gerenciador de Recursos</h1>

        <!-- Tabs -->
        <div class="tabs">
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Livro</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Autor</a>
              </li>
            </ul>
        </div>

        <!-- Livros (formulário) -->
        <!-- livros-form (tab de livros) -->
        <div id="livros-form">
            <div id="livros-accordion">
                <div class="accordion" id="accordionLivros">
                    <div class="card">
                        <div class="card-header" id="headingLivro">
                            <h2 class="mb-0">
                                <button class="btn btn-link botao-accordion" type="button" data-toggle="collapse" data-target="#collapseLivro" aria-expanded="true" aria-controls="collapseLivro">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
                                      <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
                                    </svg> Adicionar Livro
                                </button>
                            </h2>
                        </div>

                        <div id="collapseLivro" class="collapse" aria-labelledby="headingLivro" data-parent="#accordionLivros">
                            <div class="card-body">
                                <form method="POST">
                                    <div class="form-group">
                                        <label for="titulo">Título</label>
                                        <input type="text" class="form-control" name="titulo" id="titulo">
                                    </div>
                                    <div class="form-group">
                                        <label for="autor">Autor</label>
                                        <select class="form-control" id="autor" name="autor">
                                            <c:forEach items="${autores}" var="autor">
                                                <option value="${autor.getNome()}">${autor.getNome()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="categorias">Categorias</label>
                                        <c:forEach items="<%=CategoriaLivroEnum.values()%>" var="categoria">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="${categoria.toString()}" id="flexCheckDefault" name="categorias">
                                                <label class="form-check-label" for="flexCheckDefault">
                                                    ${categoria.toString()}
                                                </label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="form-group">
                                        <label for="foto">URL da Foto</label>
                                        <input type="text" class="form-control" id="urlFotoCapa" name="urlFoto">
                                    </div>
                                    <button type="submit" class="btn btn-primary" name="cadastrarLivro">Cadastrar Livro</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Editar (UPDATE) Livro -->
            <div id="livros-accordion">
                <div class="accordion" id="accordionLivrosUpdate">
                    <div class="card">
                        <div class="card-header" id="headingLivroUpdate">
                            <h2 class="mb-0">
                                <button class="btn btn-link botao-accordion" type="button" data-toggle="collapse" data-target="#collapseLivroUpdate" aria-expanded="true" aria-controls="collapseLivroUpdate">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
                                      <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
                                    </svg> Atualizar Livro
                                </button>
                            </h2>
                        </div>

                        <div id="collapseLivroUpdate" class="collapse" aria-labelledby="headingLivroUpdate" data-parent="#accordionLivrosUpdate">
                            <div class="card-body">
                                <div class="search-bar d-flex p-2">
                                    <input type="text" id="searchInput" class="form-control" name="query" placeholder="Busque o titulo do livro para atualiza-lo." aria-label="Username" aria-describedby="basic-addon1"/>
                                    <button class="botao-buscar" type="submit" onclick="doSearch()">Buscar</button>
                                </div>
                                <div>
                                    <div class="row container-book-list" id="bookList">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Autores (formulário) -->
        <div id="autores-form">
            <div id="autores-accordion">
                <div class="accordion" id="accordionAutores">
                    <div class="card">
                        <div class="card-header" id="headingAutor">
                            <h2 class="mb-0">
                                <button class="btn btn-link botao-accordion" type="button" data-toggle="collapse" data-target="#collapseAutor" aria-expanded="true" aria-controls="collapseAutor">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
                                      <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
                                    </svg> Adicionar Autor
                                </button>
                            </h2>
                        </div>

                        <div id="collapseAutor" class="collapse" aria-labelledby="headingAutor" data-parent="#accordionAutores">
                            <div class="card-body">
                                <form method="POST">
                                    <div class="form-group">
                                        <label for="nome">Nome</label>
                                        <input type="text" class="form-control" id="nome" name="nome">
                                    </div>
                                    <div class="form-group">
                                        <label for="descricao">Descrição</label>
                                        <input type="email" class="form-control" id="descricao" name="descricao">
                                    </div>
                                    <div class="form-group">
                                        <label for="descricao">URL da Foto</label>
                                        <input type="email" class="form-control" id="urlFoto" name="urlFoto">
                                    </div>
                                    <button type="submit" class="btn btn-primary" name="cadastrarAutor">Cadastrar Autor</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="script.js"></script>

</body>

<script>

$(document).ready(function(){
  // esconde todos os formulários
  $('#livros-form').hide();
  $('#autores-form').hide();

  // mostra o formulário da aba ativa
  $('.nav-link.active').parent().each(function() {
    if($(this).index() == 0) {
      $('#livros-form').show();
    } else {
      $('#autores-form').show();
    }
  });

  // define o evento de troca de abas
  $('.nav-link').click(function(e){
    e.preventDefault();
    $('.nav-link').removeClass('active');
    $(this).addClass('active');
    $('#livros-form').hide();
    $('#autores-form').hide();
    if($(this).parent().index() == 0) {
      $('#livros-form').show();
    } else {
      $('#autores-form').show();
    }
  });
});

</script>

</html>
