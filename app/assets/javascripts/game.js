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
  if (gameObject.player_selection[0]) {
    console.log('SOMETHING WRONG, IN PLAYER SELECTION');
    console.log(gameObject.player_selection[0]);
    display.emptyContainer('#player-move');
    display.displayCardCollection(gameObject.player_selection, '#player-move');
  }

  if (gameObject.opponent_selection[0]) {
    console.log('SOMETHING WRONG, IN OPPONENT SELECTION');
    console.log(gameObject.player_selection[0]);
    display.emptyContainer('#opponent-move');
    display.displayCardCollection(gameObject.opponent_selection, '#opponent-move');
  }

  if (!gameObject.player_selection[0]) {
    display.emptyContainer('#player-move');
  }

  if (!gameObject.opponent_selection[0]) {
    display.emptyContainer('#opponent-move');
  }



  if (gameObject.phase == "move") {
    display.emptyContainer('.hand');
    display.displayCardCollection(gameObject.player_hand, '.hand');
    $('.hand').center_hand();
    cardInput();
    display.displayScoreBoard(gameObject);
  } else if (gameObject.phase == "won") {
    display.winScreen(getGameId());
  }
}
