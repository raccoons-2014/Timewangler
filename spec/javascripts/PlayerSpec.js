describe("Player", function() {
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

    it("has a playCard function that pops cards from this.hand", function() {
      player.drawHand();
      expect(typeof player.playCard()).toEqual("object");
    });
});