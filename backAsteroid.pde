class backAsteroid {
  //PROPERTIES
  float x, y, size, speed;

  //CONSTRUCTORS
  backAsteroid() {
    x = random(0, width);
    y = random(0, height);
    size = random(2, 15);
    speed = map(size, 5, 15, 1, 4);
  }

  //METHODS
  void display() {
    noStroke();
    fill(163, 163, 163, 80);
    circle(x, y, size);
  }

  void fall() {
    x += speed;
    y += speed;
    if (y > height + 10) {
      y = -10;
    }
    if (x > width + 10) {
      x = -10;
    }
  }
}
