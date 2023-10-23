PImage spaceship;
PImage planets1, planets2, planets3, planets4, planets5;
PFont BlazmaItalic;
Asteroid [] allAsteroids = new Asteroid[10];
backAsteroid[] asteroidStorm = new backAsteroid[200];
float asteroidDist;
int points;
int gameState = 0;
int startMenu = 0;
int mainGame = 1;
int retryMenu = 2;
int winMenu = 3;

void setup() {
  size(1280, 720);
  textAlign(CENTER);
  imageMode(CENTER);
  noCursor();
  spaceship = loadImage("spaceship.png"); //Images created by TJ Browne.
  planets1 = loadImage("planets1.png");
  planets2 = loadImage("planets2.png");
  planets3 = loadImage("planets3.png");
  planets4 = loadImage("planets4.png");
  planets5 = loadImage("planets5.png");
  BlazmaItalic = createFont("BlazmaItalic.ttf", 128); //Font BlazmaItalic designed by GGBot. This Font Software is licensed under the SIL Open Font License, Version 1.1. https://www.dafont.com/blazma.font
  textFont(BlazmaItalic, 128); 

  //Create Background Asteroids
  for (int i = 0; i < asteroidStorm.length; i++) {
    asteroidStorm[i] = new backAsteroid();
  }
  createAsteroids();
}

void draw() {
  background(0);

  //Main Menu
  if (gameState == startMenu) {
    drawMenu();
  }

  //Game Start
  if (gameState == mainGame) {
    drawGame();
    for (int i = 0; i < allAsteroids.length; i++) {
      allAsteroids[i].display();
      allAsteroids[i].moveAsteroid();
      allAsteroids[i].checkBorders();
      allAsteroids[i].checkCollision();
    }
    points++;
  }

  //Game Over
  if (gameState == retryMenu) {
    drawGameOver();
  }

  //Game Win
  if (points >= 1000) {
    gameState = winMenu;
    drawGameWin();
  }
  
  //Increase no. of Asteroids
  if (points > 100 && points < 110) {
    allAsteroids = (Asteroid[]) append(allAsteroids, new Asteroid());
  }
  if (points > 500 && points < 510) {
    allAsteroids = (Asteroid[]) append(allAsteroids, new Asteroid());
  }
  if (points > 700 && points < 710) {
    allAsteroids = (Asteroid[]) append(allAsteroids, new Asteroid());
  }
  if (points > 950 && points < 960) {
    allAsteroids = (Asteroid[]) append(allAsteroids, new Asteroid());
  }
}

void drawMenu() {
  background(0);
  drawBackground();
  fill(255);
  textSize(150);
  text("Asteroid Storm", width/2, height/2);
  textSize(30);
  text("Avoid the asteroids", width/2, height/2+50);
  text("Get over 1000 points to win!", width/2, height/2+100);
  fill(3, 252, 3);
  text("Click to play", width/2, height/2+150);
}

void drawGame() {
  image(planets1, 350, 200, 300, 300);
  image(planets2, 1150, 450, 100, 100);
  image(planets3, 200, 500, 300, 300);
  image(planets4, 1050, 300, 300, 300);
  image(planets5, 650, 400, 300, 300);
  drawBackground();
  fill(255);
  textSize(30);
  text("Points = " + points, width/2, 25);
  image(spaceship, mouseX, mouseY);
}

void drawGameOver() {
  drawBackground();
  fill(255);
  textSize(80);
  text("Game Over", width/2, height/2);
  textSize(30);
  text("Click to restart", width/2, height/2+100);
  text("Points = " + points, width/2, 25);
  allAsteroids = new Asteroid[10];
  for (int i = 0; i < allAsteroids.length; i++) {
    allAsteroids[i] = new Asteroid();
  }
}

void drawGameWin() {
  drawBackground();
  fill(255);
  textSize(80);
  text("You WIN!", width/2, height/2);
  textSize(30);
  text("Congratulations you got over 1000 points", width/2, height/2+100);
}

void drawBackground() {
  for (int i = 0; i < asteroidStorm.length; i++) {
    asteroidStorm[i].display();
    asteroidStorm[i].fall();
  }
}

void createAsteroids() {
  for (int i = 0; i < allAsteroids.length; i++) {
    allAsteroids[i] = new Asteroid();
  }
}

void mousePressed() {
  if (gameState == startMenu || gameState == retryMenu) {
    gameState = mainGame;
    points = 0;
  }
}
