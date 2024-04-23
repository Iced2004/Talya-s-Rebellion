class PlayerOW{
  //////// Variables
  int x;
  int y;
  int size;
  int speed;
  
  boolean isMovingLeft;
  boolean isMovingRight;
  boolean isMovingUp;
  boolean isMovingDown;
  
  color c;
  
  int pTop;
  int pBottom;
  int pLeft;
  int pRight;
  
  //////// Constructor
  PlayerOW(int startingX, int startingY, int startingSize, int startingSpeed, color startingC){
    x = startingX;
    y = startingY;
    size = startingSize;
    speed = startingSpeed;
    
    isMovingLeft = false;
    isMovingRight = false;
    isMovingUp = false;
    isMovingDown = false;
    
    
    c = startingC;
  }
  
  //////// Functions
  void render(){
    fill(c);
    talyaWalkCycle.display(x,y);
  }
  
  void move(){
    if (isMovingLeft == true){
      x -= speed;
      talyaWalkCycle.isAnimating = true;
    }
    //else {
    //  talyaWalkCycle.isAnimating = false;
    //}
    if (isMovingRight == true){
      x += speed;
      talyaWalkCycle.isAnimating = true;
    }
    //else {
    //  talyaWalkCycle.isAnimating = false;
    //}
    if (isMovingUp == true){
      y -= speed;
      talyaWalkCycle.isAnimating = true;
    }
    //else {
    //  talyaWalkCycle.isAnimating = false;
    //}
    if (isMovingDown == true){
      y += speed;
      talyaWalkCycle.isAnimating = true;
     }
    // else {
    //  talyaWalkCycle.isAnimating = false;
    //}
}

void collision(){
  pTop = y - size/2;
  pBottom = y + size/2;
  pRight = x + size/2;
  pLeft = x - size/2;
}
}
