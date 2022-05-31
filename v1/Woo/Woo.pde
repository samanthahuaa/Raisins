//instance vars
PImage Img;
PImage user;

//coordinates of user
float playerX = 300;
float playerY = 418;


void setup(){
  size(772,836);
  String url = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f05d2093-e048-4027-9fce-2b75609d0bd2/d2mxi1h-e1eb1bc4-8005-4b2e-9deb-e47ef6bfa301.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2YwNWQyMDkzLWUwNDgtNDAyNy05ZmNlLTJiNzU2MDlkMGJkMlwvZDJteGkxaC1lMWViMWJjNC04MDA1LTRiMmUtOWRlYi1lNDdlZjZiZmEzMDEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.dfdyFgxndc9dR0UNHvDmAfawnsjL7PfeoRL2NpqIKmM";
  Img = loadImage(url, "png");
  Img.resize(772,836);
  String urlP = "https://o.remove.bg/downloads/921db3fd-d733-46ce-8c9b-0c1832c29ef7/yee-removebg-preview.png";
  user = loadImage(urlP, "png");
  user.resize(130,78);
}

void draw(){
  image(Img, 0, 0);
  image(user, playerX, playerY);

  if(playerX < -65){
    playerX = 811;
  }
  if(playerX > 811){
    playerX = -65;
  }
  if(playerY < -65){
    playerY = 811;
  }
  if(playerY > 811){
    playerY = -65;
  }
}

void keyPressed(){
  if(key == 'w'){
    playerY-=40;
  }
  if(key == 's'){
    playerY+=40;
  }
  if(key == 'a'){
    playerX-=40;
  }
  if(key == 'd'){
    playerX+=40;
  }
}
