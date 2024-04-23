class ObjectOW{
  //////// Variables
  int x;
  int y;
  int w;
  int h;
  
  color c;
  int id;
  
  int oTop;
  int oBottom;
  int oLeft;
  int oRight;
  
  boolean isDefeated;
  //////// Constructor
  ObjectOW(int startingX, int startingY, int startingW, int startingH, color startingC, int startingID){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    id = startingID;
    
    c = startingC;
    isDefeated = false;
  }
  //////// Functions
  
  void render(){
    fill(c);
    if(isDefeated == false){
    if(id == 1){
      boxerAttack.display(x, y);
    }
    if(id == 2){
      fencerAttack.display(x, y);
    }
    if(id == 3){
      sephirothAttack.display(x, y);
    }
    }
      
  }
  
  void collision(){
    oTop = y - h/2;
    oBottom = y + h/2;
    oRight = x + w/2;
    oLeft = x - w/2;
  }
}
