# Team Name: GipsyDanger

### Team Roster: 
* Piotr Milewski
* Edwin Mok
* Levi Olevsky

### Project Title: Fire Emblem Remastered

### Description of What this Project Presents to the User:
This project presents to the User a game of Fire Emblem in Processing. First, the use will be asked to pick a desired nickname, and then select a hero to be used in the game. Then, the user will be guided to a main menu to pick between several commands, such as start a new game, look at current item/hero, and quit the game. Then, the player will get to pick a wave (that they have unlocked) and enter a map where they can play the game.

### Description of How this Project Works:
In the main component of the game, there will be a map that is generated using perlin noise, which represents the terrain of the game. There will be the User's hero and enemies on the map. When it is the User's turn, the User get to move using the WASD keys, similar to many video games. The enemies and User take turns to make their moves, and will interact based on being within a certain range with each other.

### Launch Instructions:
**Step 1:** Clone the repo using SSH or HTTPS link
```
$ git clone git@github.com:piotrmilewski/GipsyDanger.git
```
or 
```
$ git clone https://github.com/piotrmilewski/GipsyDanger.git
```
**Step 2:** Navigate into Woo repo
```
$ cd GipsyDanger/Woo/
```
**Step 3:** Launch Processing on Woo.pde
```
$ processing Woo.pde &
```
**Step 4:** Once in Woo.pde via Processing, run the code using Ctrl + R

**Step 5:** Enjoy the game!
