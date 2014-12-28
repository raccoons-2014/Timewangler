console.log("game loaded");

}

function drawGame(gameObject) {
  $("#game-container").html(JSON.stringify(gameObject));
}

Game.prototype.resolveRound = function() {
  var playerOneMove = this.round.playerOneCard;
  var playerTwoMove = this.round.playerTwoCard;

  if ( playerOneMove && playerTwoMove ) {
    var self = this;
    
    if (this.sumStats(playerOneMove) === this.sumStats(playerTwoMove) ) {
    } else if ( this.sumStats(playerOneMove) > this.sumStats(playerTwoMove) ) {
      this.playerTwo.health -= this.sumStats(playerOneMove)
    } else {
      this.playerOne.health -= this.sumStats(playerTwoMove)
    }
  }
}

// console.log("game loaded");
//
// function Game(playerOne, playerTwo) {
//   this.playerOne = playerOne;
//   this.playerTwo = playerTwo;
//   this.round = { playerOneCard: null, playerTwoCard: null }
//
// };
//
// Game.prototype.isWon = function() {
//   if (this.playerOne.health <= 0 || this.playerTwo.health <= 0) {
//     if (this.playerOne.health <= 0) {
//       this.winner = this.playerTwo;
//       return true;
//     } else if (this.playerTwo.health <= 0) {
//       this.winner = this.playerOne;
//       return true;
//     }
//   } else {
//     return false;
//   };
// }
//
// Game.prototype.playerCardsEmpty = function() {
//   if (this.playerOne.deck.length === 0) {
//     this.winner = this.playerTwo;
//   } else if (this.playerTwo.deck.length === 0) {
//     this.winner = this.playerOne;
//   }
// }
//
// Game.prototype.resolveRound = function() {
//   var playerOneMove = this.round.playerOneCard;
//   var playerTwoMove = this.round.playerTwoCard;
//
//   if ( playerOneMove && playerTwoMove ) {
//     var self = this;
//
//     if (this.sumStats(playerOneMove) === this.sumStats(playerTwoMove) ) {
//     } else if ( this.sumStats(playerOneMove) > this.sumStats(playerTwoMove) ) {
//       this.playerTwo.health -= this.sumStats(playerOneMove)
//     } else {
//       this.playerOne.health -= this.sumStats(playerTwoMove)
//     }
//   }
// }
//
// Game.prototype.sumStats = function(card) {
//   return card.charisma + card.intelligence + card.strength;
// }
