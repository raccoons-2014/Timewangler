// After your hand has appeared, runs cardInput
$(document).ready(function() {
  if ($('.card').length > 0) {
    console.log('input loaded');
    cardInput();
  }
})

// This function tells the game when a card has been selected by a player
function cardInput() {
  console.log("CARD INPUT LOADED");
  $(".card").click(function() {
    var id = parseInt(this.id) - 1;
    console.log('clicked:' + id );
    submitInput(id);
  })
}

// This function sends the information about which card was selected to the game logic.
function submitInput(cardId) {
  $.ajax({
    url: '/games/' + getGameId() + '/move',
    method: "POST",
    data: { card: cardId }
  }).done(function(response) {
    console.log(response);
  });
}
