<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml" %>

<%@page import="br.com.gabrielxavier.enuns.CategoriaLivroEnum"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
	<title>Novo Livro</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://unpkg.com/@splidejs/splide@3.0.9/dist/css/splide.min.css" />
    <link rel="stylesheet" type="text/css" href="css/estilo.css"/>
</head>
<body>

    <!-- menu principal-->
    <div class="menu-principal">
        <nav class="nav container">
          <a class="nav-link active " href="/biblioteca/home" style="margin:10px; padding: 10px">Inicio</a>
          <ul style="list-style: none; margin: 10px; padding-left:10px;>
              <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Categorias</a>
                  <div class="dropdown-menu">
                    <c:forEach items="<%=CategoriaLivroEnum.values()%>" var="categoria">
                        <option class="dropdown-item">${categoria.toString()}</option>
                    </c:forEach>
                  </div>
              </li>
          </ul>
        </nav>
    </div>

    <!-- Barra de pesquisa -->
    <div class="container">
            <form action="search" method="GET">
                <div class="search-bar d-flex p-2">
                    <input type="text" class="form-control" name="query" placeholder="Livro, autor, etc." aria-label="Username" aria-describedby="basic-addon1"/>
                    <button class="botao-buscar btn rounded" type="submit">Buscar</button>
                </div>
            </form>
    </div>

    <div class="container">
        <h1>Livros encontrados para: '${query}'</h1>
        <div class="livros-encontrados d-flex">
            <c:forEach items="${livrosEncontrados}" var="livro">
                <div class="card" style="width: 18rem;">
                  <img src="${livro.urlFotoCapa}" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">${livro.titulo}</h5>
                    <p class="card-text">${livro.autor}</p>
                    <a href="#" class="btn btn-primary">Ver detalhes</a>
                  </div>
                </div>
            </c:forEach>
        <div>
    </div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/@splidejs/splide@3.0.9/dist/js/splide.min.js"></script>
</body>
</html>
