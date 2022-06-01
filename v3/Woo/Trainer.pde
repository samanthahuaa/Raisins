import java.util.Scanner;
import java.util.Stack;

Pokemon x;

class Trainer{
  //inst vars
  ArrayList<Items> backpack;
  // supposed to be TreeNode
  final ArrayList<Pokemon> pokedex;
  ArrayList<Pokemon> storage;
  int wallet;

  //constructor
  Trainer (){
    wallet = 10;
    storage = new ArrayList<Pokemon>();
    backpack = new ArrayList<Items>();
    // give the user a starting pokemon
    //storage.add(pokedex[random(pokedex.length)]);

    pokedex = pokedex();

    //try {
    //  Scanner input = new Scanner(new File("pokedex.csv"));
    //  while(input.hasNextLine()){
    //    String[] temp = input.nextLine().split(",");
    //    sentiment.put(temp[0],Double.parseDouble(temp[1]));
    //    //System.out.println("added "+ temp[0]+", "+temp[1]);
    //  }
    //  input.close();
    //}
    //catch(Exception e){
    //  System.out.println("Error reading or parsing cleanSentiment.csv");
    //}
  }

  //methods
  void move(){
    // every step the user takes, they make a Pokecoins
    wallet++;

    // the player figure is actually moving => done in Woo.pde

    float tmp = random(1);
    if (tmp < 0.3) {
      //catch();
    }
    else if (tmp < 0.6) {
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
/*
  catch() {
    // hey trainer u have encountered a jashkjfhjahj do u want to catch it (y/n) run or catch
    // pseudocode: if (no) { return;}

    // create a new instance of a specific pokemon
    // that would be dependent on randomness
    // int catchPercentage = [specific instance of pokemon].getrarity();
    int catchper = 100;
    if (rarity == 1) {
      catchper = 70;
    }
    if (rarity == 2) {
      catchper = 40;
    }(
    if rarity == 3) {
      catchper = 10;
    }
    if berryused {
      catchper += [specific instance of item].drarity();
    }
  }
*/
  void printBackpack() {
    //text(<text>, x-cor,y-cor)

  }

  void printStorage() {

  }

  ArrayList<Pokemon> pokedex() {
    ArrayList<Pokemon> temp = new ArrayList<Pokemon>();
    String[] lines = loadStrings("pokedex.csv");
    int tempy = 0;
    for (int i=0; i < lines.length; i++) {
      String[] tokens = splitTokens(lines[i], ",");
      tempy += 1;
      Pokemon tempyy = new Pokemon(tokens[0], int(tokens[1]), int(tokens[2]), tokens[3]);
      temp.add(tempyy);
  }
    return temp;
  }
}
