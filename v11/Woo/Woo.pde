//instance vars
PImage Img;
PImage user;
PImage coin;
PImage ctch;
PImage poke;
PImage shoP;
PImage shopInside;
PImage berry;
PImage pokeball;
Trainer player;

//font
PFont book;

//coordinates of user
float playerX = 300;
float playerY = 418;

int wallet;

boolean showTutorial = true;

boolean thrown = false;

boolean inShop = false;

// popups in shop
boolean showBerryPopup;
boolean showBallPopup;

void setup(){
  // create a new instance of Trainer to represent the player
  player = new Trainer();
  // create the screen
  size(772,836);

  // set the background
  String url = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f05d2093-e048-4027-9fce-2b75609d0bd2/d2mxi1h-e1eb1bc4-8005-4b2e-9deb-e47ef6bfa301.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2YwNWQyMDkzLWUwNDgtNDAyNy05ZmNlLTJiNzU2MDlkMGJkMlwvZDJteGkxaC1lMWViMWJjNC04MDA1LTRiMmUtOWRlYi1lNDdlZjZiZmEzMDEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.dfdyFgxndc9dR0UNHvDmAfawnsjL7PfeoRL2NpqIKmM";
  Img = loadImage(url, "png");
  Img.resize(772,836);

  //shop
  String shopee = "assets/shop.png";
  shoP = loadImage(shopee, "png");


  // create the user sprite
  String urlP = "assets/user-sprite-1.png";
  user = loadImage(urlP, "png");
  user.resize(130,78);
  image(Img, 0, 0);
  //catch screen
  String urlcatch = "assets/catch.jpeg";
  ctch = loadImage(urlcatch, "png");

  //create coin image
  String urlC = "assets/coin.png";
  coin = loadImage(urlC, "png");
  coin.resize(350,125);

  //create berry display
  berry = loadImage("assets/berry.png", "png");
  berry.resize(80,100);
  //create pokeball display
  pokeball = loadImage("assets/pokeball.png", "png");
  pokeball.resize(80,80);

  //fonts
  book = createFont("Avenir-Book-48.vlw",25);

  //initial value of wallet
  wallet = 10;

  //init vals of the popup screens in the shop
  showBallPopup = false;
  showBerryPopup = false;
}

void draw(){
  if (player.isCatch()) {
    image(ctch, 0, 0);
    image(user, 100, 555);
    poke = loadImage(player.getPoke(), "png");
    image(poke, 500, 555);

    //flee button
    fill(250);
    rect(600,60,100,50,100);
    fill(0);
    textSize(15);
    text("flee",630,75);
    textSize(10);
    text("like the coward",610,90);
    text("you are",620,105);

    //print mouse coors just to help
    textSize(100);
    fill(0);
    text(mouseX, 100, 200);
    text(mouseY, 100, 300);

    if(thrown){
       player.ballThrow();
    }
    if(showTutorial){
     tutorial();
    }
  }
  //shop
  else if(playerX > 480 && playerX < 630 && playerY > 125 && playerY < 275){
    //if the player is in the shop, we have some items yay
    String shopUrl = "assets/shopInside.png";
    shopInside = loadImage(shopUrl, "png");
    inShop = true;
    image(shopInside, 0, 0);
    image(user, 300, 418);
    berry = loadImage("assets/berry.png", "png");
    image(berry, 665, 485);
    String urlC = "assets/pokeball.png";
    PImage pokeballz = loadImage(urlC, "png");
    pokeballz.resize(75,75);
    image(pokeballz, 680, 605);

    //print mouse coors just to help
    //textSize(100);
    //fill(0);
    //text(mouseX, 100, 200);
    //text(mouseY, 100, 300);

    //coin reappearance
    image(coin, 10, 10);
    fill(250);
    textFont(book);
    textSize(23);
    text("Pokecoins", 30, 25);
    textSize(27);
    //fill(0);
    text(wallet, 115, 80);
    if(showTutorial){
     tutorial();
    }
    if (showBerryPopup) {
      //for (int i = 0; i < 5000; i++) {
        berryPopup();

      //}
      showBerryPopup = false;
      print("beep");
    }
    if (showBallPopup) {
      //int m = millis();
      //int limit = m + 5000;
      //while (m < limit) {
        ballPopup();
      //}
      //for (int i = 0; i < 2000; i++) {
      //  ballPopup();
      //}
      print("boop");
      showBallPopup = false;
    }
  }
  else {
    image(Img, 0, 0);
    image(user, playerX, playerY);

    image(coin, 10, 10);
    fill(250);
    textFont(book);
    textSize(23);
    text("Pokecoins", 30, 25);
    textSize(27);
    text(wallet, 115, 80);

    image(shoP, 555, 200);

    image(berry, 200, 10);
    fill(250);
    textFont(book);
    textSize(23);
    text("Berries", 200, 25);
    textSize(27);
    text(player.getBerryCount(), 280, 80);

    image(pokeball, 350, 25);
    fill(250);
    textFont(book);
    textSize(23);
    text("Pokeballs", 340, 25);
    textSize(27);
    text(player.getBallCount(), 470, 80);

    if (showTutorial) {
      tutorial();
    }

    // if the player goes past the borders of the screen, transport them to the other
    // side of the screen
    if(playerX < -65){
      playerX = 725;
    }
    else if(playerX > 725){
      playerX = -65;
    }
    else if(playerY < -65){
      playerY = 811;
    }
    else if(playerY > 811){
      playerY = -65;
    }
  }
}

