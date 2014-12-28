// $(document).ready(function() {
//   if ($('#game-frame').length > 0) {
//     console.log("controller loaded");
//
//
//     function runGame(playerOne,playerTwo) {
//       playerOne.number = 1;
//       playerTwo.number = 2;
//       game = new Game(playerOne, playerTwo);
//
//       $('#player-1-button').click(function(){
//         game.playerOne.drawHand();
//         display.displayHand(game.playerOne.hand);
//         game.round.playerOneCard = game.playerOne.playCard();
//         console.log(game.round);
//
//       })
//
//       $('#player-2-button').click(function(){
//         game.playerTwo.drawHand();
//         display.displayHand(game.playerTwo.hand);
//         game.round.playerTwoCard = game.playerTwo.playCard();
//         console.log(game.resolveRound());
//       })
//
//
//       // game.playerOne.drawHand();
//       // game.round.playerOneCard = game.playerOne.playCard();
//
//       setInterval(function() {
//          if (game.isWon() === true) {
//            $('body').html("PLAYER " + game.winner.number + " WINS")
//          }
//       }, 100);
//       // console.log(game.winner.number);
//     }
//
// // Fire events.
//     $.ajax({
//       type: "GET",
//       url:  "/decks/player_one",
//       dataType: "JSON"
//     }).done(function(playerOneResponse) {
//       var playerOneDeck = playerOneResponse;
//
//       $.ajax({
//           type: "GET",
//           url:  "/decks/player_two",
//           dataType: "JSON"
//       }).done(function(playerTwoResponse) {
//         var playerTwoDeck = playerTwoResponse;
//             var player1 = new Player(playerOneDeck, 30);
//             var player2 = new Player(playerTwoDeck, 30);
//
//             runGame(player1, player2);
//
//       })
//     });
//   }
// })
