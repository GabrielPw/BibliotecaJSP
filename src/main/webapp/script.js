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

function doPreview(titulo, nomeAutor, urlFoto){

  console.log(titulo +  " --> " + nomeAutor + " --> " + urlFoto);

  // Valores inserido pelo usuário
  var tituloElement = document.getElementById("tituloInput").value;
  var autorElement = document.getElementById("selectAutores").value;
  var fotoElement = document.getElementById("urlFotoInput").value;

  console.log("Entrada: " +  " --> " + tituloElement + " --> " + autorElement + " --> " + fotoElement);
  
  // Atualizando área de preview.
  var tituloPreview = document.getElementById("tituloPreview");
  var autorPreview = document.getElementById("autorPreview");
  var fotoPreview = document.getElementById("fotoPreview");

  tituloPreview.innerText = tituloElement;
  autorPreview.innerText = autorElement;
  fotoPreview.src = fotoElement;
}

function showEditFormAndBookpreview(livro, nomeAutores){

  console.log("Clicou em editar no livro (" + livro.id + ")");
  console.log("nome autores: " + nomeAutores);

  var divBookList = document.getElementById("bookList");
  divBookList.className = "container-book-list"
  divBookList.innerHTML = "";
  
  var divContainer = document.createElement("div");
  divContainer.className = "row container-edicao";

  // Card
  var card = document.createElement("div");
  card.className = "card col-md-2";
  card.style = "width: 10rem;";

  var p = document.createElement("p");
  p.innerHTML = "(preview)";
  p.style.fontWeight = 500;
  p.style.textAlign = "center";
  var img = document.createElement("img");
  img.className = "card-img-top";
  img.src = livro.urlFotoCapa;
  img.setAttribute("id", "fotoPreview");


  var cardBody = document.createElement("div");
  cardBody.className = "card-body corpo-card";

  var title = document.createElement("h5");
  title.className = "card-title";
  title.innerHTML = livro.titulo;
  title.setAttribute("id", "tituloPreview");


  var author = document.createElement("p");
  author.className = "card-text";
  author.innerHTML = livro.autor.nome;
  author.setAttribute("id", "autorPreview");


  cardBody.appendChild(title);
  cardBody.appendChild(author);
  card.appendChild(p);
  card.appendChild(img);
  card.appendChild(cardBody);
  divContainer.appendChild(card);
  divBookList.appendChild(divContainer);

  // Formulário
  var divForm = document.createElement("div");
  divForm.className = "form-column";

  // Adicione o conteúdo necessário à coluna de formulário
  var formTitle = document.createElement("h5");
  formTitle.innerHTML = "Editar livro";
  divForm.appendChild(formTitle);

  var form = document.createElement("form");
  // Adicione os campos do formulário para editar o livro

  var tituloInput = document.createElement("input");
  tituloInput.type = "text";
  tituloInput.className = "form-control";
  tituloInput.value = livro.titulo;
  tituloInput.setAttribute("id", "tituloInput");

  var urlFotoInput = document.createElement("input");
  urlFotoInput.type = "text";
  urlFotoInput.className = "form-control";
  urlFotoInput.value = livro.urlFotoCapa;
  urlFotoInput.setAttribute("id", "urlFotoInput");

  var selectAutores = document.createElement("select");
  selectAutores.className = "form-control";
  selectAutores.setAttribute("id", "selectAutores");


  // Cria options para cada autor e adiciona na tag selectAutores
  nomeAutores.forEach(function(nome) {
    var option = document.createElement("option");
    option.value = nome;
    option.text = nome;
    selectAutores.appendChild(option);
  });

  // Deixa o nome do autor certo selecionado no option do campo select.
  Array.from(selectAutores.options).forEach(function(option) {
    
    console.log("titulo livro: " + livro.autor.nome + "option atual: " + option.value);
    if(livro.autor.nome == option.value){
      option.selected = true;
    }
  });

  form.appendChild(tituloInput);
  form.appendChild(selectAutores);
  form.appendChild(urlFotoInput);

  // Adicione o botão de salvar e de preview
  var previewButton = document.createElement("a");
  previewButton.className = "btn"
  previewButton.innerHTML = "Preview";
  previewButton.onclick = function(){doPreview(tituloInput.value, selectAutores.value, urlFotoInput.value);};
  var updateButton = document.createElement("a");
  updateButton.className = "btn"
  updateButton.innerHTML = "Atualizar";
  
  form.appendChild(previewButton);
  form.appendChild(updateButton);

  divForm.appendChild(form);
  divContainer.appendChild(divForm);
}

function updateBookList(livros, autores) {
    var bookList = document.getElementById("bookList");
    bookList.className = "row container-book-list";
    bookList.innerHTML = "";
    livros.forEach(function(livro) {
        var card = document.createElement("div");
        card.className = "card col-md-2";
        card.style = "width: 10rem;";

        var img = document.createElement("img");
        img.className = "card-img-top";
        img.src = livro.urlFotoCapa;

        var cardBody = document.createElement("div");
        cardBody.className = "card-body corpo-card";

        var title = document.createElement("h5");
        title.className = "card-title";
        title.innerHTML = livro.titulo;

        var author = document.createElement("p");
        author.className = "card-text";
        author.innerHTML = livro.autor.nome;

        var linkEditar = document.createElement("a");
        linkEditar.className = "link-editar";
        linkEditar.innerHTML = "Editar";
        linkEditar.onclick = function() {showEditFormAndBookpreview(livro, autores);};

        cardBody.appendChild(title);
        cardBody.appendChild(author);
        cardBody.appendChild(linkEditar);
        card.appendChild(img);
        card.appendChild(cardBody);
        bookList.appendChild(card);
    });
}

function doSearch(){
    var httpRequest = new XMLHttpRequest();

    httpRequest.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // Analisar a resposta do servidor e atualizar a seção de pré-visualização do livro.
            var responseJson = JSON.parse(this.responseText);

            updateBookList(responseJson.livros, responseJson.autores);
        }
    };
    // Defina a URL para a solicitação AJAX.
    var url = "/gerenciadorLivros?query=" + encodeURIComponent(document.getElementById("searchInput").value);

    httpRequest.open("GET", url);
    httpRequest.send();
}