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
    <jsp:include page="menu.jsp" />

    <div class="top-container p-0 m-0">
        <div class="initial-container container border" style="background-color: white;">

            <!-- Barra de pesquisa -->
            <div class="">
                <form action="search" method="GET">
                    <div class="search-bar d-flex p-2">
                        <input type="text" class="form-control" name="query" placeholder="Livro, autor, etc." aria-label="Username" aria-describedby="basic-addon1"/>
                        <button class="botao-buscar" type="submit">Buscar</button>
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
                                <a class="link-categoria" href="/biblioteca/search?category=${categoria.toString()}">${categoria.toString()}</a>
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
                                        <img src=${livro.getUrlFotoCapa()} alt=${livro.getTitulo()} height="310px">
                                    </div>
                                   <p>${livro.getTitulo()} - ${livro.getAutor().getNome()}</p>
                                </li>
                            </c:forEach>
                            </ul>
                      </div>
                    </section>
                </div>
            </div>
        </div>

        <div class="board-cadastro border rounded p-2">
            <div>
                <span style="text-align:center;">Sua conta <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="#af7c4c" d="M14 9.9V8.2q.825-.35 1.688-.525T17.5 7.5q.65 0 1.275.1T20 7.85v1.6q-.6-.225-1.213-.338T17.5 9q-.95 0-1.825.238T14 9.9Zm0 5.5v-1.7q.825-.35 1.688-.525T17.5 13q.65 0 1.275.1t1.225.25v1.6q-.6-.225-1.213-.338T17.5 14.5q-.95 0-1.825.225T14 15.4Zm0-2.75v-1.7q.825-.35 1.688-.525t1.812-.175q.65 0 1.275.1T20 10.6v1.6q-.6-.225-1.213-.338T17.5 11.75q-.95 0-1.825.238T14 12.65ZM6.5 16q1.175 0 2.288.263T11 17.05V7.2q-1.025-.6-2.175-.9T6.5 6q-.9 0-1.788.175T3 6.7v9.9q.875-.3 1.738-.45T6.5 16Zm6.5 1.05q1.1-.525 2.212-.788T17.5 16q.9 0 1.763.15T21 16.6V6.7q-.825-.35-1.713-.525T17.5 6q-1.175 0-2.325.3T13 7.2v9.85ZM12 20q-1.2-.95-2.6-1.475T6.5 18q-1.325 0-2.775.5T1 20.05V5.55Q2.1 4.8 3.588 4.4T6.5 4q1.45 0 2.838.375T12 5.5q1.275-.75 2.663-1.125T17.5 4q1.425 0 2.913.4T23 5.55v14.5Q21.75 19 20.287 18.5T17.5 18q-1.5 0-2.9.525T12 20Zm-5-8.475Z"/></svg></span>
            </div>
            <ul>
                <li><a class="botao-cadastro cadastro" href="/biblioteca/#" style="background: rgb(175 124 76);">Cadastre-se</a></li>
                <li><a class="botao-cadastro entrar" href="/biblioteca/#" style="background: rgb(195 174 136);">Entrar</a></li>
            </ul>
        </div>
    </div>




    <hr class="container"/>

    <div class="container">
        <h2>Procurando livros com histórias incríveis? Encontre aqui.</h2>

        <p><b>Autores</b></p>
        <div class="container row" id="autores" style="align-items:end;">
            <div class="row">
                <c:forEach  items="${autores}" var="autor">
                    <div class="col-md-4" style="padding-bottom:10px;">
                      <div class="row">
                        <div class="col">
                          <div class="" style="text-align:center; background-color: #f9f9f9;">
                            <p><b>${autor.getNome()}</b></p>
                            <img class="image-autor" src="${autor.getUrlFoto()}" width="200px" height="200px">
                          </div>
                          <div class="col">
                            <ul class="lista-livros-autor">
                                <c:forEach var="livrosLista" items="${autor.getLivros()}">
                                  <li>${livrosLista.getTitulo()}</li>
                                </c:forEach>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <div class="col-md-12" style="padding-bottom:10px;">
          <div class="row ver-todos">
            <div class="d-flex align-items-center justify-content-center" style="text-align:center; background-color: #f9f9f9; height: 100%;">
              <a class="botao-ver-todos">Ver Todos</a>
            </div>
          </div>
        </div>
    </div>

    <div class="card footer">
      <div class="card-header footer">
          <span><p>Desenvolvido por: Gabriel Xavier.</p></span>
          <span>
              <a href="https://github.com/GabrielPw"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 2A10 10 0 0 0 2 12c0 4.42 2.87 8.17 6.84 9.5c.5.08.66-.23.66-.5v-1.69c-2.77.6-3.36-1.34-3.36-1.34c-.46-1.16-1.11-1.47-1.11-1.47c-.91-.62.07-.6.07-.6c1 .07 1.53 1.03 1.53 1.03c.87 1.52 2.34 1.07 2.91.83c.09-.65.35-1.09.63-1.34c-2.22-.25-4.55-1.11-4.55-4.92c0-1.11.38-2 1.03-2.71c-.1-.25-.45-1.29.1-2.64c0 0 .84-.27 2.75 1.02c.79-.22 1.65-.33 2.5-.33c.85 0 1.71.11 2.5.33c1.91-1.29 2.75-1.02 2.75-1.02c.55 1.35.2 2.39.1 2.64c.65.71 1.03 1.6 1.03 2.71c0 3.82-2.34 4.66-4.57 4.91c.36.31.69.92.69 1.85V21c0 .27.16.59.67.5C19.14 20.16 22 16.42 22 12A10 10 0 0 0 12 2Z"/></svg></a>
              <a href="https://linkedin.com/in/gabriel-xavier-a5b762242"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M19 3a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h14m-.5 15.5v-5.3a3.26 3.26 0 0 0-3.26-3.26c-.85 0-1.84.52-2.32 1.3v-1.11h-2.79v8.37h2.79v-4.93c0-.77.62-1.4 1.39-1.4a1.4 1.4 0 0 1 1.4 1.4v4.93h2.79M6.88 8.56a1.68 1.68 0 0 0 1.68-1.68c0-.93-.75-1.69-1.68-1.69a1.69 1.69 0 0 0-1.69 1.69c0 .93.76 1.68 1.69 1.68m1.39 9.94v-8.37H5.5v8.37h2.77Z"/></svg></a>
          </span>
      </div>
      <div>
          <p style="text-align: center">O uso de títulos e imagens presentes neste site não tem intuito de vender ou distribuir os livros aqui citados. Os títulos presentes são usados meramente com fins educacionais para a prática de conhecimentos em programação.</p>
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
