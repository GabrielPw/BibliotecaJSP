const btnMobile = document.getElementById('btn-mobile');

function toggleMenu(event) {
  if (event.type === 'touchstart') event.preventDefault();
  const nav = document.getElementById('nav');
  nav.classList.toggle('active');
  const active = nav.classList.contains('active');
  event.currentTarget.setAttribute('aria-expanded', active);
  if (active) {
    event.currentTarget.setAttribute('aria-label', 'Fechar Menu');
  } else {
    event.currentTarget.setAttribute('aria-label', 'Abrir Menu');
  }
}

$(document).ready(function() {
  $('#botao-notificacao').on('click', function() {
    toastr.options = {
      "positionClass": "toast-bottom-left",
      "timeOut": 0,
      "extendedTimeOut": 0,
      "escapeHtml": false,
      "closeButton": true,
      "progressBar": true,
      "tapToDismiss": true
    };
    toastr.info('Agora precisamos que você preencha os dados básicos do escritório. Começamos pela confirmação do CNPJ, que buscará algumas informações. Caso queira realizar alguma alteração, basta clicar no campo correspondente <br><br><button class="btn toast-btn-primary clear">OK</button>');

    $(document).on('click', '.clear', function() {
      toastr.clear();
    });

    $(document).on('click', '.toast', function() {
      toastr.clear();
    });
  });
});

//$(function() {
//    $('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
//      var target = $(e.target).attr("href");
//      if (target === "#livro") {
//        $("#form-livro").show();
//        $("#form-autor").hide();
//      } else if (target === "#autor") {
//        $("#form-autor").show();
//        $("#form-livro").hide();
//      }
//    });
//  });
//
//

function updateBookList(livros) {
    var bookList = document.getElementById("bookList");
    bookList.innerHTML = "";
    livros.forEach(function(livro) {
        var card = document.createElement("div");
        card.className = "card col-md-2";
        card.style = "width: 10rem;";

        var img = document.createElement("img");
        img.className = "card-img-top";
        img.src = livro.urlFotoCapa;

        var cardBody = document.createElement("div");
        cardBody.className = "card-body";

        var title = document.createElement("h5");
        title.className = "card-title";
        title.innerHTML = livro.titulo;

        var author = document.createElement("p");
        author.className = "card-text";
        author.innerHTML = livro.autor.nome;

        var linkEditar = document.createElement("a");
        linkEditar.className = "link-editar";
        linkEditar.innerHTML = "Editar";
        linkEditar.href = "/biblioteca/gerenciadorLivros?id=" + livro.id;

        cardBody.appendChild(title);
        cardBody.appendChild(author);
        cardBody.appendChild(linkEditar);
        card.appendChild(img);
        card.appendChild(cardBody);
        bookList.appendChild(card);
    });
}

function loadBookPreview(){
    var httpRequest = new XMLHttpRequest();

    httpRequest.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // Analisar a resposta do servidor e atualizar a seção de pré-visualização do livro.
            var livros = JSON.parse(this.responseText);

            updateBookList(livros);
        }
    };
    // Defina a URL para a solicitação AJAX.
    var url = "/biblioteca/gerenciadorLivros?query=" + encodeURIComponent(document.getElementById("searchInput").value);

    httpRequest.open("GET", url);
    httpRequest.send();
}