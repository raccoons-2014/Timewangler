// Player Health
// Incomplete
var Player = function() {
  this.health = 30,
  this.hand = function() {
    $.ajax ({
      url: "game.html",
      dataType: "JSON"
    }).done(function(content) {
      return content;
    });
  }
}


