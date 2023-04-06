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
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>

    <!-- menu principal-->
    <div class="menu-principal">
        <nav class="nav container">
          <a class="nav-link active" href="#" style="margin:10px; padding: 10px">Inicio</a>
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

    <!-- Container conteudo principal -->
    <div class="container d-flex">

        <!-- Categorias -->
        <div class="categorias-board border rounded d-flex flex-column m-3 p-2">
            <p style="color: #ce8c4e;"><b>Biblioteca (Categorias)</b></p>
            <div class="categoria-item-container border m-2">
                <c:forEach items="<%=CategoriaLivroEnum.values()%>" var="categoria">
                    <div class="border p-1">
                        <p style="text-align:left; margin-bottom: 5px; max-width: 120px">
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
            <section class="splide" aria-label="Splide Basic HTML Example">
              <div class="splide__track">
            		<ul class="splide__list">
            		<c:forEach  items="${livros}" var="livro">
                        <li class="splide__slide">
                            <div class="splide__slide__container">
                                <img src=${livro.getUrlFotoCapa()} alt=${livro.getTitulo()}>
                            </div>
                           <p>${livro.getTitulo()}</p>
                        </li>

                    </c:forEach>
            		</ul>
              </div>
            </section>
        </div>

    </div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/@splidejs/splide@3.0.9/dist/js/splide.min.js"></script>


</body>
<style>

.splide__track img{
    position: relative;
    height: 100%;

}
.splide__slide{
    padding: 10px;
}
.splide__slide:hover{

    transition: 0.5s;
    color: rgb(184, 139, 97);
    background-color: #d6d6d6;
}



@media (min-width: 1200px) {
  .container {
    width: 1100px;
  }
}

.menu-principal{
    background-color: #593E25;
}

.nav-link{

    color: white;
    font-size: 1.23em;
}

.nav-link:hover{
    transition: 0.5s;
    color: rgb(184, 139, 97);
}

.navbar-nav > li > .dropdown-item option:hover {     background-color: #A64F03;  }

.categoria-item-container div:hover{

    transition: 0.5;
    background-color: #d6d6d6;
}

</style>

<!-- Initialize Splide -->
<script>

    var splide = new Splide( '.splide', {
      type    : 'loop',
      perPage : 3,
      autoplay: true,
      width: "850px",
      height: "400px"
    } );

    splide.mount();
</script>
</html>
