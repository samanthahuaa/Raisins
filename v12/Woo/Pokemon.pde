class Pokemon {
  // inst vars
  String name;
  int health;
  int rarity;
  String urlImg;
  int children;
  // double catchPercentage;

  // default constructor
  Pokemon() {
    name = "";
    health = 0;
    rarity = 0;
    children = 0;
    urlImg = "";
  }

  // overloaded constructor
  Pokemon(String n, int h, int r, int child, String urlInput) {
    name = n;
    health = h;
    rarity = r;
    children = child;
    urlImg = urlInput;
  }
    Pokemon(String n, int h, int child, String urlInput) {
    name = n;
    health = h;
    children = child;
    urlImg = urlInput;
    rarity = 0;
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
  String getname(){
    return name;
  }
  String getImage() {
    return urlImg;
  }
}
