var Display = function() {

}

var display = new Display;

Display.prototype.displayCard = function(id, card) {
  $("#"+id+" span.name").html(card.name);
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


$(document).ready(function() {
});
