$(document).ready(function() {
  console.log("controller loaded");
  function runGame(playerOne,playerTwo) {

    game = new Game(playerOne, playerTwo);
    // console.log("this");
    // console.log(game);
    // console.log(game.playerOne);

    // console.log("player one hand:");
    // console.log("player hand after playing one card:");
    // console.log(game.playerOne.hand);
    // console.log("player hand after drawing cards:");
    game.playerOne.drawHand();
    game.round.playerOneCard = game.playerOne.playCard();
    game.playerTwo.drawHand();
    game.round.playerTwoCard = game.playerTwo.playCard();
    console.log(game.resolveRound());
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
          player1 = new Player(playerOneDeck, 30);
          player2 = new Player(playerTwoDeck, 30);

          runGame(player1, player2);

    })
  });
})
