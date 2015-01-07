$(document).ready(function() {
  $('.hand').center();

  $('.card').hoverIntent(function() {
    $("#"+($(this).attr('id'))+".card").addClass('card_display');
    $( this ).transition({ scale: 2.2, y: -40 });
  },
    function() {
      var id = $('.card').attr('id');
      $("#"+($(this).attr('id'))+".card").removeClass('card_display');
      $( this ).transition({ scale: 1, y: 0 });
    }
  );

  if ($('#match').length > 0) {

    console.log('matches loaded');
    var match = new Match(getGameId());
    match.timeout(60);
    match.listenForConfirmation();
  };

  if ($('#game-container').length > 0) {
    window['onbeforeunload'] = undefined;
    console.log('game loaded');
    pollServer();
  };

  if ($('.card').length > 0) {
    console.log('input loaded');
    cardInput();
  }

   if ($('#splash_pic').length > 0) {
    $("body").css("display", "none");
    $("body").fadeIn(7000)
  }
})
