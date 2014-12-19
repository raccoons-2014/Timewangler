describe("Game", function() {
  var player;
  var deck;
  var abe =     { name: "Abraham Lincoln", description: "Huge beard. Sweet hat. Freed the slaves. He's good in my book.", strength: 6, intelligence: 6, charisma: 10}
  var albert =  { name: "Albert Einstein", description: "Relatively awesome.", strength: 4 , intelligence: 10 , charisma: 7 }
  var gandhi =  { name: "Mahatma Gandhi", description: "Too cool for violence. Noobs.",  strength:2 , intelligence:7, charisma: 10}
  var pootie =  { name: "Pootie Tang", description: "POOTIE DONE DID IT AGAIN!!" ,  strength:10 , intelligence:10 , charisma: 10 }
  var bruce =   { name: "Bruce Lee", description: "I don't even need to describe this. You know what he's about.",  strength:10 , intelligence:7 , charisma: 8 }
  var florida = { name: "Florida Man", description: "Florida Man owns Nooby Player. News at 11.",  strength:1, intelligence:1, charisma:1 }


  beforeEach(function() {
    deck = [abe, albert, gandhi, pootie, bruce, florida];
    playerOne = new Player(deck, 30);
    playerTwo = new Player(deck.slice(0), 30);
    game = new Game(playerOne, playerTwo)
  });

  it("should be lost when one of the players has health total that is 0", function() {
    game.playerOne.health -= 30
    expect(game.isWon()).toEqual(true);
  });

  it("should be lost when one of the players has health total that is less than 0", function() {
    game.playerTwo.health -= 32
    expect(game.isWon()).toEqual(true);
  });

  it("should be not won when both players are above 0 health", function() {
    game.playerTwo.health -= 29
    expect(game.isWon()).toEqual(false);
  });
})
