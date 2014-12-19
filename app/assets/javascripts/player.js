// Player Health
// Incomplete
var Player = function(deck, player) {
  this.health = 30,
  this.deck = deck,
  this.hand = [],
  this.drawHand = function() {
    // Pops cards from deck into this.hand until there's 6 cards.
    while (this.hand.length < 6) {
      this.hand.push(this.deck.pop());
    };
  }
  // this.hand = function() {
  //   $.ajax ({
  //     url: "game.html",
  //     dataType: "JSON"
  //   }).done(function(content) {
  //     return content;
  //   });
  };


