Asteroids (Part 2)
==================
Now that we have a functioning space ship, we'll add some asteroids to our game. We'll write an asteroid class that `extends Floater`.

Steps to completing this assignment
-----------------------------------

1. Write an Asteroid class that extends Floater. Make sure it's not inside the curly braces of any other class. You will need to
write a constructor and the code to "finish" the `abstract` methods in the Floater class
2. Add a `int` member variable of the `Asteroid` class. It will hold the speed of rotation for each asteroid. Make sure that this is initialized to have an equal probablility of being positive or negative. Also make sure to declare it appropriately (should it be `public` or `private`?)
3. "Override" the `move()` method of the Floater class by writing a new `move()` method in the Asteroid class that also rotates each Asteroid at its own speed
4. Now add just a single asteroid to your applet. Start by just calling the Asteroid's `show()` function. Make sure you can see it and are happy with its shape before going to the next step.
5. Now add the code that moves and rotates the Asteroid
6. Modify your code so that you have an array of Asteroids.
7. Submit the URL of your working program to the school loop locker

Extensions
----------

If you have extra time, you might try to figure out how to check to see if the ship has collided with an asteroid.
 
