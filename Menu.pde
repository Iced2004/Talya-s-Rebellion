class Menu{
  //////// Variables
  int x;
  int y;
  int w;
  int h;
  
  color c;
  
  //////// Constructor
  Menu(int startingX, int startingY, int startingW, int startingH, color startingC){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    c = startingC;
  }
  
  //////// Functions  
  void render(){
  fill(c);
  rect(x, y, w, h);
  //rect(x-(w/2-w/10), y-h/2, w/8,h/8);
  //fill(255,255,255);
  //text(name, x-(w/2-w/10), y-h/2);
  }
  
  void renderText(String name){
  rect(x-(w/2-w/10), y-h/2, w/8,h/8);
  fill(255,255,255);
  text(name, x-(w/2-w/10), y-h/2);
  }
}
