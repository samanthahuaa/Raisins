class Trainer{
  //inst vars
  ArrayList<Items> backpack;
  final ArrayList<Pokemon> pokedex;
  ArrayList<Pokemon> storage;
  int wallet;

  //constructor
  Trainer {
    wallet = 10;
    storage = new ArrayList<Pokemon>();
    backpack = new ArrayList<Items>();
    // give the user a starting pokemon
    storage.add(pokedex[random(pokedex.length)]);
  }

  //methods
  move(){
    // every step the user takes, they make a Pokecoins
    wallet++;

    // the player figure is actually moving
    

    float tmp = random(1);
    if (tmp < 0.3) {
      catch();
    }
    else if (temp < 0.6) {
      fight();
    }
  }

  fight() {
    // trainer has to first pick their pokemon in their lineup before they start
    // fighting
  }

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

  printBackpack() {
    //text(<text>, x-cor,y-cor)

  }

  printStorage() {

  }

  void keyPressed(){
    if (key == 'b' || key == 'B'){
      printBackpack();
    }
  }
}
