// pollServer asks for a response from the game, and in response, runs the drawGame function and then runs pollServer again.
function pollServer(oldHandLength) {

  setTimeout(function(oldHandLength) {
    // debugger
    $.ajax({
      url: "/games/" + getGameId() + "/poll",
      dataType: "JSON",
      success: function(response) {
        console.log(oldHandLength);
        console.log(response);

        drawScoreboard(response, oldHandLength);

        pollServer(oldHandLength,1);
      },
      error: function(response) {
        console.log("Error while polling server")
        console.log(response);
      }
    });

  }.bind(this, oldHandLength), 1000)
}

// Displays the player's hand, the scoreboard and the timer.
function drawScoreboard(gameObject, oldHandLength) {
  showHand(gameObject, oldHandLength);

  if (gameObject.phase == "move") {
    display.displayScoreBoard(gameObject);
  } else if (gameObject.phase == "won") {
    display.winScreen(gameObject['player_points'] > 0)
  }
}

function showHand(gameObject, oldHandLength) {
  console.log(oldHandLength);
  if (gameObject.player_hand.length !== oldHandLength) {
    $(".card").remove();
    display.displayHand(gameObject['player_hand']);
    $('#hand').center();
  } else if (gameObject.round === 1 && gameObject.time_remaining === 2 && gameObject.phase === "move") {
    display.displayHand(gameObject['player_hand']);
    $('#hand').center();
  }
}
