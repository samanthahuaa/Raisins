import java.util.Scanner;
import java.util.Stack;

Pokemon x;

class Trainer{

//inst vars
  ArrayList<Items> backpack;
  // supposed to be TreeNode
  final ArrayList<TreeNode> pokedex;
  ArrayList<Pokemon> storage;
  int wallet;
  ArrayList<Pokemon> common;
  ArrayList<Pokemon> uncommon;
  ArrayList<Pokemon> rare;
  boolean catching;
  String encounter;
  boolean berrthrow;
  //counters used by Woo
  int berryCount;
  int ballCount;
  float catchPct;
  Pokemon enc;

  //pokeball
  PImage pokeballz;
  float beginX = 100;
  float beginY = 555;
  float distX = 400;
  float distY = 200;
  float pbX = 100;
  float pbY = 555;
  float step = 0.01;
  float pct = 0.5;
  boolean pokthrow;
  //berry
  PImage berrz;
  float bBeginX = 100;
  float bBeginY = 555;
  float bDistX = 400;
  float bDistY = 200;
  float bX = 100;
  float bY = 555;
  float bPct = 0.5;

  //constructor
  Trainer (){
    wallet = 10;
    storage = new ArrayList<Pokemon>();
    backpack = new ArrayList<Items>();
    common = new ArrayList<Pokemon>();
    uncommon = new ArrayList<Pokemon>();
    rare = new ArrayList<Pokemon>();
    // give the user a starting pokemon
    //storage.add(pokedex[random(pokedex.length)]);

    pokedex = pokedex();
    pokes();

    //counters
    berryCount = 3;
    ballCount = 10;
  }


//methods

  //movement
  void move(){
    // every step the user takes, they make a Pokecoins
    //wallet++;

    // the player figure is actually moving => done in Woo.pde

    float tmp = random(1);
    if (tmp < 0.2) {
      catching = true;
      Catch();
    }
    else if (tmp < 0.4) {
      fight();
    }
    return;
  }

  //fighting
  void fight() {
    // trainer has to first pick their pokemon in their lineup before they start

    //Stack<Pokemon> fightOrder = new Stack<Pokemon>;
    //printStorage();
    //the pokemon you have are printed, and then


    //fighting

  }

  //catching
   void Catch(){
     catching = true;
     catchPct = 1;
     float slay = random(1);
     PImage poke;

     if (slay < 0.6) {
      //common pokemon
      int ind = (int) random(common.size());
      enc = common.get(ind);
      encounter = enc.getImage();
      catchPct = 0.7;
      }
    else if (slay < 0.9) {
     //uncommon pokemon
     int ind = (int) random(uncommon.size());
      enc = uncommon.get(ind);
      encounter = enc.getImage();
      catchPct = 0.5;
    }
    else {
      //rare pokemon
     int ind = (int) random(rare.size());
      enc = rare.get(ind);
      encounter = enc.getImage();
      catchPct = 0.3;
    }
  }
  float getPct(){
  return catchPct;
  }
  void setPct(float x) {
  catchPct +=x;
  }
  boolean getberrthrow() {
   return berrthrow;
  }
  void setberrthrow() {
  berrthrow = false;
  }

  boolean getpokthrow(){
  return pokthrow;
  }

  String getPoke() {
    return encounter;
  }
  void endCatch() {
    catching = false;
  }
 Pokemon getenc() {
 return enc;
 }
 void setStorage(Pokemon x) {
  storage.add(x);
 }
  //ball curve
  boolean ballThrow(){
    if (ballCount != 0) {
      String urlC = "assets/pokeball.png";
      pokeballz = loadImage(urlC, "png");
      image(pokeballz, pbX, pbY);
      pct += step;
      if (pct < 1.5) {
        pbX = beginX -200 + (pct * distX);
        pbY = beginY  -177+ (pow((1-pct)*2, 2) * distY);
        return true;
      }
      pokthrow = true;
      pct = 0.5;
      pbX = 100;
      pbY = 555;
      return false;
    }
    return false;
  }



  void printStorage() {
    fill(250);
    rect(70,150,650,100,100);
    fill(0);
    textSize(15);
    int textX = 0;
    //constantly prints out because it's called in draw
    for(Pokemon guppy : storage){
      text(guppy.getName() + ",",120+textX,200);
      textX+=100;
      //break;
    }
  }

  ArrayList<TreeNode> pokedex() {
    ArrayList<TreeNode> temp = new ArrayList<TreeNode>();
    String[] lines = loadStrings("pokedex.csv");
    for (int i=1; i < lines.length; i++) {
      String[] tokens = splitTokens(lines[i], ",");

      Pokemon tempyy = new Pokemon(tokens[0], int(tokens[1]), int(tokens[2]), int(tokens[3]), tokens[4]);
      if (int(tokens[3]) == 0){
        TreeNode yahoo = new TreeNode(tempyy);
        temp.add(yahoo);
      }
      if (int(tokens[3]) == 1) {
        String[] ptokens = splitTokens(lines[i+1], ",");
        Pokemon tumpy = new Pokemon(ptokens[0], int(ptokens[1]), int(ptokens[2]), int(ptokens[3]), ptokens[4]);
        TreeNode tumpee = new TreeNode(tumpy);
        TreeNode tempyyy = new TreeNode(tempyy, tumpee, null);
        temp.add(tempyyy);
      }
  }
    return temp;
  }
  boolean isCatch() {
    return catching;
  }

  void pokes() {

      String[] clines = loadStrings("common.csv");
       for (int i=1; i < clines.length; i++) {
        String[] tokens = splitTokens(clines[i], ",");
        Pokemon com = new Pokemon(tokens[0], int(tokens[1]), int(tokens[2]), (tokens[3]));
        common.add(com);
       }

      String[] ulines = loadStrings("uncommon.csv");
       for (int i=1; i < ulines.length; i++) {
        String[] tokens = splitTokens(ulines[i], ",");
        Pokemon ucom = new Pokemon(tokens[0], int(tokens[1]), int(tokens[2]), (tokens[3]));
        uncommon.add(ucom);
       }

      String[] rlines = loadStrings("rare.csv");
       for (int i=1; i < rlines.length; i++) {
        String[] tokens = splitTokens(rlines[i], ",");
        Pokemon rcom = new Pokemon(tokens[0], int(tokens[1]), int(tokens[2]), (tokens[3]));
        rare.add(rcom);
       }
  }
  //accessor method
  int getBerryCount() {
    return berryCount;
  }

  //accessor method
  int getBallCount() {
    return ballCount;
  }

  void setBerryCount(int x) {
    berryCount += x;
  }

  void setBallCount(int x) {
    ballCount += x;
  }

  boolean berryThrow(){
    if (berryCount != 0) {
      String urlA = "assets/berry.png";
      berrz = loadImage(urlA, "png");
      berrz.resize(75,100);
      image(berrz, bX, bY);
      berrthrow =true;
      bPct += step;
      if (bPct < 1.5) {
        bX = bBeginX -200 + (bPct * bDistX);
        bY = bBeginY  -177+ (pow((1-bPct)*2, 2) * bDistY);
        return true;
      }
      bX = 100;
      bY = 555;
      bPct = 0.5;
      return false;
    }
    return false;
  }
}
