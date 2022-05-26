class Pokemon {
  // inst vars
  String name;
  int health;
  int rarity;
  // int catchPercentage;

  // default constructor
  Pokemon() {
    name = "";
    health = 0;
    rarity = 0;
  }

  // overloaded constructor
  Pokemon(String n, int h, int r ) {
    name = n;
    health = h;
    rarity = r;
  }

  void evolve() {
    
  }

  // accessor methods
  int getRarity() {
    return rarity;
  }
  int getHealth() {
    return health;
  }
  String getName(){
    return name;
  }
}
