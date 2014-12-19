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
