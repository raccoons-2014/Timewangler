var Game = function(playerOne, playerTwo) {
  this.playerOne = playerOne,
  this.playerTwo = playerTwo,
  this.isWon = function() {
    if (playerOne.health <= 0 || playerTwo.health <= 0) {
      return true;
    } else {
      return false;
    }
  },
  this.rounds = 0
}