// pollServer asks for a response from the game, and in response, runs the drawGame function and then runs pollServer again.
function pollServer(oldHandLength) {

  setTimeout(function(oldHandLength) {
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
  if (gameObject.phase == "move") {
    showHand(gameObject, oldHandLength);
    showPlayerCardSelections(gameObject);
    showOpponentCardSelections(gameObject);
    display.displayScoreBoard(gameObject);
  } else if (gameObject.phase == "resolution") {
    showPlayerCardSelections(gameObject);
    showOpponentCardSelections(gameObject);
  } else if (gameObject.phase == "won") {
    display.winScreen(gameObject['player_points'] > 0)
  }
}

function showHand(gameObject, oldHandLength) {

  if (gameObject.player_hand.length !== oldHandLength) {
    display.displayHand(gameObject['player_hand']);
    $('#hand').center_hand();
  } else if (gameObject.time_remaining === 1) {
    display.displayHand(gameObject['player_hand']);
    $('#hand').center_hand();
   }
}

function showPlayerCardSelections(gameObject) {
  if (gameObject.player_selection[0] !== null && gameObject.player_selection.length > 0) {
    display.displayPlayerSelection(gameObject['player_selection'])
    $('#player_selection').playerSelectionDiv();
  }
}
function showOpponentCardSelections(gameObject) {
  if (gameObject.opponent_selection[0] !== null && gameObject.opponent_selection.length > 0) {
    display.displayOpponentSelection(gameObject['opponent_selection'])
    $('#opponent_selection').opponentSelectionDiv();
  }
}
