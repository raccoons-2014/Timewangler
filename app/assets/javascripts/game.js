function pollServer() {
  setTimeout(function() {
    $.ajax({
      url: "/games/" + getGameId() + "/poll",
      dataType: "JSON",
      success: function(response) {
        console.log(response);
        drawGame(response);
        pollServer();
      },
      error: function(response) {
        console.log("Error while polling server")
        console.log(response);
      }
    });
  }, 1000)

}

function drawGame(gameObject) {
  cardObj = JSON.stringify(gameObject.player_hand[0])

  $("#game-container").html(gameObject.phase);
  // $("#player_1_hand, .card_one").html(JSON.stringify(gameObject.player_hand[0]))

  if (gameObject.phase == "move") {
    display.displayCard(1, gameObject.player_hand[0]);
  }
}



$(document).ready(function() {
  if ($('#game-container').length > 0) {
    console.log('game loaded');
    pollServer();
  };
})
