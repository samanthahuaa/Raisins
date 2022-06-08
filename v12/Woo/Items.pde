class Items{
  // inst vars
  float dCatchPct;
  //int dhealth;
  boolean catching;
  String name;

  // overloaded constructor
  Items(float r, /*int h,*/ boolean c, String n) {
    dCatchPct = r;
    //dhealth = h;
    catching = c;
    name = n;
  }

  // accessor methods
  void getDRarity() {
    //return drarity;
  }

  //int getDHealth() {
  //  return dhealth;
  //}
}
