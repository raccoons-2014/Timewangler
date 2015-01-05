// pollServer asks for a response from the game, and in response, runs the drawGame function and then runs pollServer again.
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

// Displays the player's hand, the scoreboard and the timer.
function drawGame(gameObject) {
  if (gameObject.phase == "move") {
    display.displayHand(gameObject.player_hand);
    display.displayScoreBoard(gameObject);
  } else if (gameObject.phase == "won") {
    display.winScreen(gameObject['player_points'] > 0)
  }
}
