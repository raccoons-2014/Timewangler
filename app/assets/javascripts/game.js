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

    // ----------------Main Game------------------------

        // make 2 player instances from the player model. load the player1 and player2 deck from the ajax response.

        player1 = new Player(playerOneDeck, 30);

        player2 = new Player(playerTwoDeck, 30);

        // game = new Game(player1, player2);



  })

});


