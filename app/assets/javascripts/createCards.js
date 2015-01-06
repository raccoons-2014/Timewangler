function createCards() {
    var card = document.createElement("div");
    card.className = "card";
    card.id = "1";
    var namespan = document.createElement("span");
    namespan.className = "name";
    var title = document.createTextNode("This is the card's title.");
    var picspan = document.createElement("span");
    picspan.className = "picture";
    var picdiv = document.createElement("div");
    picdiv.className = "card_pic";
    var picture = document.createElement("img");
    picture.className = "portrait";
    picture.setAttribute('src', 'http://www.themoderndaypirates.com/pirates/wp-content/uploads/2010/03/flava-flav.jpg');
    var description = document.createElement("div");
    description.className ="description";
    var descriptiontext = document.createTextNode("Nobody cares about Flava Flav.");
    var strength = document.createElement("span");
    strength.className ="strength";
    var strengthtext = document.createTextNode("Strength: ");
    var intelligence = document.createElement("span");
    intelligence.className ="intelligence";
    var intelligencetext = document.createTextNode("Intelligence: ");
    var charisma = document.createElement("span");
    charisma.className ="charisma";
    var charismatext = document.createTextNode("Charisma: ");

    strength.appendChild(strengthtext);
    intelligence.appendChild(intelligencetext);
    charisma.appendChild(charismatext);
    description.appendChild(descriptiontext);
    namespan.appendChild(title);
    picdiv.appendChild(picture);
    picspan.appendChild(picdiv);
    card.appendChild(namespan);
    card.appendChild(picspan);
    card.appendChild(description);
    card.appendChild(strength);
    card.appendChild(intelligence);
    card.appendChild(charisma);
    var hand = document.getElementById("hand");

    hand.appendChild(card);
}
