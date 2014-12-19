describe("Player", function() {
  var player;
  var deck;
  var abe = { name: "Abraham Lincoln" }
  var albert = { name: "Albert Einstein"}
  var pootie = { name: "Mahatma Gandhi" }
  var bruce = { name: "Bruce Lee" }
  var florida = { name: "Florida Man" }

  beforeEach(function() {
    player = new Player(deck, 30);
    deck = ["Abraham Lincoln", "Albert Einstein", "Mahatma Gandhi", "Pootie Tang", "Bruce Lee", "Florida Man"];
  });

  it("has a health property", function() {
    expect(player.health).toEqual(30);
  });

  it("has a deck", function() {
    expect(typeof player.deck).toEqual("object");
  });

  it("has a deck that contains 6 objects.", function() {
    player.drawHand();
    expect(player.hand.length).toEqual(6);
  });

  it("has a playCard function that pops cards from this.hand", function() {
    player.drawHand();
    console.log(player.hand.length);
    console.log(player.playCard());
    expect(typeof player.playCard()).toEqual("string");
  });

});