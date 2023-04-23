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