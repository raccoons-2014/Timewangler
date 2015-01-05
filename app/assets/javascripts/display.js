var Display = function() {
}

// This is a global variable and is important for your entire application.
// Globals are dangerous.
var display = new Display;

Display.prototype.displayCard = function(id, card) {
  $("#"+id+" span.name").html(card.name);
  $("#"+id+" span.picture .card_pic img").attr('src', card.picture_url);
  $("#"+id+" .description").html(card.description);
  $("#"+id+" span.strength").html(card.strength);
  $("#"+id+" span.intelligence").html(card.intelligence);
  $("#"+id+" span.charisma").html(card.charisma);
}

Display.prototype.displayHand = function(hand) {
  var self = this
  $.each(hand, function( i, val) {
    self.displayCard((i+1), val);
  });
};

Display.prototype.displayScoreBoard = function(gameObect) {
  $(".score_board .score").html(gameObect.player_points);
  $(".score_board .round").html(gameObect.round);
  $(".score_board .time").html(gameObect.time_remaining);
};

Display.prototype.winScreen = function(winState) {
  if (winState === true) {
    $("#game-container").html("you won!");
  } else {
    $("#game-container").html("you lost!");
  }

}


NO.

// We should only have 1 document.ready() hander
$(document).ready(function() {
  $('.hand').center();

  $('.card').hoverIntent(function() {
    $("#"+($(this).attr('id'))+".card").addClass('card_display');
    $( this ).transition({ scale: 2.2, y: -40 });
  },
   function() {
    var id = $('.card').attr('id');

    $("#"+($(this).attr('id'))+".card").removeClass('card_display');
    $( this ).transition({ scale: 1, y: 0 });
    }
  );
});


$.fn.center = function () {
    this.css("position","absolute");
    this.css("bottom", Math.min(0, (($(window).height() - $(this).outerHeight()) / 2) +
                                                $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) +
                                                $(window).scrollLeft()) + "px");
    return this;
}


