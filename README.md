# WhyAblo
Final Project for APCS. Honestly no idea what to put here.

Link to Prototype Doc: https://docs.google.com/document/d/1RwpOk4EWAY6wyFdgnQgyFCDE0M7m2QFefV3ZeXRwB9I/edit?usp=sharing

# Group Name
Kanye East

# Members
Jerry Teng and Matthew Tai

# Brief Project Description
For our inspirations, we first looked at “Evolution Simulator” on MinuteLabs.io. Here, blobs move around the map, trying to collect the green spheres (i.e food) in order to survive and reproduce, whilst competing against the other blobs for said spheres. This sort of “random life simulation” gameplay is something we wanted to implement in our project, though we instead want to create a fantasy world where adventurers (our version of blobs) constantly fight randomly spawning enemies. Enemies and adventurers that exist for long enough or kill enough of the opposing force will “evolve”. In terms of our game’s appearance, we turned to WorldBox. While we obviously won’t be able to reach the level of design that WorldBox has, we aim for our game to be top down and to be composed of  “tiles” of some kind.

5/24/22 Matthew
First commit for the Logs? Idk if I'm doing this right. 
Made a separate branch. Realized that TileList and EntityList need to be their own separate classes so I'm getting started on that. Not much work done today, mostly figuring out how branches work. Also in class pair-coding with Jerry, we created the basic "Game" class which has our setup() and draw(). We also started on Tile and most of the Tile() methods. It looks like Jerry did some work on the Entity class but didn't make note of it in the logs.

5/25/22 Matthew
It looks like Jerry forgot again to log his work. I will remind him again tomorrow. Other than that, everything I did last night kinda just got replaced by what me and Jerry pair-coded in class today, so I just deleted it all. I made no significant progress coding tongiht because I went to a funeral. Will make sure to get more done tomorrow.

5/25/22 Jerry
Still having trouble using branches and merging. I forgot to type "--no-ff" once, and now I think my branch is ahead of main, but I can't change it. Working on the Entity object class and its subclasses (creating methods and the like).

5/26/22 Jerry
Keep forgetting to call --no-ff when merging, making my branching look improper. Still working on the Entity object and its related classes. Notably, I created the two main Entity subclasses, Adventurer and Demon, and I decided to change the EntityList and TileList objects to have ArrayLists rather than 2-D arrays; I think it will be more manageable in the future, namely that the ArrayList will automatically increase its length when adding Entities or Tiles.

5/26/22 Matthew
No significant work done. Just getting my mess of branches in order.

5/28/22 Matthew
Forgot to update the log yesterday(Junior Prom) but didn't get much work done for the same reason.
Spent today sorting out all of our branches and getting the main up to date.
Having trouble with color inheritance but otherwise all the displaying for the board works.

5/29/22 Matthew
Did a ridiculous amount of coding today. The board is now fully displayed, and manages to resemble a world with numerous biomes. The only significant problem is that some of the borders are a little messy, but it's to be expected. Wrote approx 200 lines of additional code in an attempt to optimize the borders, but it doesn't work as of now so I commented it out. It's more important that I start focusing on the entities tomorrow to have a working MVP.

5/30/22 Jerry
My computer timed out before I could edit the ReadME, so this section is for what I did yesterday. Worked on Entity and EntityList. Entities have a display() method and a wanderingMovement() method, the latter of which is implemented such that the entites can move to an adjacent tile every 60 frames. EntityList now has an ArrayList, but I will revert it to a 2-D array once I know how to implement it. 

5/30/22 Jerry
Reverted the EntityList class to have a 2-D array rather than an ArrayList, and edited other methods in response. Entities are displayed on the board; adventurers are white ellipses while demons are brown ellipses. Pressing spacebar creates an Adventurer object, and a Demon object is initialized and displayed every 60 frames. Removed the stroke from the tile display (tentative). 

5/30/22 Matthew
Added in a menu with functioning buttons on the side, now can spawn in enemies. Change entity color to red and green instead of brown and white. Also got started on evolution/reproduction.
