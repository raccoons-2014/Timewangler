$(document).ready(function() {
  console.log("controller loaded");
  function runGame(playerOne,playerTwo) {
    game = new Game(playerOne, playerTwo);
    game.playerOne.drawHand();
    console.log("player one hand:");
    console.log(game.playerOne.hand);
    game.playerOne.playCard();
    console.log("player hand after playing one card:");
    console.log(game.playerOne.hand);
    console.log("player hand after drawing cards:");
    game.playerOne.drawHand();
    console.log(game.playerOne.hand);
  }




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

          runGame(player1, player2);



    })

  });
})
