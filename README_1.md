Asteroids (Part 3) 
==================
Adding an `ArrayList`
-------------------
An array probably isn't the best way to keep track of a bunch of asteroids. Arrays have a fixed size. You can't easily add or remove asteroids from an array. A better choice might be an `ArrayList`. The `ArrayList` class has a number of useful member methods:
- `boolean add(Object x)`
- `void add(int index, Object element)`
- `Object get(int index)`
- `Object remove(int index)`
- `Object set(int index, Object x)`
- `int size()`

Steps to completing this assignment
-----------------------------------

1. Modify your asteroids game to use an `ArrayList` instead of an array of asteroids. You may find the Asteroids powerpoint from slides #124 helpful. There is more on ArrayLists on the [ArrayList worksheet](https://drive.google.com/file/d/0Bz2ZkT6qWPYTQjFTMjhPaGNXb1E/view?usp=sharing).
2. Now we'll modify the program so that when our space ship strikes an asteroid, the asteroid is removed from the `ArrayList`. Everytime an asteroid moves find the distance between that asteroid and the ship. Use processing's `dist()` function to find the distance between that asteroid and the ship. If the distance is less than 20 remove the asteroid from the ArrayList. Otherwise, move and rotate the asteroid normally
3. Submit the same URL for your AsteroidsGame that you submitted for the two previous assignments to the school loop drop box.


 
