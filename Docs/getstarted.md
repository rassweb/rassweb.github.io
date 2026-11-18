# What is this?
This is an XS Script library for Age of Empires II: Definitive Edition. By using the library, you can access certain existing features more easily, while its most important feature is real-time technology state monitoring. You can track the state of specified technologies for each player and apply modifications based on those states. The goal of the library is to minimize the need to use Scenario Editor trigger effects. In addition, several more complex solutions have been condensed into single functions, allowing you to write less code.
I would like to point out that the library itself works correctly for me, but there may still be bugs. Furthermore, technology costs currently cannot be modified, so in such cases you will need to use Scenario Editor triggers.
##### First step
After downloading and placing the **Rs.xs** file in the appropriate location, include it and you can start using it immediately. You do not need to do anything special with it, and the file is only 60 KB in size. The library has its own custom **main()** function, so do not use the default one! Here is an example:
```c++
include "Rs.xs";

// This is the custom main() function that runs when the game starts. It serves the same purpose.
void RsReady() {
    // Place here any code that applies to all players or contains other general functionality.
}

// This runs similarly to main(), but it runs once for each player in the game.
// Useful if you want to check which Age the game starts in, or run code based on the player and civilization.
void RsPlayer(int playerId = -1, int civId = -1, string age = "Dark", int currentAge = 0) {
    if(civId == cVikings) {
        // If the given player is Viking, this code will run.
         xsChatData("Player "+ playerId +" is a viking");
    }

    if(age == "Post-Imperial") {
        // This code runs if the game starts in the Post-Imperial Age.
        xsChatData("Ohh this is "+ age +" Age");
    }
}

//
//  Interactive function for monitoring technology states. It runs whenever the state of any added technology changes.
//
void RsEventTechnology(string eventName = "", int playerId = -1, int techId = -1, int techState = -1, int params = NULL, bool fromQueue = false) {
    if(eventName == "done") {
        // Runs when any player successfully researches a technology.
        if(techId == 102) {
            // Runs when a player reaches the Castle Age.
        }

        if(playerId == 1 && techId == 103) {
            // If Player 1 reaches the Imperial Age, the Militia line gains +2 attack.
            for(index = 0; < rsTotal(UNITLINE_MILITIA)) {
                rsObjectModifyAttack(playerId, rsArrayIntGet(UNITLINE_MILITIA, index), "add", cDamageClassMelee, 2);
            }

        }
    }
}
```
