describe("Player", function() {
  var player;

  beforeEach(function() {
    player = new Player(30);

  });

  it("has a health property", function() {
    expect(player.health).toEqual(30);
  });

});