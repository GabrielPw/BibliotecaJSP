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
    <link rel="stylesheet" type="text/css" href="css/estilo.css"/>
    <link rel="stylesheet" type="text/css" href="css/menu.css"/>
</head>
<body>

    <!-- menu principal-->
     <header id="header">
        <a id="logo" href="">Biblioteca<i>JSP</i></a>
        <nav id="nav" class="container">
          <button aria-label="Abrir Menu" id="btn-mobile" aria-haspopup="true" aria-controls="menu" aria-expanded="false">Menu
            <span id="hamburger"></span>
          </button>
          <ul id="menu" role="menu">
            <li><a href="/biblioteca/">Inicio</a></li>
            <li><a href="/biblioteca/#autores">Autores</a></li>
          </ul>
        </nav>
      </header>
      <script src="./script.js"></script>

    <div class="container border" style="background-color: white;">

        <!-- Barra de pesquisa -->
        <div class="">
            <form action="search" method="GET">
                <div class="search-bar d-flex p-2">
                    <input type="text" class="form-control" name="query" placeholder="Livro, autor, etc." aria-label="Username" aria-describedby="basic-addon1"/>
                    <button class="botao-buscar btn rounded" type="submit">Buscar</button>
                </div>
            </form>
        </div>

        <!-- Container conteudo principal -->
        <div class="initial-board d-flex" width="auto">

            <!-- Categorias -->
            <div class="categorias-board border rounded d-flex flex-column m-3 p-2">
                <p style="color: #ce8c4e;"><b>Biblioteca (Categorias)</b></p>
                <div class="categoria-item-container border m-2">
                    <c:forEach items="<%=CategoriaLivroEnum.values()%>" var="categoria">
                        <div class="border p-1">
                            <p style="text-align:left; margin-bottom: 5px; max-width: 120px" class="text-nowrap">
                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
                              <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
                            </svg>
                            ${categoria.toString()}
                            </p>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Recomendaçoes -->
            <div class="recomendacao-board flex-fill border m-3 p-2" id="recomendacao-board">
                <p style="color: rgb(175 124 76);"><b><i>Recomendaçoes</i></b></p>
                <section class="splide" aria-label="Splide Basic HTML Example">
                  <div class="splide__track">
                        <ul class="splide__list">
                        <c:forEach  items="${livros}" var="livro">
                            <li class="splide__slide">
                                <div class="splide__slide__container">
                                    <img src=${livro.getUrlFotoCapa()} alt=${livro.getTitulo()}>
                                </div>
                               <p>${livro.getTitulo()} - ${livro.getAutor()}</p>
                            </li>
                        </c:forEach>
                        </ul>
                  </div>
                </section>
            </div>
        </div>
    </div>

    <hr class="container"/>

    <div class="container">
        <h2>Procurando livros com histórias incríveis? Encontre aqui.</h2>

        <p><b>Autores</b></p>
        <div class="container row" id="autores" style="align-items:end;">
            <div class="row">
                <c:forEach  items="${autores}" var="autor">
                    <div class="col-md-6">
                      <div class="row">
                        <div class="col">
                          <div class="" style="text-align:center; background-color: #f9f9f9;">
                            <p><b>${autor.getNome()}</b></p>
                            <img src="${autor.getUrlFoto()}" class="img-thumbnail" width="200px">
                          </div>
                          <div class="col">
                            <ul class="lista-livros-autor">
                                <c:forEach var="livrosLista" items="${autor.getLivros()}">
                                  <li>${livrosLista.titulo}</li>
                                </c:forEach>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/@splidejs/splide@3.0.9/dist/js/splide.min.js"></script>
    <script src="script.js"></script>

</body>

<!-- Initialize Splide -->
<script>

    var splide = new Splide( '.splide', {
      type    : 'loop',
      perPage : 3,
      autoplay: true,
      width: "950px",
      height: "400px"
    } );

    splide.mount();
</script>
</html>
