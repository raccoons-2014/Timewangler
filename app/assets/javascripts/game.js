console.log("game loaded");

function Game(playerOne, playerTwo) {
  this.playerOne = playerOne;
  this.playerTwo = playerTwo;
  this.round = { playerOneCard: null, playerTwoCard: null }

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
    var self = this;
    console.log(self.sumStats(playerOneMove));
    console.log(self.sumStats(playerTwoMove));

    if (this.sumStats(playerOneMove) === this.sumStats(playerTwoMove) ) {
      console.log("tie");
    } else if ( this.sumStats(playerOneMove) > this.sumStats(playerTwoMove) ) {
      this.playerTwo.health -= this.sumStats(playerOneMove)
      console.log("playerOne won")
    } else {
      this.playerOne.health -= this.sumStats(playerTwoMove)
      console.log("playerTwo won")
    }   
  }
}

Game.prototype.sumStats = function(card) {
  return card.charisma + card.intelligence + card.strength;
}
