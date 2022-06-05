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
  }

 
  //methods
  void move(){
    // every step the user takes, they make a Pokecoins
    //wallet++;

    // the player figure is actually moving => done in Woo.pde

    float tmp = random(1);
    if (tmp < 0.3) {
      Catch();
    }
    else if (tmp < 0.5) {
      fight();
    }
    return;
  }

  
  void fight() {
    // trainer has to first pick their pokemon in their lineup before they start

    //Stack<Pokemon> fightOrder = new Stack<Pokemon>;
    //printStorage();
    //the pokemon you have are printed, and then


    //fighting

  }

   void Catch(){
     float slay = random(1);
     if (slay < 0.6) {
      //common pokemon
      int ind = (int) random(common.size());
      Pokemon enc = common.get(ind);
      loadImage(enc.getImage(), "png");
      }
    else if (slay < 0.9) {
     //uncommon pokemon 
     int ind = (int) random(uncommon.size());
      Pokemon enc = uncommon.get(ind);
      loadImage(enc.getImage(), "png");
    }
    else {
      //rare pokemon
     int ind = (int) random(rare.size());
      Pokemon enc = rare.get(ind);
      loadImage(enc.getImage(), "png");
    }
    
  }
  void printBackpack() {
    //text(<text>, x-cor,y-cor)

  }

  void printStorage() {

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
}
