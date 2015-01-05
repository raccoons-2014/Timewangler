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

  // $("#game-container").html(gameObject.phase);

  if (gameObject.phase == "move") {
    display.displayHand(gameObject.player_hand);
    display.displayScoreBoard(gameObject);
  }
}



$(document).ready(function() {
  if ($('#game-container').length > 0) {
    window['onbeforeunload'] = undefined;
    console.log('game loaded');
    pollServer();
  };
})
