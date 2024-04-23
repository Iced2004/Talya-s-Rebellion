class Button{
  //////// Variables
  int x;
  int y;
  int w;
  int h;
  color c;
  
  color hC;
  
  String buttonDesc;
  //boolean isVisible;
  
  //////// Constructor
  Button(int startingX, int startingY, int startingWidth, int startingHeight, color startingC){  // Allows the class to be called into action
    x = startingX;
    y = startingY;
    w = startingWidth;
    h = startingHeight;
    
    c = startingC;
    hC = color(255,255,255);
    
    //buttonDesc = startingButtDesc;
}

  //////// Functions
  void render(String buttonDesc){ // Draws the Button
    if(isPressed() == true){
      fill(hC);
    }
    else{
      fill(c);
    }
    //fill(c);
    rect(x, y, w, h, 10);
    fill(color(255,255,255));
    text(buttonDesc, x, y);
  }
  
  boolean isPressed(){ // Checks to see if the button is pressed
    if(isInButton(x, y, w, h)){
      //println("button pressed!");
      return(true);
   }
   else{
     return(false);
   }
  }
 
   boolean isBetween(int num, int min, int max){ // Creates button borders for collision
    if(num > min && num < max){
    return(true);
  }
  else {
    return(false);
  }
  }
  
  boolean isInButton(int bx, int by, int bw, int bh){ // Checks to see if the mouse is inside the button
  int left = bx - bw/2;
  int right = bx + bw/2;
  int top = by - bh/2;
  int bottom = by + bh/2;
  
  if(isBetween(mouseX, left, right) &&
     isBetween(mouseY, top, bottom) ){
      return(true); 
     }
     else {
      return(false);
     }
  }
}

//boolean isVisible(){
//  if(
//}
