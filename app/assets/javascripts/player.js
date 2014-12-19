var Player = function(deck, health) {
  this.health = health,
  this.deck = deck,
  this.hand = []
  };

Player.prototype.drawHand = function() {
  while (this.hand.length < 6) {
      this.hand.push(this.deck.pop());
    };
};

Player.prototype.playCard = function() {
  return this.hand.pop();
};
