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

Display.prototype.displaySelectedCard = function(id, card) {
  $("#"+1+" span.name").html(card.name);
  $("#"+1+" span.picture .card_pic img").attr('src', card.picture_url);
  $("#"+1+" .description").html(card.description);
  $("#"+1+" span.strength").html(card.strength);
  $("#"+1+" span.intelligence").html(card.intelligence);
  $("#"+1+" span.charisma").html(card.charisma);
}

Display.prototype.createPlayerSelectionCard = function(id) {
    var br = document.createElement("br")
    var br2 = document.createElement("br")
    var card = document.createElement("div");
    card.className = "player";
    card.className = "card";
    card.id = 1;
    var namespan = document.createElement("span");
    namespan.className = "name";
    var title = document.createTextNode("This is the card's title.");
    var picspan = document.createElement("span");
    picspan.className = "picture";
    var picdiv = document.createElement("div");
    picdiv.className = "card_pic";
    var picture = document.createElement("img");
    picture.className = "portrait";
    picture.setAttribute('src', 'http://www.themoderndaypirates.com/pirates/wp-content/uploads/2010/03/flava-flav.jpg');
    var description = document.createElement("div");
    description.className ="description";
    var descriptiontext = document.createTextNode("Nobody cares about Flava Flav.");
    var strength = document.createElement("span");
    strength.className ="strength";
    var strengthtext = document.createTextNode("Strength: ");
    var intelligence = document.createElement("span");
    intelligence.className ="intelligence";
    var intelligencetext = document.createTextNode("Intelligence: ");
    var charisma = document.createElement("span");
    charisma.className ="charisma";
    var charismatext = document.createTextNode("Charisma: ");

    description.appendChild(descriptiontext);
    namespan.appendChild(title);
    picdiv.appendChild(picture);
    picspan.appendChild(picdiv);
    card.appendChild(namespan);
    card.appendChild(picspan);
    card.appendChild(description);
    card.appendChild(strengthtext);
    card.appendChild(strength);
    card.appendChild(br);
    card.appendChild(intelligencetext);
    card.appendChild(intelligence);
    card.appendChild(br2);
    card.appendChild(charismatext);
    card.appendChild(charisma);
    var hand = document.getElementById("player_selection");

    hand.appendChild(card);
}

// Increments through the cards and displays all the cards in the hand as long as there are divs.
Display.prototype.displayPlayerSelection = function(playerCollection) {
  $("#player_selection").empty();
  var self = this
  $.each(playerCollection, function( i, val) {
    console.log("PLAYER:");
    console.log(val);
    self.createPlayerSelectionCard(i+1);
    self.displayCard((i+1), val);
  });
};

Display.prototype.displayOpponentSelection = function(playerCollection) {
  $("#opponent_selection").empty();
  var self = this
  $.each(playerCollection, function( i, val) {
    console.log("OPPONENT:");
    console.log(val);
    self.createOpponentSelectionCard(i+1);
    self.displayCard((i+1), val);
  });
};

Display.prototype.createOpponentSelectionCard = function(id) {
    var br = document.createElement("br")
    var br2 = document.createElement("br")
    var card = document.createElement("div");
    card.className = "opponent";
    card.className = "card";
    card.id = 1;
    var namespan = document.createElement("span");
    namespan.className = "name";
    var title = document.createTextNode("This is the card's title.");
    var picspan = document.createElement("span");
    picspan.className = "picture";
    var picdiv = document.createElement("div");
    picdiv.className = "card_pic";
    var picture = document.createElement("img");
    picture.className = "portrait";
    picture.setAttribute('src', 'http://www.themoderndaypirates.com/pirates/wp-content/uploads/2010/03/flava-flav.jpg');
    var description = document.createElement("div");
    description.className ="description";
    var descriptiontext = document.createTextNode("Nobody cares about Flava Flav.");
    var strength = document.createElement("span");
    strength.className ="strength";
    var strengthtext = document.createTextNode("Strength: ");
    var intelligence = document.createElement("span");
    intelligence.className ="intelligence";
    var intelligencetext = document.createTextNode("Intelligence: ");
    var charisma = document.createElement("span");
    charisma.className ="charisma";
    var charismatext = document.createTextNode("Charisma: ");

    description.appendChild(descriptiontext);
    namespan.appendChild(title);
    picdiv.appendChild(picture);
    picspan.appendChild(picdiv);
    card.appendChild(namespan);
    card.appendChild(picspan);
    card.appendChild(description);
    card.appendChild(strengthtext);
    card.appendChild(strength);
    card.appendChild(br);
    card.appendChild(intelligencetext);
    card.appendChild(intelligence);
    card.appendChild(br2);
    card.appendChild(charismatext);
    card.appendChild(charisma);
    var hand = document.getElementById("opponent_selection");

    hand.appendChild(card);
}

Display.prototype.createHandCard = function(id) {
    var br = document.createElement("br")
    var br2 = document.createElement("br")
    var card = document.createElement("div");
    card.className = "card";
    card.id = id.toString();
    var namespan = document.createElement("span");
    namespan.className = "name";
    var title = document.createTextNode("This is the card's title.");
    var picspan = document.createElement("span");
    picspan.className = "picture";
    var picdiv = document.createElement("div");
    picdiv.className = "card_pic";
    var picture = document.createElement("img");
    picture.className = "portrait";
    picture.setAttribute('src', 'http://www.themoderndaypirates.com/pirates/wp-content/uploads/2010/03/flava-flav.jpg');
    var description = document.createElement("div");
    description.className ="description";
    var descriptiontext = document.createTextNode("Nobody cares about Flava Flav.");
    var strength = document.createElement("span");
    strength.className ="strength";
    var strengthtext = document.createTextNode("Strength: ");
    var intelligence = document.createElement("span");
    intelligence.className ="intelligence";
    var intelligencetext = document.createTextNode("Intelligence: ");
    var charisma = document.createElement("span");
    charisma.className ="charisma";
    var charismatext = document.createTextNode("Charisma: ");

    description.appendChild(descriptiontext);
    namespan.appendChild(title);
    picdiv.appendChild(picture);
    picspan.appendChild(picdiv);
    card.appendChild(namespan);
    card.appendChild(picspan);
    card.appendChild(description);
    card.appendChild(strengthtext);
    card.appendChild(strength);
    card.appendChild(br);
    card.appendChild(intelligencetext);
    card.appendChild(intelligence);
    card.appendChild(br2);
    card.appendChild(charismatext);
    card.appendChild(charisma);
    var hand = document.getElementById("hand");

    hand.appendChild(card);
}


Display.prototype.displayHand = function(playerCollection) {
  var self = this
  $(".card").remove();
  $.each(playerCollection, function( i, val) {
    self.createHandCard(i+1);
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
Display.prototype.winScreen = function(winState) {
  if (winState === true) {
    $("#game-container").html("you won!");
  } else {
    $("#game-container").html("you lost!");
  }
}

// Creates a .center jquery function which aligns the selected div on the bottom-center of the bottom of the page based on the current window resolution.
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
    this.css("top", ( $(window).height() - this.height() + 175) / 2+$(window).scrollTop() + "px");
    this.css("left", ( $(window).width() - this.width() ) / 2+$(window).scrollLeft() + "px");
    return this;
}

$.fn.opponentSelectionDiv = function () {
    this.css("position","absolute");
    this.css("top", ( $(window).height() - this.height() - 175) / 2+$(window).scrollTop() + "px");
    this.css("left", ( $(window).width() - this.width() ) / 2+$(window).scrollLeft() + "px");
    return this;
}

$( document ).tooltip();
