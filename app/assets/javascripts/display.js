var Display = function() {

}

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


$(document).ready(function() {
  $('.hand').center();
});


$.fn.center = function () {
    this.css("position","absolute");
    this.css("bottom", Math.min(0, (($(window).height() - $(this).outerHeight()) / 2) +
                                                $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) +
                                                $(window).scrollLeft()) + "px");
    return this;
}


