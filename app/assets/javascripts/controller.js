$(document).ready(function() {
  if ($('#game-frame').length > 0) {
    console.log("controller loaded");

    function runGame(playerOne,playerTwo) {
      playerOne.number = 1;
      playerTwo.number = 2;
      game = new Game(playerOne, playerTwo);

      while ( game.isWon() == false ) {
        game.playerOne.drawHand();
        game.round.playerOneCard = game.playerOne.playCard();
        game.playerTwo.drawHand();
        game.round.playerTwoCard = game.playerTwo.playCard();
        game.resolveRound();
      }
      console.log(game.winner.number);
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
            var player1 = new Player(playerOneDeck, 30);
            var player2 = new Player(playerTwoDeck, 30);

            runGame(player1, player2);

      })
    });
  }
})
