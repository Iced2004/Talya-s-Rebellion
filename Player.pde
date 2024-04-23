class Player{
  //////// Variables
  int x;
  int y;
  int size;
  int posd;
  
  int hp;
  String name;
  color c;
  
  boolean isAtkBuffed;
  boolean isSelected;
  int atkBuffCount;
  String buffExpire;
  
  //////// Constructor
  // Init All Vars
  Player(int pos, int identifier, int startingHP){
    c = color(255,255,255);
    
    hp = startingHP;
    if(pos == 1){
      x = width/5;
      y = height/6;
      name = "Talya";
      //if(hp <= 0){
      //c = color(255,0,0);
      //}
    }
      if(pos == 2){
        x = width/3;
        y = height/3;
        name = "Billy";
      //  if(hp <= 0){
      //c = color(255,0,0);
      //}
      }
      if(pos == 3){
          x = width/5;
          y = height/2-25;
          name = "Daisy";
      //    if(hp <= 0){
      //c = color(255,0,0);
      //}
      }
      
      size = identifier;
      isAtkBuffed = false;
      buffExpire = " ";
      atkBuffCount = 3;
      
      posd = pos;
  }
  //////// Functions
  void render(){
    fill(c);
    //square(x, y, size);
    fill(0,0,0);
    if(hp > 0){
    if(posd == 1){
      talyaAttack.display(x, y);
    }
    if(posd == 2){
      billyAttack.display(x, y);
    }
    if(posd == 3){
      daisyAttack.display(x, y);
    }
    }
    if(hp <= 0){
      if(posd == 1){
      image(talyaDown, x, y);
      }
      if(posd == 2){
        image(billyDown, x, y);
      }
      if(posd == 3){
        image(daisyDown, x, y);
      }
      }
  }
    
    void attack(Enemy otherEnemy){
      if(posd == 1){
      talyaAttack.isAnimating = true;
      talyaSword.play();
      }
      if(posd == 2){
        billyAttack.isAnimating = true;
        billyPunch.play();
      }
      if(posd == 3){
        daisyAttack.isAnimating = true;
        daisyGun.play();
      }
      if (atkBuffCount <= 0){
        isAtkBuffed = false;
      }
      
      if(isAtkBuffed == true){
      otherEnemy.hp -= random(6,16);
      atkBuffCount -= 1;
        if(atkBuffCount == 0){
          isAtkBuffed = false;
          buffExpire = name + " is no longer buffed!";
      }
      }
      else {
        otherEnemy.hp -= random(3,8);
      }
    }
    
    void hpUp(){
      hp += random(4,10);
    }
  }
