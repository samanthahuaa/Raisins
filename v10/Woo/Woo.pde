//instance vars
PImage Img;
PImage user;
PImage coin;
PImage ctch;
PImage poke;
PImage shoP;
PImage shopInside;
PImage berry;
Trainer player;

//font
PFont book;

//coordinates of user
float playerX = 300;
float playerY = 418;

int wallet;
int pokeballc;
int berryc;

boolean showTutorial = true;

boolean thrown = false;

boolean inShop = false;

void setup(){
  // create a new instance of Trainer to represent the player
  player = new Trainer();
  pokeballc = 10;
  berryc = 1;
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

  //fonts
  book = createFont("Avenir-Book-48.vlw",25);

  //initial value of wallet
  wallet = 10;
}

void draw(){
  if (player.isCatch()) {
    image(ctch, 0, 0);
    image(user, 100, 555);
    poke = loadImage(player.getPoke(), "png");
    image(poke, 500, 555);
    if(thrown){
       player.ballThrow();
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
    image(berry, 675, 495);
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
  }
  else {
    image(Img, 0, 0);
    image(user, playerX, playerY);
    image(coin, 10, 10);
    image(shoP, 555, 200);

  
    fill(250);
    textFont(book);
    textSize(23);
    text("Pokecoins", 30, 25);
    textSize(27);
    text(wallet, 115, 80);

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
    else if(key == 'b' || key == 'B'){
      player.printBackpack();
    }
    // if t is pressed, open up the tutorial again
    else if(key == 't') {
      showTutorial = true;
    }
    else if (key == 'x') {
      showTutorial = false;
    }
  }
  else if (key == 'x') {
     player.endCatch();
  }
  else if (key == 'p') {
    thrown = true;
  }
  else if (key == 'r') {
    //berries
  }
}

void mouseClicked() {
 if(inShop){
    
  //did you click on the berry?
  if(mouseX > 695 && mouseX < 750 && mouseY > 550 && mouseY < 600 && wallet >= 7){
    Items berry = new Items(0.5, true, "berry");
    wallet -=7;
    player.getBackpack().add(berry);
    //lil popup
    fill(250);
    rect(410,580,270,150,100);
    fill(0);
    textSize(15);
    text("you just bought... a berry!",450,650);
    berryc++;
  }
 //pokeball?
  else if(mouseX > 695 && mouseX < 750 && mouseY > 615 && mouseY < 675 && wallet >=5){
    Items pokeball = new Items(0.3, true, "pokeball");
    player.getBackpack().add(pokeball);
    wallet -=5;
    //lil popup
    fill(250);
    rect(410,580,270,150,100);
    fill(0);
    textSize(15);
    text("you just bought... a pokeball!",450,650);
    pokeballc++;
  }
 }
}

void tutorial(){
   fill(250);
   rect(120,300,500,300,100);
   fill(0);
   textFont(book);
   textSize(24);
   text("Welcome to the Raisin Pokemon game!",160,370);
   textSize(16);
   text("To move, use the WASD or arrow keys", 160, 400);
   text("to re-open the tutorial press the t key", 160, 430);
   text("to close this tutorial press x", 160,460);


}