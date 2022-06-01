class Pokemon {
  // inst vars
  String name;
  int health;
  int rarity;
  String urlImg;
  // double catchPercentage;

  // default constructor
  Pokemon() {
    name = "";
    health = 0;
    rarity = 0;
  }

  // overloaded constructor
  Pokemon(String n, int h, int r, String urlInput ) {
    name = n;
    health = h;
    rarity = r;
    urlImg = urlInput;
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
