// This function tells the game when a card has been selected by a player
function cardInput() {
  console.log("CARD INPUT LOADED");
  $(".card").click(function() {
    var id = parseInt($(this).attr("data-id"));
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
