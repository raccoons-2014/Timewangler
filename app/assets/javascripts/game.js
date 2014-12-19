//read in all the hero cards in system into a deck array
var playing_deck = new Array(/*existing cards from hero(, action, and weapon) database table*/)
var event_deck = new Array(/*existing cards from event databse table (time periods)*/)
//var dealt = false; //check this var to tell whether player gets to pull new hand or not?
var hand = new Array(6); //hand of hero cards

//Constructor for Card Objects
function Card(playing_deck_obj) {
   this.id = ;
   this.name = ; //pull respective values from the playing_deck_obj pulled from the database table
   this.description = ;
   this.strength = ;
   this.intelligence = ;
   this.charisma = ;
}

function DealDraw() {
   if (dealt == true) Draw();
   else Deal();
}

function Deal() {
// populate the deck
   for (i=1; i<14; i++) {

     deck[i] = new Card();
   }
// shuffle the deck
    var n = Math.floor(400 * Math.random() + 500);
    for (i=1; i<n; i++) {
       card1 = Math.floor(52*Math.random() + 1);
       card2 = Math.floor(52*Math.random() + 1);
       temp = deck[card2];
       deck[card2] = deck[card1];
       deck[card1] = temp;
    }