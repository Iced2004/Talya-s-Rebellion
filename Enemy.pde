class Enemy{
  //////// Variables
  int x;
  int y;
  int size;
  int posd;
  String name;
  
  int hp;
  
  color c;
  
  boolean isSelected;
  boolean isAlive = true;
  
  //////// Constructor
  // Init All Vars
  Enemy(int pos, int identifier){
    posd = pos;
    if(isAlive == true){
    if(pos == 1){
      x = width-width/5;
      y = height/6;
      name = "Boxer";
      //c = color(255,0,0);
    }
      if(pos == 2){
        x = width-width/3;
        y = height/3;
        name = "Fencer";
        //c = color(255,0,0);
      }
      if(pos == 3){
          x = width-width/5;
          y = height/2 - 25;
          name = "Acrobat";
          //c = color(255,0,0);
      }
      if(pos == 4){
        x = width-width/3;
        y = height/3;
        name = "Sephiroth";
      }
    }
      size = identifier;
      hp = identifier/4;
      //hp = 1;
      if(hp == 0){
        isAlive = false;
      }
      else {
        isAlive = true;
      }
  }
  //////// Functions
  void render(){
    if(hp > 0){
      if(posd == 1){
        boxerAttack.display(x, y);
      }
      if(posd == 2){
        fencerAttack.display(x, y);
      }
      if(posd == 3){
        acrobatAttack.display(x, y);
        //square(x,y,size);
      }
      if(posd == 4){
        sephirothAttack.display(x, y);
      }
    }
    else {
      if(posd == 4){
        image(sephiDead, x, y);
      }
  }
  }
    
    void attack(Player otherPlayer){
      if(posd == 1){
        boxerAttack.isAnimating = true;
        billyPunch.play();
      }
      if(posd == 2){
        fencerAttack.isAnimating = true;
        talyaSword.play();
      }
      if(posd == 3){
        acrobatAttack.isAnimating = true;
        billyPunch.play();
      }
      if(posd == 4){
        sephirothAttack.isAnimating = true;
        otherPlayer.hp -= random(10,15);
        sephiSword.play();
      }
      else{
      otherPlayer.hp -= random(5,10);
    }
  }
}
