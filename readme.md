#TimeWangler#

> Are you a time traveler from the future? Do you and your friends enjoy wrecklessly kidnapping historical figures and pitting them against each other? Then this is the game for you.

TimeWangler is a real-time multiplayer card game built using Ruby on Rails and JavaScript. It supports the creation of custom decks for each player and allows for online play.

The rules are fairly simple: each card is a historical figure with three stats: Intelligence, Strength, and Charisma. Both players put down a card each turn and the card with the highest overall stat wins. There are also secret powers for certain cards: Cleopatra's card poisons a random card in your hand, for instance. Build the best deck you can and battle players for dominance online!

## Demo ##
Play a game [right here](http://timewangler.herokuapp.com/). It's a two-player game, so you might want to ask a friend to play with you in case no one else is online.

## Setup ##
If you want to host TimeWagler yourself, it should be fairly painless.The most important dependency is [Memcached](http://memcached.org/), which is used to persist game state on the server. Install it, run ```bundle install && bundle exec rails s``` and you should be good to go!

## Developers ##
+ [Dmitriy Istomin](https://github.com/dm-istomin)
+ [Matthew Huff](https://github.com/matthewhuff89)
+ [Bill Storey](https://github.com/wcstorey)
+ [Beatrix Carroll](https://github.com/beatrixbetsycarroll)
+ [Mason Norsworthy](https://github.com/kaylorburdell)

## License ##
```
The MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, THE SOFTWARE.
```
