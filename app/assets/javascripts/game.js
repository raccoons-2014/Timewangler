console.log("game loaded");

function Game(playerOne, playerTwo) {
  this.playerOne = playerOne;
  this.playerTwo = playerTwo;
};

Game.prototype.isWon = function() {
  if (this.playerOne.health <= 0 || this.playerTwo.health <= 0) {
    return true;
  } else {
    return false;
  };
}

Game.prototype.resolveRound = function() {
  var playerOneMove = this.round.playerOneCard;
  var playerTwoMove = this.round.playerTwoCard;

  if ( playerOneMove && playerTwoMove ) {
    this.sumStats(playerOneMove)
    this.sumStats(playerTwoMove)
  }
  //
  var playerOneMove = this.playerOne.round;
  var playerTwoMove = this.playerTwo.round;

  if ( this.playerOne.round && this.playerTwo.round ) {
    this.sumStats(this.playerOne.round)
    this.sumStats(this.playerTwo.round)
    Math.max(this.sumStats(playerOneMove), this.sumStats(playerTwoMove))
  }
  // UNFINISHED


}

Game.prototype.sumStats = function(card) {
  return card.charisma + card.intelligence + card.strength;
}
