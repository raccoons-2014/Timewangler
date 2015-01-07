var Display = function() {
}

var display = new Display;

// Displays the cards on the game board in the player's hand
Display.prototype.displayCard = function(id, card) {
  $("#"+id+" span.name").html(card.name);
  $("#"+id+" span.picture .card_pic img").attr('src', card.picture_url);
  $("#"+id+" .description").html(card.description);
  $("#"+id+" span.strength").html(card.strength);
  $("#"+id+" span.intelligence").html(card.intelligence);
  $("#"+id+" span.charisma").html(card.charisma);
}

// Increments through the cards and displays all the cards in the hand as long as there are divs.
Display.prototype.displayHand = function(hand) {
  var self = this
  $.each(hand, function( i, val) {
    self.displayCard((i+1), val);
  });
};

// Displays the Scoreboard on the game board.
Display.prototype.displayScoreBoard = function(gameObect) {
  $(".score_board .score").html(gameObect.player_points);
  $(".score_board .round").html(gameObect.round);
  $(".score_board .time").html(gameObect.time_remaining);
};

// Displays the Win Screen upon the winState being set to true.
Display.prototype.winScreen = function(id) {
  window.location.replace("/games/" + id.toString() + "/win");
}

// Creates a .center jquery function which aligns the selected div on the bottom-center of the page based on the current window resolution.
$.fn.center = function () {
    this.css("position","absolute");
    this.css("bottom", Math.min(0, (($(window).height() - $(this).outerHeight()) / 2) +
      $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) +
      $(window).scrollLeft()) + "px");
    return this;
}

$( document ).tooltip();
