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
     <header id="header">
        <div id="header-links" class="container">
            <a id="logo" href="/biblioteca/">Biblioteca<i>JSP</i></a>
            <nav id="nav" class="container">
              <button aria-label="Abrir Menu" id="btn-mobile" aria-haspopup="true" aria-controls="menu" aria-expanded="false">Menu
                <span id="hamburger"></span>
              </button>
              <ul id="menu" role="menu">
                <li><a href="/biblioteca/">Inicio</a></li>
                <li><a href="/biblioteca/#autores">Autores</a></li>
                <li><a href="/biblioteca/gerenciadorLivros">Add. Livro</a></li>
              </ul>
            </nav>
        </div>
     </header>
     <script src="./script.js"></script>

    <!-- -->

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
        <div id="livros-form">
            <form>
              <div class="form-group">
                <label for="titulo">Título</label>
                <input type="text" class="form-control" id="titulo">
              </div>
              <div class="form-group">
                <label for="autor">Autor</label>
                <select class="form-control" id="autor">
                  <c:forEach items="${autores}" var="autor">
                      <option value="${autor.getNome()}">${autor.getNome()}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group">
                <label for="foto">URL da Foto</label>
                <input type="text" class="form-control" id="urlFotoCapa">
              </div>
              <button type="submit" class="btn btn-primary">Cadastrar Livro</button>
            </form>
        </div>

        <!-- Autores (formulário) -->
        <div id="autores-form">
            <form>
                <div class="form-group">
                    <label for="nome">Nome</label>
                    <input type="text" class="form-control" id="nome">
                </div>
                <div class="form-group">
                    <label for="descricao">Descrição</label>
                    <input type="email" class="form-control" id="descricao">
                </div>
                <div class="form-group">
                    <label for="descricao">URL da Foto</label>
                    <input type="email" class="form-control" id="urlFoto">
                </div>
                <button type="submit" class="btn btn-primary">Cadastrar Autor</button>
            </form>
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
