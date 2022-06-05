class Items{
  // inst vars
  int drarity;
  int dhealth;
  boolean catching;
  String name;

  // overloaded constructor
  Items(int r, int h, boolean c, String n) {
    drarity = r;
    dhealth = h;
    catching = c;
    name = n;
  }

  // accessor methods
  int getDRarity() {
    return drarity;
  }

  int getDHealth() {
    return dhealth;
  }
}