void keyPressed(){

  //tutorial you can access anywhere hurray!
  if(key == 't') {
      showTutorial = true;
    }

  // if the player moved, call the move function within Trainer
  if (!player.isCatch()) {
    if(key == 'w' || key == 'a' || key == 's' || key == 'd' || keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT){
      player.move();
      wallet++;
    }

    // if the player is moving, move the sprite
    if(key == 'w' || keyCode == UP){
      playerY-=40;
    }
    else if(key == 's'|| keyCode == DOWN){
      playerY+=40;
    }
    else if(key == 'a'|| keyCode == LEFT){
      playerX-=40;
    }
    else if(key == 'd'|| keyCode == RIGHT){
      playerX+=40;
    }
  }
  else if (key == 'x') {
     player.endCatch();
  }
  else if (key == 'p') {
    thrown = true;
    player.setBallCount(-1);
  }
  else if (key == 'r') {
    //berries
    player.berryThrow();
  }
}

//press and hold t
void keyReleased(){
 if(key == 't'){
  showTutorial = false;
 }
}

void mouseClicked() {

 //will you flee, coward?
 if(player.isCatch() && mouseX > 600 && mouseX < 700 && mouseY > 60 && mouseY < 110){
  player.endCatch();
 }

 if(inShop){

  //did you click on the berry?
  if(mouseX > 695 && mouseX < 750 && mouseY > 550 && mouseY < 600 && wallet >= 7){
    Items berry = new Items(0.5, true, "berry");
    wallet -=7;
    showBerryPopup = true;
    player.setBerryCount(1);
  }
 //pokeball?
  else if(mouseX > 695 && mouseX < 750 && mouseY > 615 && mouseY < 675 && wallet >=5){
    Items pokeball = new Items(0.3, true, "pokeball");
    wallet -=5;
    showBallPopup = true;
    player.setBallCount(1);
  }
 }
}

void tutorial(){
   fill(250);
   rect(120,350,500,300,100);
   fill(0);
   textFont(book);
   textSize(24);
   text("Welcome to the Raisin Pokemon game!",160,370);
   textSize(16);
   text("To move, use the WASD or arrow keys", 160, 400);
   text("to close this tutorial press t.", 160,430);
   text("if you ever want to open this up again, press and hold t", 160, 460);
   text("you might encounter a pokemon as you explore",160,490);
   text("press p to catch it! for that, you need pokeballs",160,520);
   text("you can use berries to help; buy them in the shop!",160,550);

}

void berryPopup() {
    fill(250);
    rect(410,480,270,150,100);
    fill(0);
    textSize(15);
    text("you just bought... a berry!",450,550);
    //delay(10000);
}

void ballPopup() {
  fill(250);
  rect(410,580,270,150,100);
  fill(0);
  textSize(15);
  text("you just bought... a pokeball!",450,650);
  //delay(10000);
}
