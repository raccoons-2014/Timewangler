$(document).ready(function() {
  $('.card_in_hand_player_one').hover(function() {
    $( this ).transition({ scale: 2.2, y: -40 });
  },
   function() {
    $( this ).transition({ scale: 1, y: 0 });
    }
  );
});

$(document).ready(function() {
  $('.card_in_hand_player_two').hover(function() {
    $( this ).transition({ scale: 2.2, y: 40 });
  },
   function() {
    $( this ).transition({ scale: 1, y: 0 });
    }
  );
});

