describe("Player", function() {
  var player;
  var deck = ["Abraham Lincoln", "Albert Einstein", "Mahatma Gandhi", "Pootie Tang", "Bruce Lee", "Florida Man"];

  beforeEach(function() {
    player = new Player(deck, 30);
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

});