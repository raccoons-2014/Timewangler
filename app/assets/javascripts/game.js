$.ajax({
  type: "GET",
  url:  "/decks/player_one",
  dataType: "JSON"
}).done(function(playerOneResponse) {
  var playerOneDeck = playerOneResponse;

  $.ajax({
      type: "GET",
      url:  "/decks/player_two",
      dataType: "JSON"
  }).done(function(playerTwoResponse) {
    var playerTwoDeck = playerTwoResponse;
    // Callback to main game loop here.
  })

});
