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
  $("#game-container").html(JSON.stringify(gameObject));
}

$(document).ready(function() {
  if ($('#game-container').length > 0) {
    console.log('game loaded');
    pollServer();
  };
})
