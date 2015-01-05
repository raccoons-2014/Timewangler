$(document).ready(function() {
  if ($('.card').length > 0) {
    console.log('input loaded');
    cardInput();
  }
})

function cardInput() {
  console.log("CARD INPUT LOADED");
  $(".card").click(function() {
    var id = parseInt(this.id) - 1;
    console.log('clicked:' + id );
    submitInput(id);
  })
}

function submitInput(cardId) {
  $.ajax({
    url: '/games/' + getGameId() + '/move',
    method: "POST",
    data: { card: cardId }
  })
}
