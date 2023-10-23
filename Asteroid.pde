class Asteroid {
  //PROPERTIES
  float asteroidX, asteroidY, speedX, speedY, size;

  //CONSTRUCTORS
  Asteroid() {
    asteroidX = random(0, 200);
    asteroidY = random(0, 400);
    speedX = random(5, 8);
    speedY = random(5, 8);
    size = random(7, 21);
  }

  //METHODS
  void moveAsteroid() {
    asteroidX = asteroidX + speedX;
    asteroidY = asteroidY + speedY;
  }

  void checkBorders() {
    if (asteroidX > width || asteroidX < 0) {
      speedX = speedX * -1;
    }
    if (asteroidY > height || asteroidY < 0) {
      speedY = speedY * -1;
    }
  }

  void checkCollision() {
    asteroidDist = dist(asteroidX, asteroidY, mouseX, mouseY);
    if (asteroidDist <= 20) {
      gameState = 2;
    }
  }

  void display() {
    noStroke();
    
    //Different colors for different size asteroids
    //blue
    if (size >= 7 && size < 10) {
      fill(62, 203, 222);
    }
    //yellow
    if (size >= 10 && size < 13) {
      fill(247, 247, 25);
    }
    //orange
    if (size >= 13 && size < 16) {
      fill(240, 139, 31);
    }
    //red
    if (size >= 16 && size < 19) {
      fill(255, 17, 0);
    }
    //purple
    if (size > 19) {
      fill(221, 64, 245);
    }
    circle(asteroidX, asteroidY, size);
  }
}
