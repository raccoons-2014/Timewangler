var Display = function() {
}

var display = new Display;

// Displays the cards on the game board in the player's hand
Display.prototype.buildCard = function(cardObject, index) {
  var card = "<div class='card', data-id='" + index + "'><span class='name'><h2>" + cardObject.name + "</h2></span><div class='card_pic'><img src="+ cardObject.picture_url + " , class='portrait'></div><div class='description'><p>" + cardObject.description + "</p></div><div class='effect-description'><p>" + this.effectDescriptionToString(cardObject['effect_description']) + "</p></div><h2>Strength:<span class='strength'>" + cardObject.strength + "</span></h2><h2>Intelligence:<span class='intelligence'>" + cardObject.intelligence + "</span></h2><h2>Charisma:<span class='charisma'>" + cardObject.charisma + "</span></h2></div>";
  return card;
};

Display.prototype.effectDescriptionToString = function(effectDescription) {
  if (effectDescription) {
    return effectDescription
  } else {
    return ""
  };
};

Display.prototype.displayCards = function(containerElem, cardHTML) {
  $(containerElem).append(cardHTML);
};

Display.prototype.emptyContainer = function(containerElem) {
  $(containerElem).empty();
};

Display.prototype.detachContainer = function(containerElem) {
  $(containerElem).detach();
};

// Increments through the cards and displays all the cards in the hand as long as there are divs.
Display.prototype.displayCardCollection = function(cardCollection, containerElem) {
  var self = this
  $.each(cardCollection, function(i, val) {
    self.displayCards(containerElem, self.buildCard(val, i));
  });
};

// Displays the Scoreboard on the game board.
Display.prototype.displayScoreBoard = function(gameObject) {
  $(".score_board .opponent_name").html(gameObject.opponent_name);
  $(".score_board .opponent_score").html(gameObject.opponent_points);
  $(".score_board .name").html(gameObject.player_name);
  $(".score_board .score").html(gameObject.player_points);
  $(".score_board .round").html(gameObject.round);
  $(".score_board .time").html(gameObject.time_remaining);
  $(".score_board .phase").html(gameObject.phase);
};

// Displays the Win Screen upon the winState being set to true.
Display.prototype.winScreen = function(id) {
  window.location.replace("/games/" + id.toString() + "/win");
}

// Creates a .center jquery function which aligns the selected div on the bottom-center of the page based on the current window resolution.

$.fn.center_hand = function () {
    this.css("position","absolute");
    this.css("bottom", Math.min(0, (($(window).height() - $(this).outerHeight()) / 2) +
      $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) +
      $(window).scrollLeft()) + "px");
    return this;
}


$.fn.playerSelectionDiv = function () {
    this.css("position","absolute");
    this.css("top", ( $(window).height() - this.height()) / 2+$(window).scrollTop() + "px");
    this.css("left", ( $(window).width() - this.width() + 400) / 2+$(window).scrollLeft() + "px");
    return this;
}

$.fn.opponentSelectionDiv = function () {
    this.css("position","absolute");
    this.css("top", ( $(window).height() - this.height()) / 2+$(window).scrollTop() + "px");
    this.css("left", ( $(window).width() - this.width() - 400) / 2+$(window).scrollLeft() + "px");
    return this;
}


$( document ).tooltip();
