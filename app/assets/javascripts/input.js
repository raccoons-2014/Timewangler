$(document).ready(function() {
  if ($('.card').length > 0) {
    console.log('input loaded');
    cardInput();
  }
})

function cardInput() {
  console.log("CARD INPUT LOADED")
  $(".card").click(function() {
    alert('clicked!')
  })
}
