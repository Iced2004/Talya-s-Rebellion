// Declare Sound and Images
import processing.sound.*;
PImage menuBackground;
PImage owBackground;
PImage battleBackground;
PImage goBackground;
PImage winBackground;

SoundFile battleMusicPersona;
SoundFile menuMusicPersona;
SoundFile owMusicPersona;
SoundFile bossMusicPersona;

SoundFile battleMusicXenoblade;
SoundFile menuMusicXenoblade;
SoundFile owMusicXenoblade;
SoundFile bossMusicXenoblade;

SoundFile battleMusicPokemon;
SoundFile menuMusicPokemon;
SoundFile owMusicPokemon;
SoundFile bossMusicPokemon;

SoundFile billyPunch;
SoundFile talyaSword;
SoundFile daisyGun;
SoundFile sephiSword;
// Declare Sprites
PImage[] talyaWalk = new PImage[4];
PImage[] talyaAtk = new PImage[3];
PImage[] billy = new PImage[4];
PImage[] daisy = new PImage[8];
PImage talyaDown;
PImage billyDown;
PImage daisyDown;
PImage sephiDead;

PImage[] boxer = new PImage[3];
PImage[] fencer = new PImage[4];
PImage[] acrobat = new PImage[6];
PImage[] sephiroth = new PImage[26];

Animation talyaWalkCycle;
Animation talyaAttack;
Animation billyAttack;
Animation daisyAttack;

Animation boxerAttack;
Animation fencerAttack;
Animation acrobatAttack;
Animation sephirothAttack;
// Declare Classes
  // Declare Battle Classes
Button butt1;
Button butt2;
Button butt3;
Button butt4;

String button1;
String button2;
String button3;
String button4;

Menu m1;

Enemy evil1;
Enemy evil2;
Enemy evil3;
Enemy evil4;

Player ally1;
Player ally2;
Player ally3;

int startingHP;

  // Declare Menu Classes
Button menuButt1;
Button menuButt2;
Button menuButt3;
Button menuButt4;

Menu m2;

  // Declare Options Classes
Button optionButt1;
Button optionButt2;
Button optionButt3;
Button optionButt4;

Menu m3;

int scene = 0;
int test;
String none = " ";
boolean isHardMode;
String musicChoice = "Persona";
int selectedMusic = 1;

int menuButt1x;
int menuButt1y;
int menuButt2x;
int menuButt2y;
int menuButt3x;
int menuButt3y;
// Turn Variables

int turnState;
int turnProgress;
int battle;
int menuAction;

int playerTurn;
String playerPlacement;

String turnText;
String turnAftermath;

boolean isPlayerTurn;
int enemyTurn;

  // Declare Overworld Variables
PlayerOW player;
ObjectOW object1;
ObjectOW object2;
ObjectOW object3;
int encounter;

int playerX = 50;
int playerY = 720/2;
boolean isObject1Dead = false;
boolean isObject2Dead = false;

// Timer Variables
int startTimeScore;
int startTime;
int currentTime;
int interval = 2000;
int intervalS = 1500;

// Item Variables
int hpItemCount;
int atkItemCount;
int aoeItemCount;
String affectedPlayerName;
boolean didItemFail;
int affectedPlayerHP;
String buffExpiry;
int isAoeBuff;
int aoeBuffCount;

// Score Variables
int score;

void setup(){
  // General Settings
  size(1280,720);
  rectMode(CENTER);
  imageMode(CENTER);
  startTime = millis();
  textAlign(CENTER, CENTER);
  textSize(12);
  smooth(8);
  
  if(isHardMode == true){
    startingHP = 15;
  }
  else {
    startingHP = 30;
  }
  // Init Sound and Images
  menuBackground = loadImage("menuBackground.png");
  menuBackground.resize(width, height);
  
  owBackground = loadImage("owBackground.gif");
  owBackground.resize(width, height);
  
  battleBackground = loadImage("battleBackground.png");
  battleBackground.resize(1280, 1097);
  
  goBackground = loadImage("goBackground.jpg");
  goBackground.resize(width, height);
 
  winBackground = loadImage("winBackground.gif");
  winBackground.resize(width, height);
  battleMusicPersona = new SoundFile(this, "battleMusicPersona.mp3");
  menuMusicPersona = new SoundFile(this, "menuMusicPersona.mp3");
  owMusicPersona = new SoundFile(this, "owMusicPersona.mp3");
  owMusicPersona.amp(0.9);
  bossMusicPersona = new SoundFile(this, "bossMusicPersona.mp3");
  
  battleMusicXenoblade = new SoundFile(this, "battleMusicXenoblade.mp3");
  menuMusicXenoblade = new SoundFile(this, "menuMusicXenoblade.mp3");
  owMusicXenoblade = new SoundFile(this, "owMusicXenoblade.mp3");
  bossMusicXenoblade = new SoundFile(this, "bossMusicXenoblade.mp3");
  
  battleMusicPokemon = new SoundFile(this, "battleMusicPokemon.mp3");
  menuMusicPokemon = new SoundFile(this, "menuMusicPokemon.mp3");
  owMusicPokemon = new SoundFile(this, "owMusicPokemon.mp3");
  bossMusicPokemon = new SoundFile(this, "bossMusicPokemon.mp3");
  
  billyPunch = new SoundFile(this, "billyPunch.mp3");
  talyaSword = new SoundFile(this, "talyaSword.wav");
  daisyGun = new SoundFile(this, "daisyGun.mp3");
  sephiSword = new SoundFile(this, "sephiSword.wav");
  // Init Sprites
  for (int index=0; index<talyaWalk.length; index++){
    talyaWalk[index] = loadImage("talyawalk" + index + ".png");
  }
  for (int index=0; index<talyaAtk.length; index++){
    talyaAtk[index] = loadImage("talyaatk" + index + ".png");
  }
  for (int index=0; index<billy.length; index++){
    billy[index] = loadImage("billy" + index + ".png");
  }
  for (int index=0; index<daisy.length; index++){
    daisy[index] = loadImage("daisy" + index + ".png");
  }
  
  for (int index=0; index<boxer.length; index++){
    boxer[index] = loadImage("boxer" + index + ".png");
  }
  for (int index=0; index<fencer.length; index++){
    fencer[index] = loadImage("fencer" + index + ".png");
  }
  for (int index=0; index<acrobat.length; index++){
    acrobat[index] = loadImage("acrobat" + index + ".png");
  }
  for (int index=0; index<sephiroth.length; index++){
    sephiroth[index] = loadImage("sephi" + index + ".png");
  }
  
  talyaDown = loadImage("talyaDown.png");
  //talyaDown.resize(96, 96);
  daisyDown = loadImage("daisyDown.png");
  //daisyDown.resize(96, 96);
  billyDown = loadImage("billyDown.png");
  //billyDown.resize(96, 96);
  
   // Init Animation Vars
   talyaWalkCycle = new Animation(talyaWalk, 0.1, 3.0);
   talyaAttack = new Animation(talyaAtk, 0.1, 3.0);
   billyAttack = new Animation(billy, 0.08, 2.0);
   daisyAttack = new Animation(daisy, 0.1, 2.0);
   
   boxerAttack = new Animation(boxer, 0.08, 2.0);
   fencerAttack = new Animation(fencer, 0.08, 2.0);
   acrobatAttack = new Animation(acrobat, 0.08, 2.0);
   sephirothAttack = new Animation(sephiroth, 0.3, 2.0);
  //Init Button Labels
  button1 = "Attack";
  button2 = "Stats";
  button3 = "Item";
  button4 = "Run";
  
  // Init Classes
    // Init Battle Classes
    butt1 = new Button(width/3,height-height/3,75,75,color(0,50,200));
    butt2 = new Button(width-width/3,height-height/3,75,75,color(0,200,50));
    butt3 = new Button(width/3,height-height/6,75,75,color(200,50,200));
    butt4 = new Button(width-width/3,height-height/6,75,75,color(200,200,50));
    
    m1 = new Menu(width/2,height-height/4,width/2+width/5,height/3,color(0,0,255));
    
    evil1 = new Enemy(1,75);
    evil2 = new Enemy(2,75);
    evil3 = new Enemy(3,75);
    evil4 = new Enemy(4, 250);
    
    ally1 = new Player(1,75, startingHP);
    ally2 = new Player(2,75, startingHP);
    ally3 = new Player(3,75, startingHP);
  
    // Init Menu Classes
    menuButt1x = width-width/6;
    menuButt1y = height/2-50;
    menuButt2x = width-width/6;
    menuButt2y = height/2+50;
    menuButt3x = width-width/6;
    menuButt3y = height/2 + 100;
    m2 = new Menu(width-width/6,height-height/2,width/4,height-height/2,color(0,0,255));
    
    menuButt1 = new Button(menuButt1x,menuButt1y,200,75,color(0,200,200));
    menuButt2 = new Button(menuButt2x,menuButt2y,200,75,color(0,50,200));
    menuButt3 = new Button(menuButt3x,menuButt3y,200,75,color(0,50,200));
    //menuButt4 = new Button(width-width/6,height-height/4-25,200,75,color(0,50,200));
    
    // Init Overworld Classes
    player = new PlayerOW(playerX,playerY,100, 3, color(255,255,255));
    object1 = new ObjectOW(width/3, height-height/3-80, 50,75, color(255,255,255),1);
    object2 = new ObjectOW(width-width/3, height-height/4, 50,75, color(255,255,255),2);
    object3 = new ObjectOW(width-width/6, height/2, 100,100, color(255,255,255),3);
    encounter = 0;
    
    // Init Options Classes
    optionButt1 = new Button(menuButt1x,menuButt1y-50,200,75,color(0,200,200));
    optionButt2 = new Button(menuButt2x,menuButt2y-50,200,75,color(0,50,200));
    optionButt3 = new Button(menuButt3x,menuButt3y,200,75,color(0,50,200));
    
    m3 = new Menu(width-width/6, height-height/2, width/4, height-height/3,color(0,0,255));
    
    // Init Turn Variables
    turnProgress = 0;
    battle = 0;
    menuAction = 0;
    playerTurn = 0;
    turnState = 0;
    turnText = "Player did not attack the enemy!";
    turnAftermath = " ";
    
    // Init Item Variables
    hpItemCount = 5;
    atkItemCount = 3;
    aoeItemCount = 1;
    buffExpiry = " ";
    isAoeBuff = 0;
    aoeBuffCount = 2;
    
    //Init Dead Classes
    if(isObject1Dead == true){
      object1.isDefeated = true;
    }
    if(isObject2Dead == true){
      object2.isDefeated = true;
    }
    
    
}

void draw(){
  // General Settings
  background(42);
  currentTime = millis();
  //println(encounter);
  
 switch(scene){ // Determines whether to display the overworld, main menu, or battle scene
   case 0: // Main Menu
   image(menuBackground, width/2, height/2);
   if(selectedMusic == 1){
     if(menuMusicPersona.isPlaying() == false){
       menuMusicPersona.play();
      }
     }
     if(selectedMusic == 2){
     if(menuMusicXenoblade.isPlaying() == false){
       menuMusicXenoblade.play();
      }
     }
     if(selectedMusic == 3){
     if(menuMusicPokemon.isPlaying() == false){
       menuMusicPokemon.play();
      }
     }
   m2.render();
   textSize(30);
   menuButt1.render("Start!");
   menuButt2.render("Options");
   textSize(12);
   playerX = 50;
   playerY = height/2;
   break;
   case 1: // Overworld Scene
   menuMusicPersona.stop();
   menuMusicXenoblade.stop();
   menuMusicPokemon.stop();
   if(selectedMusic == 1){
     if(owMusicPersona.isPlaying() == false){
       owMusicPersona.play();
      }
     }
     if(selectedMusic == 2){
     if(owMusicXenoblade.isPlaying() == false){
       owMusicXenoblade.play();
      }
     }
     if(selectedMusic == 3){
     if(owMusicPokemon.isPlaying() == false){
       owMusicPokemon.play();
      }
     }
   image(owBackground, width/2, height/2);
   player.render();
   player.move();
   object1.render();
   object2.render();
   object3.render();
   battleMusicPersona.stop();
   //println(encounter);
   collisionOW();
   if (encounter == 5){
     playerX = player.x - player.size;
     playerY = player.y - player.size;
     scene = 2;
   }
   if (encounter == 6){
     playerX = player.x - player.size;
     playerY = player.y - player.size;
     scene = 2;
   }
   if (encounter == 7){
     playerX = player.x - player.size;
     playerY = player.y - player.size;
     scene = 5;
   }
   break;
   case 2: // Battle Scene Normal
   owMusicPersona.stop();
   owMusicXenoblade.stop();
   owMusicPokemon.stop();
   image(battleBackground, width/2, height/2);
  switch(battle){ // Handles Battle Sequences
    case 0: 
    startTimeScore = millis();
      if(selectedMusic == 1){
     if(battleMusicPersona.isPlaying() == false){
       battleMusicPersona.play();
      }
     }
     if(selectedMusic == 2){
     if(battleMusicXenoblade.isPlaying() == false){
       battleMusicXenoblade.play();
      }
     }
     if(selectedMusic == 3){
     if(battleMusicPokemon.isPlaying() == false){
       battleMusicPokemon.play();
      }
     }
      
      evil1.render();
      evil2.render();
      evil3.render();
      
      ally1.render();
      ally2.render();
      ally3.render();
      //println(encounter);
      
      
      switch(turnProgress){
        case 0: // Player 1 Turn
         if(evil1.hp <= 0 && evil2.hp <= 0 && evil3.hp <= 0){
           startTime = millis();
            turnProgress = 7;         
          }
          if(ally1.hp <= 0 && ally2.hp <= 0 && ally3.hp <= 0){
              startTime = millis();
            turnProgress = 14;
          }
          if(ally1.hp > 0) {
          isPlayerTurn = true;
           m1.render();
           m1.renderText(ally1.name);
           
           butt1.render(button1);
           butt2.render(button2);
           butt3.render(button3);
           butt4.render(button4);
          }
          if (ally2.hp > 0 || ally3.hp > 0){
            if(ally1.hp <= 0){
        turnText = ally1.name + " is down!";
        turnAftermath = " ";
        textSize(30);
        fill(255,255,255);
        textSize(12);
              startTime = millis();
              turnProgress = 1;
            }
            }          
        break;
        case 1:
        //Enemy 1 Turn
        buffExpiration();
        enemyTurn = 1;
        textSize(30);
        fill(255,255,255);
        text(turnText, width/2,height-height/3);
        text(turnAftermath, width/2, height-height/4);
        text(buffExpiry, width/2, height-height/5);
        textSize(12);
          if(currentTime - startTime > interval){
            if(evil1.hp > 0){
              if(ally1.hp <= 0){
            println("Enemy 1 attacked the Player!");
            startTime = millis();
            evil1.attack(ally2);
            println("Player HP: " + ally2.hp);
        
            turnText = evil1.name + " attacked " + ally2.name + "!";
            turnAftermath = ally2.name + "'s HP: " + ally2.hp;
            turnProgress = 2;
            }
            if(ally2.hp <= 0 && ally1.hp <= 0){
            println("Enemy 1 attacked the Player!");
            startTime = millis();
            evil1.attack(ally3);
            println("Player HP: " + ally3.hp);
        
            turnText = evil1.name + " attacked " + ally3.name + "!";
            turnAftermath = ally3.name + "'s HP: " + ally3.hp;
            turnProgress = 2;
              }
              if(ally1.hp > 0){
            println("Enemy 1 attacked the Player!");
            startTime = millis();
            evil1.attack(ally1);
            println("Player HP: " + ally1.hp);
        
            turnText = evil1.name + " attacked " + ally1.name + "!";
            turnAftermath = ally1.name + "'s HP: " + ally1.hp;
            turnProgress = 2;
            }
            }
            if (evil1.hp <= 0){
              turnText = evil1.name + " is dead!";
              startTime = millis();
              turnAftermath = " ";
              turnProgress = 2;
            }
            
          }
        break;
        case 2: // Enemy Attack
        fill(255,255,255);
        textSize(30);
        text(turnText, width/2,height-height/3);
        text(turnAftermath, width/2, height-height/4);
        textSize(12);
        if(currentTime - startTime > interval){
            
            startTime = millis();
          if(enemyTurn == 1){
            turnProgress = 5;
            menuAction = 0;
          }
          if(enemyTurn == 2){
            turnProgress = 6;
            menuAction = 0;
          }
          if(enemyTurn == 3){
            turnProgress = 0;
            menuAction = 0;
            //turnProgress = 0;
          }
        }
          
        break;
        case 3:
        //Enemy 2 Turn
        buffExpiration();
        enemyTurn = 2;
        textSize(30);
        fill(255,255,255);
        text(turnText, width/2,height-height/3);
        text(turnAftermath, width/2, height-height/4);
        text(buffExpiry, width/2, height-height/5);
        textSize(12);
          if(currentTime - startTime > interval){
            if(evil2.hp > 0){
            if(ally2.hp <= 0){
            println("Enemy 1 attacked the Player!");
            startTime = millis();
            evil1.attack(ally3);
            println("Player HP: " + ally3.hp);
        
            turnText = evil1.name + " attacked " + ally3.name + "!";
            turnAftermath = ally3.name + "'s HP: " + ally3.hp;
            turnProgress = 2;
            }
            if(ally3.hp <= 0 && ally2.hp <= 0){
            println("Enemy 1 attacked the Player!");
            startTime = millis();
            evil1.attack(ally1);
            println("Player HP: " + ally1.hp);
        
            turnText = evil1.name + " attacked " + ally1.name + "!";
            turnAftermath = ally1.name + "'s HP: " + ally1.hp;
            turnProgress = 2;
              }
              if(ally2.hp > 0){
            println("Enemy 2 attacked the Player!");
            startTime = millis();
            evil2.attack(ally2);
            println("Player HP: " + ally2.hp);
        
            turnText = evil2.name + " attacked " + ally2.name + "!";
            turnAftermath = ally2.name + "'s HP: " + ally2.hp;
            turnProgress = 2;
              }
            }
            if (evil2.hp <= 0){
              turnText = evil2.name + " is dead!";
              startTime = millis();
              turnAftermath = " ";
              turnProgress = 2;
              //menuAction = 0;
            }
            
          }
          break;
          case 4:
        //Enemy 3 Turn
        buffExpiration();
        enemyTurn = 3;
        textSize(30);
        fill(255,255,255);
        text(turnText, width/2,height-height/3);
        text(turnAftermath, width/2, height-height/4);
        text(buffExpiry, width/2, height-height/5);
        textSize(12);
          if(currentTime - startTime > interval){
            if(evil3.hp > 0){
              if(ally3.hp <= 0){
            println("Enemy 1 attacked the Player!");
            startTime = millis();
            evil1.attack(ally1);
            println("Player HP: " + ally1.hp);
        
            turnText = evil1.name + " attacked " + ally1.name + "!";
            turnAftermath = ally1.name + "'s HP: " + ally1.hp;
            turnProgress = 2;
            }
            if(ally1.hp <= 0 && ally3.hp <= 0){
            println("Enemy 1 attacked the Player!");
            startTime = millis();
            evil1.attack(ally2);
            println("Player HP: " + ally2.hp);
        
            turnText = evil1.name + " attacked " + ally2.name + "!";
            turnAftermath = ally2.name + "'s HP: " + ally2.hp;
            turnProgress = 2;
              }
              if(ally3.hp > 0){
            println("Enemy 3 attacked the Player!");
            startTime = millis();
            evil3.attack(ally3);
            println("Player HP: " + ally3.hp);
        
            turnText = evil3.name + " attacked " + ally3.name + "!";
            turnAftermath = ally3.name + "'s HP: " + ally3.hp;
            turnProgress = 2;
            }
            }
            if (evil3.hp <= 0){
              turnText = evil3.name + " is dead!";
              startTime = millis();
              turnAftermath = " ";
              turnProgress = 2;
              //menuAction = 0;
            }
            
          }
          break;
          case 5: // Player 2 Turn
          if(evil1.hp <= 0 && evil2.hp <= 0 && evil3.hp <= 0){
            startTime = millis();
            turnProgress = 7;
          }
          if(ally1.hp <= 0 && ally2.hp <= 0 && ally3.hp <= 0){
              startTime = millis();
            turnProgress = 14;
          }
          if(ally2.hp > 0) {
          isPlayerTurn = true;
           m1.render();
           m1.renderText(ally2.name);
           
           butt1.render(button1);
           butt2.render(button2);
           butt3.render(button3);
           butt4.render(button4);
          }
          if (ally1.hp > 0 || ally3.hp > 0){
            if(ally2.hp <= 0){
        turnText = ally2.name + " is down!";
        turnAftermath = " ";
        textSize(30);
        fill(255,255,255);
        textSize(12);
              startTime = millis();
              turnProgress = 3;
            }
            }       
           break;
           case 6: // Player 3 Turn
            if(evil1.hp <= 0 && evil2.hp <= 0 && evil3.hp <= 0){
              startTime = millis();
            turnProgress = 7;
          }
          if(ally1.hp <= 0 && ally2.hp <= 0 && ally3.hp <= 0){
              startTime = millis();
            turnProgress = 14;
          }
          if (ally3.hp > 0) {
           isPlayerTurn = true;
           m1.render();
           m1.renderText(ally3.name);
           
           butt1.render(button1);
           butt2.render(button2);
           butt3.render(button3);
           butt4.render(button4);
          }
          if (ally2.hp > 0 || ally1.hp > 0){
            if(ally3.hp <= 0){
        turnText = ally3.name + " is down!";
        turnAftermath = " ";
        textSize(30);
        fill(255,255,255);
        textSize(12);
              startTime = millis();
              turnProgress = 4;
            }
            }       
           break;
           case 7: // Win Screen
           battleMusicPersona.stop();
           battleMusicXenoblade.stop();
           battleMusicPokemon.stop();
           textSize(30);
           fill(255,255,255);
           text("You Win!", width/2,height-height/3);
           textSize(12);
           if(encounter == 5){
             isObject1Dead = true;
             }
             if(encounter == 6){
               isObject2Dead = true;
             }
             //score = 10000 - startTimeScore/3;
           if(currentTime - startTime > interval){
             setup();
             scene = 1;
           }
           break;
           case 8: // Player Stats
           textSize(16);
           m1.render();
           m1.renderText("Player Stats");
           menuAction = 4;
           
           textSize(30);
           fill(255,255,255);
           if(ally1.hp > 0){
             text(ally1.name + "'s HP: " + ally1.hp + " / ATK Buff: " + ally1.isAtkBuffed, width/3,height-height/2.7);
             if(isAoeBuff == 1){
               text("AOE Buff is active!", width/3, height-height/3);
             }
           }
           else {
             text(ally1.name + ": Down", width/3, height-height/3);
           }
           if(ally2.hp > 0){
           text(ally2.name + "'s HP: " + ally2.hp + " / ATK Buff: " + ally2.isAtkBuffed, width/3,height-height/3.6);
           if(isAoeBuff == 2){
               text("AOE Buff is active!", width/3, height-height/4.2);
             }
           }
           else {
             text(ally2.name + ": Down", width/3, height-height/3);
           }
           if(ally3.hp > 0){
           text(ally3.name + "'s HP: " + ally3.hp + " / ATK Buff: " + ally3.isAtkBuffed, width-width/3, height-height/2.7);
           if(isAoeBuff == 3){
               text("AOE Buff is active!", width/3, height-height/3);
             }
           }
           else {
             text(ally3.name + ": Down", width/3, height-height/3);
           }
           textSize(12);
           butt3.render("Enemy");
           butt4.render("Back");
           break;
           case 9: // Enemy Stats
           textSize(16);
           m1.render();
           m1.renderText("Enemy Stats");
           menuAction = 5;
           
           textSize(30);
           fill(255,255,255);
           text(evil1.name + " HP: " + evil1.hp, width/3,height-height/2.7);
           text(evil2.name + " HP: " + evil2.hp, width/3,height-height/3.6);
           text(evil3.name + " HP: " + evil3.hp, width-width/3, height-height/2.7);
           textSize(12);
           butt3.render("Player");
           butt4.render("Back");
           break;
           case 10: // Items
           m1.render();
           
           butt1.render("HP Up: " + hpItemCount);
           butt2.render("ATK Up: " + atkItemCount);
           butt3.render("AOE Buff: "+ aoeItemCount);
           butt4.render("Back");
           break;
           case 11: // Apply selected item to player
           m1.render();
           
           butt1.render(ally1.name);
           butt2.render(ally2.name);
           butt3.render(ally3.name);
           butt4.render("Back");
           break;
           case 12: // HP Text Info
            //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
          
           textSize(30);
           fill(255,255,255);
           
           text(affectedPlayerName + " got healed!", width/2,height-height/3);
           text(affectedPlayerName + " HP: " + affectedPlayerHP, width/2, height-height/4);
           textSize(12);
            if(currentTime - startTime > interval){
             if(turnState == 0){
               turnProgress = 1;
             }
             if(turnState == 5){
               turnProgress = 3;
             }
             if(turnState == 6){
               turnProgress = 4;
             }
           }
           break;
           case 13: // ATK Buff Text Info
         //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
          
           textSize(30);
           fill(255,255,255);
           text(affectedPlayerName + " got buffed!", width/2,height-height/3);
           //text(affectedPlayerName + " HP: " + affectedPlayerHP, width/2, height-height/4);
           textSize(12);
           println("turnState " + turnState);
            if(currentTime - startTime > interval){
             if(turnState == 0){
               turnProgress = 1;
             }
             if(turnState == 5){
               turnProgress = 3;
             }
             if(turnState == 6){
               turnProgress = 4;
             }
           }
           break;
           case 14:
           textSize(30);
           fill(255,255,255);
           text("All your allies are down!", width/2,height-height/3);
           textSize(12);
           if(currentTime - startTime > interval){
             
             scene = 3;
           }
           break;
           case 15:
           aoeBuff();
           
           break;
           case 16:
           //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
          
           textSize(30);
           fill(255,255,255);
           text(affectedPlayerName + " now can attack all enemies at once!", width/2,height-height/3);
           //text(affectedPlayerName + " HP: " + affectedPlayerHP, width/2, height-height/4);
           textSize(12);
            if(currentTime - startTime > interval){
             if(turnState == 0){
               turnProgress = 1;
             }
             if(turnState == 5){
               turnProgress = 3;
             }
             if(turnState == 6){
               turnProgress = 4;
             }
           }
           break;
        default:
        turnProgress = 0;
        break;
      }
  break;
  
  }
  break;
  case 3: // Game Over Screen
  battleMusicPersona.stop();
  battleMusicXenoblade.stop();
  battleMusicPokemon.stop();
  
  bossMusicPersona.stop();
  bossMusicXenoblade.stop();
  bossMusicPokemon.stop();
  image(goBackground, width/2, height/2);
  image(talyaDown, width/2-100,height/2+50);
  image(billyDown, width/2+100,height/2+50);
  image(daisyDown, width/2,height/2+150);
  textSize(30);
  text("Game Over!", width/2, height/2);
  text("Press space to return to the Main Menu.", width/2, height-height/6);
  break;
  case 4: // Options
  menuMusicPersona.stop();
   menuMusicXenoblade.stop();
   menuMusicPokemon.stop();
  image(menuBackground, width/2, height/2);
   m3.render();
   textSize(20);
   if(isHardMode == true){
     optionButt1.render("Disable Hard Mode");
   }
   else {
     optionButt1.render("Enable Hard Mode");
   }
   if(selectedMusic == 1){
     musicChoice = "Persona";
   menuMusicPokemon.stop();
   optionButt2.render("Music: " + musicChoice);
   println(musicChoice + selectedMusic);
   }
   if(selectedMusic == 2){
     musicChoice = "Xenoblade";
   menuMusicPersona.stop();
   optionButt2.render("Music: " + musicChoice);
   println(musicChoice + selectedMusic);
   }
   if(selectedMusic == 3){
     musicChoice = "Pokémon";
     menuMusicXenoblade.stop();
   optionButt2.render("Music: " + musicChoice);
   println(musicChoice + selectedMusic);
   }
   textSize(30);
   optionButt3.render("Back");
   textSize(12);
   break;
   case 5: // Boss Battle
   owMusicPersona.stop();
   owMusicXenoblade.stop();
   owMusicPokemon.stop();
   image(battleBackground, width/2, height/2);
  switch(battle){ // Handles Battle Sequences
    case 0: 
    startTimeScore = millis();
      if(selectedMusic == 1){
     if(bossMusicPersona.isPlaying() == false){
       bossMusicPersona.play();
      }
     }
     if(selectedMusic == 2){
     if(bossMusicXenoblade.isPlaying() == false){
       bossMusicXenoblade.play();
      }
     }
     if(selectedMusic == 3){
     if(bossMusicPokemon.isPlaying() == false){
       bossMusicPokemon.play();
      }
     }
      evil4.render();
      
      ally1.render();
      ally2.render();
      ally3.render();
      //println(encounter);
      
      
      switch(turnProgress){
        case 0: // Player 1 Turn
         if(evil4.hp <= 0){
           startTime = millis();
            turnProgress = 7;         
          }
          if(ally1.hp <= 0 && ally2.hp <= 0 && ally3.hp <= 0){
              startTime = millis();
            turnProgress = 14;
          }
          if(ally1.hp > 0) {
          isPlayerTurn = true;
           m1.render();
           m1.renderText(ally1.name);
           
           butt1.render(button1);
           butt2.render(button2);
           butt3.render(button3);
           butt4.render(button4);
          }
          if (ally2.hp > 0 || ally3.hp > 0){
            if(ally1.hp <= 0){
        turnText = ally1.name + " is down!";
        turnAftermath = " ";
        textSize(30);
        fill(255,255,255);
        textSize(12);
              startTime = millis();
              turnProgress = 1;
            }
            }          
        break;
        case 1:
        //Enemy Boss Turn (Attack Player 1)
        buffExpiration();
        enemyTurn = 1;
        textSize(30);
        fill(255,255,255);
        text(turnText, width/2,height-height/3);
        text(turnAftermath, width/2, height-height/4);
        text(buffExpiry, width/2, height-height/5);
        textSize(12);
          if(currentTime - startTime > interval){
            if(evil4.hp > 0){
              if(ally1.hp <= 0){
            println("Enemy 1 attacked the Player!");
            startTime = millis();
            evil4.attack(ally2);
            println("Player HP: " + ally2.hp);
        
            turnText = evil4.name + " attacked " + ally2.name + "!";
            turnAftermath = ally2.name + "'s HP: " + ally2.hp;
            turnProgress = 2;
            }
            if(ally2.hp <= 0 && ally1.hp <= 0){
            println("Enemy 1 attacked the Player!");
            startTime = millis();
            evil4.attack(ally3);
            println("Player HP: " + ally3.hp);
        
            turnText = evil4.name + " attacked " + ally3.name + "!";
            turnAftermath = ally3.name + "'s HP: " + ally3.hp;
            turnProgress = 2;
              }
              if(ally1.hp > 0){
            println("Enemy 1 attacked the Player!");
            startTime = millis();
            evil4.attack(ally1);
            println("Player HP: " + ally1.hp);
        
            turnText = evil4.name + " attacked " + ally1.name + "!";
            turnAftermath = ally1.name + "'s HP: " + ally1.hp;
            turnProgress = 2;
            }
            }
            if (evil4.hp <= 0){
              turnText = evil4.name + " is dead!";
              startTime = millis();
              turnAftermath = " ";
              turnProgress = 7;
            }
            
          }
        break;
        case 2: // Enemy Attack
        fill(255,255,255);
        textSize(30);
        text(turnText, width/2,height-height/3);
        text(turnAftermath, width/2, height-height/4);
        textSize(12);
        if(currentTime - startTime > interval){
            
            startTime = millis();
          if(enemyTurn == 1){
            turnProgress = 5;
            menuAction = 0;
          }
          if(enemyTurn == 2){
            turnProgress = 6;
            menuAction = 0;
          }
          if(enemyTurn == 3){
            turnProgress = 0;
            menuAction = 0;
            //turnProgress = 0;
          }
        }
          
        break;
        case 3:
        //Enemy Boss Turn (Attack Player 2)
        buffExpiration();
        enemyTurn = 2;
        textSize(30);
        fill(255,255,255);
        text(turnText, width/2,height-height/3);
        text(turnAftermath, width/2, height-height/4);
        text(buffExpiry, width/2, height-height/5);
        textSize(12);
          if(currentTime - startTime > interval){
            if(evil4.hp > 0){
            if(ally2.hp <= 0){
            println("Enemy 1 attacked the Player!");
            startTime = millis();
            evil4.attack(ally3);
            println("Player HP: " + ally3.hp);
        
            turnText = evil4.name + " attacked " + ally3.name + "!";
            turnAftermath = ally3.name + "'s HP: " + ally3.hp;
            turnProgress = 2;
            }
            if(ally3.hp <= 0 && ally2.hp <= 0){
            println("Enemy 1 attacked the Player!");
            startTime = millis();
            evil4.attack(ally1);
            println("Player HP: " + ally1.hp);
        
            turnText = evil4.name + " attacked " + ally1.name + "!";
            turnAftermath = ally1.name + "'s HP: " + ally1.hp;
            turnProgress = 2;
              }
              if(ally2.hp > 0){
            println("Enemy 2 attacked the Player!");
            startTime = millis();
            evil4.attack(ally2);
            println("Player HP: " + ally2.hp);
        
            turnText = evil4.name + " attacked " + ally2.name + "!";
            turnAftermath = ally2.name + "'s HP: " + ally2.hp;
            turnProgress = 2;
              }
            }
            if (evil4.hp <= 0){
              turnText = evil4.name + " is dead!";
              startTime = millis();
              turnAftermath = " ";
              turnProgress = 7;
              //menuAction = 0;
            }
            
          }
          break;
          case 4:
        //Enemy 3 Turn
        buffExpiration();
        enemyTurn = 3;
        textSize(30);
        fill(255,255,255);
        text(turnText, width/2,height-height/3);
        text(turnAftermath, width/2, height-height/4);
        text(buffExpiry, width/2, height-height/5);
        textSize(12);
          if(currentTime - startTime > interval){
            if(evil4.hp > 0){
              if(ally3.hp <= 0){
            println("Enemy 1 attacked the Player!");
            startTime = millis();
            evil4.attack(ally1);
            println("Player HP: " + ally1.hp);
        
            turnText = evil1.name + " attacked " + ally1.name + "!";
            turnAftermath = ally1.name + "'s HP: " + ally1.hp;
            turnProgress = 2;
            }
            if(ally1.hp <= 0 && ally3.hp <= 0){
            println("Enemy 1 attacked the Player!");
            startTime = millis();
            evil4.attack(ally2);
            println("Player HP: " + ally2.hp);
        
            turnText = evil4.name + " attacked " + ally2.name + "!";
            turnAftermath = ally2.name + "'s HP: " + ally2.hp;
            turnProgress = 2;
              }
              if(ally3.hp > 0){
            println("Enemy 3 attacked the Player!");
            startTime = millis();
            evil4.attack(ally3);
            println("Player HP: " + ally3.hp);
        
            turnText = evil4.name + " attacked " + ally3.name + "!";
            turnAftermath = ally3.name + "'s HP: " + ally3.hp;
            turnProgress = 2;
            }
            }
            if (evil4.hp <= 0){
              turnText = evil4.name + " is dead!";
              startTime = millis();
              turnAftermath = " ";
              turnProgress = 7;
              //menuAction = 0;
            }
            
          }
          break;
          case 5: // Player 2 Turn
          if(evil4.hp <= 0){
            startTime = millis();
            turnProgress = 7;
          }
          if(ally1.hp <= 0 && ally2.hp <= 0 && ally3.hp <= 0){
              startTime = millis();
            turnProgress = 14;
          }
          if(ally2.hp > 0) {
          isPlayerTurn = true;
           m1.render();
           m1.renderText(ally2.name);
           
           butt1.render(button1);
           butt2.render(button2);
           butt3.render(button3);
           butt4.render(button4);
          }
          if (ally1.hp > 0 || ally3.hp > 0){
            if(ally2.hp <= 0){
        turnText = ally2.name + " is down!";
        turnAftermath = " ";
        textSize(30);
        fill(255,255,255);
        textSize(12);
              startTime = millis();
              turnProgress = 3;
            }
            }       
           break;
           case 6: // Player 3 Turn
            if(evil4.hp <= 0){
              startTime = millis();
            turnProgress = 7;
          }
          if(ally1.hp <= 0 && ally2.hp <= 0 && ally3.hp <= 0){
              startTime = millis();
            turnProgress = 14;
          }
          if (ally3.hp > 0) {
           isPlayerTurn = true;
           m1.render();
           m1.renderText(ally3.name);
           
           butt1.render(button1);
           butt2.render(button2);
           butt3.render(button3);
           butt4.render(button4);
          }
          if (ally2.hp > 0 || ally1.hp > 0){
            if(ally3.hp <= 0){
        turnText = ally3.name + " is down!";
        turnAftermath = " ";
        textSize(30);
        fill(255,255,255);
        textSize(12);
              startTime = millis();
              turnProgress = 4;
            }
            }       
           break;
           case 7: // Win Screen
           textSize(30);
           fill(255,255,255);
           text("you win!", width/2,height-height/3);
           textSize(12);
           if(encounter == 5){
             isObject1Dead = true;
             }
             if(encounter == 6){
               isObject2Dead = true;
             }
             //score = 10000 - startTimeScore/3;
           if(currentTime - startTime > interval){
             //setup();
             scene = 6;
           }
           break;
           case 8: // Player Stats
           textSize(16);
           m1.render();
           m1.renderText("Player Stats");
           menuAction = 4;
           
           textSize(30);
           fill(255,255,255);
           if(ally1.hp > 0){
             text(ally1.name + "'s HP: " + ally1.hp + " / ATK Buff: " + ally1.isAtkBuffed, width/3,height-height/2.7);
             if(isAoeBuff == 1){
               text("AOE Buff is active!", width/3, height-height/3);
             }
           }
           else {
             text(ally1.name + ": Down", width/3, height-height/2.7);
           }
           if(ally2.hp > 0){
           text(ally2.name + "'s HP: " + ally2.hp + " / ATK Buff: " + ally2.isAtkBuffed, width/3,height-height/3.6);
           if(isAoeBuff == 2){
               text("AOE Buff is active!", width/3, height-height/4.2);
             }
           }
           else {
             text(ally2.name + ": Down", width/3, height-height/3.6);
           }
           if(ally3.hp > 0){
           text(ally3.name + "'s HP: " + ally3.hp + " / ATK Buff: " + ally3.isAtkBuffed, width-width/3, height-height/2.7);
           if(isAoeBuff == 3){
               text("AOE Buff is active!", width/3, height-height/3);
             }
           }
           else {
             text(ally3.name + ": Down", width/3, height-height/2.7);
           }
           textSize(12);
           butt3.render("Enemy");
           butt4.render("Back");
           break;
           case 9: // Enemy Stats
           textSize(16);
           m1.render();
           m1.renderText("Enemy Stats");
           menuAction = 5;
           
           textSize(30);
           fill(255,255,255);
           text(evil4.name + " HP: " + evil4.hp, width/3,height-height/2.7);
           //text(evil2.name + " HP: " + evil2.hp, width/3,height-height/3.6);
           //text(evil3.name + " HP: " + evil3.hp, width-width/3, height-height/2.7);
           textSize(12);
           butt3.render("Player");
           butt4.render("Back");
           break;
           case 10: // Items
           m1.render();
           
           butt1.render("HP Up: " + hpItemCount);
           butt2.render("ATK Up: " + atkItemCount);
           butt3.render("AOE Buff: "+ aoeItemCount);
           butt4.render("Back");
           break;
           case 11: // Apply selected item to player
           m1.render();
           
           butt1.render(ally1.name);
           butt2.render(ally2.name);
           butt3.render(ally3.name);
           butt4.render("Back");
           break;
           case 12: // HP Text Info
            //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
          
           textSize(30);
           fill(255,255,255);
           
           text(affectedPlayerName + " got healed!", width/2,height-height/3);
           text(affectedPlayerName + " HP: " + affectedPlayerHP, width/2, height-height/4);
           textSize(12);
            if(currentTime - startTime > interval){
             if(turnState == 0){
               turnProgress = 1;
             }
             if(turnState == 5){
               turnProgress = 3;
             }
             if(turnState == 6){
               turnProgress = 4;
             }
           }
           break;
           case 13: // ATK Buff Text Info
         //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
          
           textSize(30);
           fill(255,255,255);
           text(affectedPlayerName + " got buffed!", width/2,height-height/3);
           //text(affectedPlayerName + " HP: " + affectedPlayerHP, width/2, height-height/4);
           textSize(12);
           println("turnState " + turnState);
            if(currentTime - startTime > interval){
             if(turnState == 0){
               turnProgress = 1;
             }
             if(turnState == 5){
               turnProgress = 3;
             }
             if(turnState == 6){
               turnProgress = 4;
             }
           }
           break;
           case 14:
           textSize(30);
           fill(255,255,255);
           text("All your allies are down!", width/2,height-height/3);
           textSize(12);
           if(currentTime - startTime > interval){
             
             scene = 3;
           }
           break;
           case 15:
           playerAtkBoss();
           break;
           case 16:
           //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
          
           textSize(30);
           fill(255,255,255);
           text(affectedPlayerName + " now can attack all enemies at once!", width/2,height-height/3);
           //text(affectedPlayerName + " HP: " + affectedPlayerHP, width/2, height-height/4);
           textSize(12);
            if(currentTime - startTime > interval){
             if(turnState == 0){
               turnProgress = 1;
             }
             if(turnState == 5){
               turnProgress = 3;
             }
             if(turnState == 6){
               turnProgress = 4;
             }
           }
           break;
        default:
        turnProgress = 0;
        break;
      }
  break;
  
  }
  break;
  case 6: //Finish Scene
  tint(0, 0, 204);
  image(winBackground, width/2, height/2);
  textSize(30);
  text("You defeated Sephiroth!", width/2, height/2);
  text("Final Score: " + score, width/2, height/3);
  text("Press space to restart!", width/2, height-height/4);
  break;
}
}

void mousePressed(){
     if(isPlayerTurn == true){
  if(butt1.isPressed() == true){
    //println("Button 1 has been pressed!");
    butt1.hC = color(150,150,150);
  }
  if(butt2.isPressed() == true){
    //println("Button 2 has been pressed!");
    butt2.hC = color(150,150,150);
  }
  if(butt3.isPressed() == true){
    //println("Button 3 has been pressed!");
    butt3.hC = color(150,150,150);
  }
  if(butt4.isPressed() == true){
    //println("Button 4 has been pressed!");
    butt4.hC = color(150,150,150);
    }
   }
}

void mouseReleased(){
  butt1.hC = color(255,255,255);
  butt2.hC = color(255,255,255);
  butt3.hC = color(255,255,255);
  butt4.hC = color(255,255,255);
  
  switch(scene){ // Same Thing as in Draw
    case 0:
  if(menuButt1.isPressed() == true){
    println("Button 1 has been pressed!");
    menuMusicPersona.stop();
   menuMusicXenoblade.stop();
   menuMusicPokemon.stop();
    scene = 1;
    butt1.hC = color(150,150,150);
  }
  if(menuButt2.isPressed() == true){
    println("Button 2 has been pressed!");
    scene = 4;
    butt2.hC = color(150,150,150);
  }
  //if(menuButt3.isPressed() == true){
    //println("Button 3 has been pressed!");
    //butt3.hC = color(150,150,150);
  //}
  //if(menuButt4.isPressed() == true){
    //println("Button 4 has been pressed!");
    //butt4.hC = color(150,150,150);
    //}
    break;
    case 1:
    //scene = 2;
    break;
    case 2:
  switch(menuAction){
    case 0: // Default Menu
       if(isPlayerTurn == true){
    if(butt1.isPressed() == true){ // Attack
      butt1.hC = color(255,255,255);
      if(turnProgress == 0){
        if(isAoeBuff == 1){
          aoeBuffCount -= 1;
          turnProgress = 15;
        }
        else {
      menuAction = 1;
      turnProgress = 2000;
        }
      }
      if(turnProgress == 5){
        if(isAoeBuff == 2){
          aoeBuffCount -= 1;
          turnProgress = 15;
        }
        else {
        menuAction = 2;
        turnProgress = 5;
        }
      }
      if(turnProgress == 6){
        if(isAoeBuff == 3){
          aoeBuffCount -= 1;
          turnProgress = 15;
        }
        else {
        menuAction = 3;
        turnProgress = 6;
        }
      }
      
   button1 = evil1.name;
   button2 = evil2.name;
   button3 = evil3.name;
   button4 = "Back";
    }
    if(butt2.isPressed() == true){ // Stats
      println("Enemy HP: " + evil1.hp + " " + evil2.hp + " " + evil3.hp);
      println("Player HP: " + ally1.hp + " " + ally2.hp + " " + ally3.hp);
      butt2.hC = color(255,255,255);
      turnState = turnProgress;
      println(turnProgress);
      turnProgress = 8;
    }
    if(butt3.isPressed() == true){ // Items
      butt3.hC = color(255,255,255);
      turnState = turnProgress;
      
     button1 = evil1.name;
     button2 = evil2.name;
     button3 = evil3.name;
     button4 = "Back";
     
      menuAction = 6;
      turnProgress = 10;
    }
    if(butt4.isPressed() == true){ // Run
      butt4.hC = color(255,255,255);
      battleMusicPersona.stop();
      battleMusicXenoblade.stop();
      battleMusicPokemon.stop();
      
       setup();
       scene = 1;
      }
     }
   break;
   case 1: // Attack Menu (Player 1)
   //turnProgress = 5;
      if(isPlayerTurn == true){
    if(butt1.isPressed() == true){
      // Attack Enemy 1
      if(evil1.hp > 0){
      println("You attacked the " + evil1.name + "!");
      butt1.hC = color(255,255,255);
      ally1.attack(evil1);
      println(evil1.name + "'s HP: " + evil1.hp);
      turnText = ally1.name + " attacked " + evil1.name + "!";
      turnAftermath = evil1.name + "'s HP: " + evil1.hp;
      
        //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      // Prepare for next turn
      turnProgress = 1;
      isPlayerTurn = false;
      startTime = millis();
      }
      else {
        println("that man is dead");
      }

    }
    if(butt2.isPressed() == true){
      // Attack Enemy 2
      if(evil2.hp > 0){
      fill(255,255,255);
      println("You attacked the " + evil2.name + "!");
      butt1.hC = color(255,255,255);
      ally1.attack(evil2);
      println(evil2.name + "'s HP: " + evil2.hp);
      turnText = ally1.name + " attacked " + evil2.name + "!";
      turnAftermath = evil2.name + "'s HP: " + evil2.hp;
      
      // Prepare for next turn
      turnProgress = 1;
      isPlayerTurn = false;
      startTime = millis();
      
              //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
    }
    else {
      println("bro he's down!!");
    }
    }
    if(butt3.isPressed() == true){
      // Attack Enemy 3
      if(evil3.hp > 0){
      println("You attacked the " + evil3.name + "!");
      butt1.hC = color(255,255,255);
      ally1.attack(evil3);
      println(evil3.name + "'s HP: " + evil3.hp);
      turnText = ally1.name + " attacked " + evil3.name + "!";
      turnAftermath = evil3.name + "'s HP: " + evil3.hp;
      // Prepare for next turn
      turnProgress = 1;
      isPlayerTurn = false;
      startTime = millis();
      
              //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
    }
    else {
      println("Surely he's okay... right?");
    }
    }
    if(butt4.isPressed() == true){
      println("Button 4 has been pressed!");
      butt4.hC = color(255,255,255);
      menuAction = 0;
          //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      }
     }
     break;
     case 2: // Attack Menu (Player 2)
           if(isPlayerTurn == true){
    if(butt1.isPressed() == true){
      // Attack Enemy 1
      if(evil1.hp > 0){
      println("You attacked the " + evil1.name + "!");
      butt1.hC = color(255,255,255);
      ally2.attack(evil1);
      println(evil1.name + "'s HP: " + evil1.hp);
      turnText = ally2.name + " attacked " + evil1.name + "!";
      turnAftermath = evil1.name + "'s HP: " + evil1.hp;
      
        //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      // Prepare for next turn
      turnProgress = 3;
      isPlayerTurn = false;
      startTime = millis();
      }
      else {
        println("that nigga is dead");
      }

    }
    if(butt2.isPressed() == true){
      // Attack Enemy 2
      if(evil2.hp > 0){
      fill(255,255,255);
      println("You attacked the " + evil2.name + "!");
      butt1.hC = color(255,255,255);
      ally2.attack(evil2);
      println(evil2.name + "'s HP: " + evil2.hp);
      turnText = ally2.name + " attacked " + evil2.name + "!";
      turnAftermath = evil2.name + "'s HP: " + evil2.hp;
      
      // Prepare for next turn
      turnProgress = 3;
      isPlayerTurn = false;
      startTime = millis();
      
              //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
    }
    else {
      println("bro he's down!!");
    }
    }
    if(butt3.isPressed() == true){
      // Attack Enemy 3
      if(evil3.hp > 0){
      println("You attacked the " + evil3.name + "!");
      butt1.hC = color(255,255,255);
      ally2.attack(evil3);
      println(evil3.name + "'s HP: " + evil3.hp);
      turnText = ally2.name + " attacked " + evil3.name + "!";
      turnAftermath = evil3.name + "'s HP: " + evil3.hp;
      // Prepare for next turn
      turnProgress = 3;
      isPlayerTurn = false;
      startTime = millis();
      
              //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
    }
    else {
      println("Surely he's okay... right?");
    }
    }
    if(butt4.isPressed() == true){
      println("Button 4 has been pressed!");
      butt4.hC = color(255,255,255);
      menuAction = 0;
          //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      }
     }
     break;
     case 3: // Attack Menu (Player 3)
           if(isPlayerTurn == true){
    if(butt1.isPressed() == true){
      // Attack Enemy 1
      if(evil1.hp > 0){
      println("You attacked the " + evil1.name + "!");
      butt1.hC = color(255,255,255);
      ally3.attack(evil1);
      println(evil1.name + "'s HP: " + evil1.hp);
      turnText = ally3.name + " attacked " + evil1.name + "!";
      turnAftermath = evil1.name + "'s HP: " + evil1.hp;
      
        //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      // Prepare for next turn
      turnProgress = 4;
      isPlayerTurn = false;
      startTime = millis();
      }
      else {
        println("that man is dead");
      }

    }
    if(butt2.isPressed() == true){
      // Attack Enemy 2
      if(evil2.hp > 0){
      fill(255,255,255);
      println("You attacked the " + evil2.name + "!");
      butt1.hC = color(255,255,255);
      ally3.attack(evil2);
      println(evil2.name + "'s HP: " + evil2.hp);
      turnText = ally3.name + " attacked " + evil2.name + "!";
      turnAftermath = evil2.name + "'s HP: " + evil2.hp;
      
      // Prepare for next turn
      turnProgress = 4;
      isPlayerTurn = false;
      startTime = millis();
      
              //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
    }
    else {
      println("bro he's down!!");
    }
    }
    if(butt3.isPressed() == true){
      // Attack Enemy 3
      if(evil3.hp > 0){
      println("You attacked the " + evil3.name + "!");
      butt1.hC = color(255,255,255);
      ally3.attack(evil3);
      println(evil3.name + "'s HP: " + evil3.hp);
      turnText = ally3.name + " attacked " + evil3.name + "!";
      turnAftermath = evil3.name + "'s HP: " + evil3.hp;
      // Prepare for next turn
      turnProgress = 4;
      isPlayerTurn = false;
      startTime = millis();
      
              //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
    }
    else {
      println("Surely he's okay... right?");
    }
    }
    if(butt4.isPressed() == true){
      println("Button 4 has been pressed!");
      butt4.hC = color(255,255,255);
      menuAction = 0;
          //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      }
     }
     break;
     case 4: // Player Stats
    if(butt3.isPressed() == true){
      turnProgress = 9;
      butt3.hC = color(255,255,255);
    }
    if(butt4.isPressed() == true){
      butt4.hC = color(255,255,255);
      menuAction = 0;
      turnProgress = turnState;
      }
      break;
      case 5: // Enemy Stats
      if(butt3.isPressed() == true){
      turnProgress = 8;
      butt3.hC = color(255,255,255);
    }
    if(butt4.isPressed() == true){
      butt4.hC = color(255,255,255);
      menuAction = 0;
      turnProgress = turnState;
      }
      break;
      case 6: // Items
     if(butt1.isPressed() == true){
     menuAction = 7;
     turnProgress = 11;
     butt1.hC = color(255,255,255);
    }
    if(butt2.isPressed() == true){
      butt2.hC = color(255,255,255);
      menuAction = 8;
      turnProgress = 11;
      }
     if(butt3.isPressed() == true){
      menuAction = 9;
      turnProgress = 11;
     butt3.hC = color(255,255,255);
    }
    if(butt4.isPressed() == true){
      butt4.hC = color(255,255,255);
      //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      menuAction = 0;
      turnProgress = turnState;
      }
      break;
      case 7: //HP Up
         if(butt1.isPressed() == true){ // Player 1
           butt1.hC = color(255,255,255);
           if(hpItemCount > 0 && ally1.hp < startingHP && ally1.hp > 0){
           ally1.hpUp();
           hpItemCount -=1;
           affectedPlayerName = ally1.name;
           if(ally1.hp > startingHP){
                ally1.hp = startingHP;
           }
           affectedPlayerHP = ally1.hp;
           startTime = millis();
           turnProgress = 12;
           }
           if(ally1.hp <= 0){
             println(ally1.name + " is down!");
           }
           if(ally1.hp >= 30){
             println(ally1.name + "'s health is already full!");
           }
           if(hpItemCount <= 0){
             println("Out of HP Up!");
           }
        }
        if(butt2.isPressed() == true){ // Player 2
          butt2.hC = color(255,255,255);
          if(hpItemCount > 0 && ally2.hp < 30 && ally2.hp > 0){
           ally2.hpUp();
           hpItemCount -=1;
           affectedPlayerName = ally2.name;
           if(ally2.hp > startingHP){
                ally2.hp = startingHP;
           }
           affectedPlayerHP = ally2.hp;
           startTime = millis();
            turnProgress = 12;
           }
           if(ally2.hp <= 0){
             println(ally2.name + " is down!");
           }
           if(ally2.hp >= 30){
             println(ally2.name + "'s health is already full!");
           }
           if(hpItemCount <= 0){
             println("Out of HP Up!");
           }
          }
         if(butt3.isPressed() == true){
           butt3.hC = color(255,255,255);
           if(hpItemCount > 0 && ally3.hp < 30 && ally3.hp > 0){
           ally3.hpUp();
           hpItemCount -=1;
           affectedPlayerName = ally3.name;
           if(ally3.hp > startingHP){
                ally3.hp = startingHP;
           }
           affectedPlayerHP = ally3.hp;
           startTime = millis();
           turnProgress = 12;
           }
           if(ally3.hp <= 0){
             println(ally3.name + " is down!");
           }
           if(ally3.hp >= 30){
             println(ally3.name + "'s health is already full!");
           }
           if(hpItemCount <= 0){
             println("Out of HP Up!");
           }
        }
        if(butt4.isPressed() == true){
            butt4.hC = color(255,255,255);
            //Init Button Labels
              button1 = "Attack";
              button2 = "Stats";
              button3 = "Item";
              button4 = "Run";
            menuAction = 6;
            turnProgress = 10;
          }
      break;
      case 8: //ATK Up
       if(butt1.isPressed() == true){ // Player 1
           butt1.hC = color(255,255,255);
           if(atkItemCount > 0 && ally1.isAtkBuffed == false && ally1.hp > 0){
           ally1.isAtkBuffed = true;
           atkItemCount -=1;
           affectedPlayerName = ally1.name;
           affectedPlayerHP = ally1.hp;
           startTime = millis();
           turnProgress = 13;
           }
           if(atkItemCount <= 0){
             println("Out of ATK Up!");
           }
           if(ally1.isAtkBuffed == true){
             println("Already buffed!");
           }
           if(ally1.hp <= 0){
             println(ally1.name + " is down!");
           }
        }
        if(butt2.isPressed() == true){
          butt2.hC = color(255,255,255);
          if(atkItemCount > 0 && ally2.isAtkBuffed == false && ally2.hp > 0){
           ally2.isAtkBuffed = true;
           atkItemCount -=1;
           affectedPlayerName = ally2.name;
           affectedPlayerHP = ally2.hp;
           startTime = millis();
            turnProgress = 13;
           }
           if(atkItemCount <= 0){
             println("Out of ATK Up!");
           }
           if(ally2.isAtkBuffed == true){
             println("Already buffed!");
           }
           if(ally2.hp <= 0){
             println(ally2.name + " is down!");
           }
          }
         if(butt3.isPressed() == true){
           butt3.hC = color(255,255,255);
           if(atkItemCount > 0 && ally3.isAtkBuffed == false && ally3.hp > 0){
           ally3.isAtkBuffed = true;
           atkItemCount -=1;
           affectedPlayerName = ally3.name;
           affectedPlayerHP = ally3.hp;
           startTime = millis();
           turnProgress = 13;
           }
           if(atkItemCount <= 0){
             println("Out of ATK Up!");
           }
           if(ally3.isAtkBuffed == true){
             println("Already buffed!");
           }
           if(ally3.hp <= 0){
             println(ally3.name + " is down!");
           }
        }
        if(butt4.isPressed() == true){
            butt4.hC = color(255,255,255);
            //Init Button Labels
              button1 = "Attack";
              button2 = "Stats";
              button3 = "Item";
              button4 = "Run";
            menuAction = 6;
            turnProgress = 10;
          }
      break;
      case 9: // AOE Buff
      if(butt1.isPressed() == true){ // Player 1
           butt1.hC = color(255,255,255);
           if(aoeItemCount > 0 && ally1.hp > 0){
             isAoeBuff = 1;
           aoeItemCount -= 1;
           affectedPlayerName = ally1.name;
           affectedPlayerHP = ally1.hp;
           startTime = millis();
           turnProgress = 16;
           }
           if(ally1.hp <= 0){
             println(ally1.name + " is down!");
           }
           if(aoeItemCount <= 0){
             println("Already used");
           }
        }
        if(butt2.isPressed() == true){ // Player 2
           butt2.hC = color(255,255,255);
           if(aoeItemCount > 0 && ally2.hp > 0){
             isAoeBuff = 2;
           aoeItemCount -= 1;
           affectedPlayerName = ally2.name;
           affectedPlayerHP = ally2.hp;
           startTime = millis();
           turnProgress = 16;
           }
           if(ally2.hp <= 0){
             println(ally2.name + " is down!");
           }
           if(aoeItemCount <= 0){
             println("Already used");
           }
        }
          
         if(butt3.isPressed() == true){ // Player 3
           butt3.hC = color(255,255,255);
           if(aoeItemCount > 0 && ally3.hp > 0){
             isAoeBuff = 3;
           aoeItemCount -= 1;
           affectedPlayerName = ally3.name;
           affectedPlayerHP = ally3.hp;
           startTime = millis();
           turnProgress = 16;
           }
           if(ally3.hp <= 0){
             println(ally3.name + " is down!");
           }
           if(aoeItemCount <= 0){
             println("Already used");
           }
        }
        if(butt4.isPressed() == true){
            butt4.hC = color(255,255,255);
            //Init Button Labels
              button1 = "Attack";
              button2 = "Stats";
              button3 = "Item";
              button4 = "Run";
            menuAction = 6;
            turnProgress = 10;
          }
      break;
     }
     break;
     case 4:
    if(optionButt1.isPressed() == true){
    println("Button 1 has been pressed!");
    if(isHardMode == false){
      isHardMode = true;
    }
    else {
      isHardMode = false;
    }
    optionButt1.hC = color(150,150,150);
  }
  if(optionButt2.isPressed() == true){
    if(selectedMusic == 1){
      musicChoice = "Persona";
      //selectedMusic = 2;
    }
    if(selectedMusic == 2){
    musicChoice = "Xenoblade";
    //selectedMusic = 3;
    }
    if(selectedMusic == 3){
      musicChoice = "Pokémon";
      //selectedMusic = 1;
    }
    selectedMusic += 1;
    if(selectedMusic > 3){
      selectedMusic = 1;
    }
    optionButt2.hC = color(150,150,150);
  }
  if(optionButt3.isPressed() == true){
    println("Button 3 has been pressed!");
    setup();
    scene = 0;
    optionButt3.hC = color(150,150,150);
  }
     break;
     case 5:
     switch(menuAction){
    case 0: // Default Menu
       if(isPlayerTurn == true){
    if(butt1.isPressed() == true){ // Attack
      butt1.hC = color(255,255,255);
        turnState = turnProgress;
          turnProgress = 15;
    }
    if(butt2.isPressed() == true){ // Stats
      println("Enemy HP: " + evil1.hp + " " + evil2.hp + " " + evil3.hp);
      println("Player HP: " + ally1.hp + " " + ally2.hp + " " + ally3.hp);
      butt2.hC = color(255,255,255);
      turnState = turnProgress;
      println(turnProgress);
      turnProgress = 8;
    }
    if(butt3.isPressed() == true){ // Items
      butt3.hC = color(255,255,255);
      turnState = turnProgress;
      
     button1 = evil1.name;
     button2 = evil2.name;
     button3 = evil3.name;
     button4 = "Back";
     
      menuAction = 6;
      turnProgress = 10;
    }
    if(butt4.isPressed() == true){ // Run
      butt4.hC = color(255,255,255);
      battleMusicPersona.stop();
      battleMusicPokemon.stop();
      battleMusicXenoblade.stop();
      bossMusicPersona.stop();
      bossMusicXenoblade.stop();
      bossMusicPokemon.stop();
       setup();
       scene = 1;
      }
     }
   break;
   case 1: // Attack Menu (Player 1)
   //turnProgress = 5;
      if(isPlayerTurn == true){
    if(butt1.isPressed() == true){
      // Attack Enemy 1
      if(evil1.hp > 0){
      println("You attacked the " + evil1.name + "!");
      butt1.hC = color(255,255,255);
      ally1.attack(evil1);
      score += 500;
      println(evil1.name + "'s HP: " + evil1.hp);
      turnText = ally1.name + " attacked " + evil1.name + "!";
      turnAftermath = evil1.name + "'s HP: " + evil1.hp;
      
        //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      // Prepare for next turn
      turnProgress = 1;
      isPlayerTurn = false;
      startTime = millis();
      }
      else {
        println("that man is dead");
      }

    }
    if(butt2.isPressed() == true){
      // Attack Enemy 2
      if(evil2.hp > 0){
      fill(255,255,255);
      println("You attacked the " + evil2.name + "!");
      butt1.hC = color(255,255,255);
      ally1.attack(evil2);
      println(evil2.name + "'s HP: " + evil2.hp);
      turnText = ally1.name + " attacked " + evil2.name + "!";
      turnAftermath = evil2.name + "'s HP: " + evil2.hp;
      
      // Prepare for next turn
      turnProgress = 1;
      isPlayerTurn = false;
      startTime = millis();
      
              //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
    }
    else {
      println("bro he's down!!");
    }
    }
    if(butt3.isPressed() == true){
      // Attack Enemy 3
      if(evil3.hp > 0){
      println("You attacked the " + evil3.name + "!");
      butt1.hC = color(255,255,255);
      ally1.attack(evil3);
      println(evil3.name + "'s HP: " + evil3.hp);
      turnText = ally1.name + " attacked " + evil3.name + "!";
      turnAftermath = evil3.name + "'s HP: " + evil3.hp;
      // Prepare for next turn
      turnProgress = 1;
      isPlayerTurn = false;
      startTime = millis();
      
              //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
    }
    else {
      println("Surely he's okay... right?");
    }
    }
    if(butt4.isPressed() == true){
      println("Button 4 has been pressed!");
      butt4.hC = color(255,255,255);
      menuAction = 0;
          //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      }
     }
     break;
     case 2: // Attack Menu (Player 2)
           if(isPlayerTurn == true){
    if(butt1.isPressed() == true){
      // Attack Enemy 1
      if(evil1.hp > 0){
      println("You attacked the " + evil1.name + "!");
      butt1.hC = color(255,255,255);
      ally2.attack(evil1);
      score += 500;
      println(evil1.name + "'s HP: " + evil1.hp);
      turnText = ally2.name + " attacked " + evil1.name + "!";
      turnAftermath = evil1.name + "'s HP: " + evil1.hp;
      
        //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      // Prepare for next turn
      turnProgress = 3;
      isPlayerTurn = false;
      startTime = millis();
      }
      else {
        println("that nigga is dead");
      }

    }
    if(butt2.isPressed() == true){
      // Attack Enemy 2
      if(evil2.hp > 0){
      fill(255,255,255);
      println("You attacked the " + evil2.name + "!");
      butt1.hC = color(255,255,255);
      ally2.attack(evil2);
      println(evil2.name + "'s HP: " + evil2.hp);
      turnText = ally2.name + " attacked " + evil2.name + "!";
      turnAftermath = evil2.name + "'s HP: " + evil2.hp;
      
      // Prepare for next turn
      turnProgress = 3;
      isPlayerTurn = false;
      startTime = millis();
      
              //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
    }
    else {
      println("bro he's down!!");
    }
    }
    if(butt3.isPressed() == true){
      // Attack Enemy 3
      if(evil3.hp > 0){
      println("You attacked the " + evil3.name + "!");
      butt1.hC = color(255,255,255);
      ally2.attack(evil3);
      println(evil3.name + "'s HP: " + evil3.hp);
      turnText = ally2.name + " attacked " + evil3.name + "!";
      turnAftermath = evil3.name + "'s HP: " + evil3.hp;
      // Prepare for next turn
      turnProgress = 3;
      isPlayerTurn = false;
      startTime = millis();
      
              //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
    }
    else {
      println("Surely he's okay... right?");
    }
    }
    if(butt4.isPressed() == true){
      println("Button 4 has been pressed!");
      butt4.hC = color(255,255,255);
      menuAction = 0;
          //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      }
     }
     break;
     case 3: // Attack Menu (Player 3)
           if(isPlayerTurn == true){
    if(butt1.isPressed() == true){
      // Attack Enemy 1
      if(evil1.hp > 0){
      println("You attacked the " + evil1.name + "!");
      butt1.hC = color(255,255,255);
      ally3.attack(evil1);
      score += 500;
      println(evil1.name + "'s HP: " + evil1.hp);
      turnText = ally3.name + " attacked " + evil1.name + "!";
      turnAftermath = evil1.name + "'s HP: " + evil1.hp;
      
        //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      // Prepare for next turn
      turnProgress = 4;
      isPlayerTurn = false;
      startTime = millis();
      }
      else {
        println("that man is dead");
      }

    }
    if(butt2.isPressed() == true){
      // Attack Enemy 2
      if(evil2.hp > 0){
      fill(255,255,255);
      println("You attacked the " + evil2.name + "!");
      butt1.hC = color(255,255,255);
      ally3.attack(evil2);
      println(evil2.name + "'s HP: " + evil2.hp);
      turnText = ally3.name + " attacked " + evil2.name + "!";
      turnAftermath = evil2.name + "'s HP: " + evil2.hp;
      
      // Prepare for next turn
      turnProgress = 4;
      isPlayerTurn = false;
      startTime = millis();
      
              //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
    }
    else {
      println("bro he's down!!");
    }
    }
    if(butt3.isPressed() == true){
      // Attack Enemy 3
      if(evil3.hp > 0){
      println("You attacked the " + evil3.name + "!");
      butt1.hC = color(255,255,255);
      ally3.attack(evil3);
      println(evil3.name + "'s HP: " + evil3.hp);
      turnText = ally3.name + " attacked " + evil3.name + "!";
      turnAftermath = evil3.name + "'s HP: " + evil3.hp;
      // Prepare for next turn
      turnProgress = 4;
      isPlayerTurn = false;
      startTime = millis();
      
              //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
    }
    else {
      println("Surely he's okay... right?");
    }
    }
    if(butt4.isPressed() == true){
      println("Button 4 has been pressed!");
      butt4.hC = color(255,255,255);
      menuAction = 0;
          //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      }
     }
     break;
     case 4: // Player Stats
    if(butt3.isPressed() == true){
      turnProgress = 9;
      butt3.hC = color(255,255,255);
    }
    if(butt4.isPressed() == true){
      butt4.hC = color(255,255,255);
      menuAction = 0;
      turnProgress = turnState;
      }
      break;
      case 5: // Enemy Stats
      if(butt3.isPressed() == true){
      turnProgress = 8;
      butt3.hC = color(255,255,255);
    }
    if(butt4.isPressed() == true){
      butt4.hC = color(255,255,255);
      menuAction = 0;
      turnProgress = turnState;
      }
      break;
      case 6: // Items
     if(butt1.isPressed() == true){
     menuAction = 7;
     turnProgress = 11;
     butt1.hC = color(255,255,255);
    }
    if(butt2.isPressed() == true){
      butt2.hC = color(255,255,255);
      menuAction = 8;
      turnProgress = 11;
      }
     if(butt3.isPressed() == true){
      menuAction = 9;
      turnProgress = 11;
     butt3.hC = color(255,255,255);
    }
    if(butt4.isPressed() == true){
      butt4.hC = color(255,255,255);
      //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      menuAction = 0;
      turnProgress = turnState;
      }
      break;
      case 7: //HP Up
         if(butt1.isPressed() == true){ // Player 1
           butt1.hC = color(255,255,255);
           if(hpItemCount > 0 && ally1.hp < startingHP && ally1.hp > 0){
           ally1.hpUp();
           score += 100;
           hpItemCount -=1;
           affectedPlayerName = ally1.name;
           if(ally1.hp > startingHP){
                ally1.hp = startingHP;
           }
           affectedPlayerHP = ally1.hp;
           startTime = millis();
           turnProgress = 12;
           }
           if(ally1.hp <= 0){
             println(ally1.name + " is down!");
           }
           if(ally1.hp >= 30){
             println(ally1.name + "'s health is already full!");
           }
           if(hpItemCount <= 0){
             println("Out of HP Up!");
           }
        }
        if(butt2.isPressed() == true){ // Player 2
          butt2.hC = color(255,255,255);
          if(hpItemCount > 0 && ally2.hp < 30 && ally2.hp > 0){
           ally2.hpUp();
           score += 100;
           hpItemCount -=1;
           affectedPlayerName = ally2.name;
           if(ally2.hp > startingHP){
                ally2.hp = startingHP;
           }
           affectedPlayerHP = ally2.hp;
           startTime = millis();
            turnProgress = 12;
           }
           if(ally2.hp <= 0){
             println(ally2.name + " is down!");
           }
           if(ally2.hp >= 30){
             println(ally2.name + "'s health is already full!");
           }
           if(hpItemCount <= 0){
             println("Out of HP Up!");
           }
          }
         if(butt3.isPressed() == true){
           butt3.hC = color(255,255,255);
           if(hpItemCount > 0 && ally3.hp < 30 && ally3.hp > 0){
           ally3.hpUp();
           score += 100;
           hpItemCount -=1;
           affectedPlayerName = ally3.name;
           if(ally3.hp > startingHP){
                ally3.hp = startingHP;
           }
           affectedPlayerHP = ally3.hp;
           startTime = millis();
           turnProgress = 12;
           }
           if(ally3.hp <= 0){
             println(ally3.name + " is down!");
           }
           if(ally3.hp >= 30){
             println(ally3.name + "'s health is already full!");
           }
           if(hpItemCount <= 0){
             println("Out of HP Up!");
           }
        }
        if(butt4.isPressed() == true){
            butt4.hC = color(255,255,255);
            //Init Button Labels
              button1 = "Attack";
              button2 = "Stats";
              button3 = "Item";
              button4 = "Run";
            menuAction = 6;
            turnProgress = 10;
          }
      break;
      case 8: //ATK Up
       if(butt1.isPressed() == true){ // Player 1
           butt1.hC = color(255,255,255);
           if(atkItemCount > 0 && ally1.isAtkBuffed == false && ally1.hp > 0){
           ally1.isAtkBuffed = true;
           atkItemCount -=1;
           score += 150;
           affectedPlayerName = ally1.name;
           affectedPlayerHP = ally1.hp;
           startTime = millis();
           turnProgress = 13;
           }
           if(atkItemCount <= 0){
             println("Out of ATK Up!");
           }
           if(ally1.isAtkBuffed == true){
             println("Already buffed!");
           }
           if(ally1.hp <= 0){
             println(ally1.name + " is down!");
           }
        }
        if(butt2.isPressed() == true){
          butt2.hC = color(255,255,255);
          if(atkItemCount > 0 && ally2.isAtkBuffed == false && ally2.hp > 0){
           ally2.isAtkBuffed = true;
           atkItemCount -=1;
           score += 150;
           affectedPlayerName = ally2.name;
           affectedPlayerHP = ally2.hp;
           startTime = millis();
            turnProgress = 13;
           }
           if(atkItemCount <= 0){
             println("Out of ATK Up!");
           }
           if(ally2.isAtkBuffed == true){
             println("Already buffed!");
           }
           if(ally2.hp <= 0){
             println(ally2.name + " is down!");
           }
          }
         if(butt3.isPressed() == true){
           butt3.hC = color(255,255,255);
           if(atkItemCount > 0 && ally3.isAtkBuffed == false && ally3.hp > 0){
           ally3.isAtkBuffed = true;
           atkItemCount -=1;
           score += 150;
           affectedPlayerName = ally3.name;
           affectedPlayerHP = ally3.hp;
           startTime = millis();
           turnProgress = 13;
           }
           if(atkItemCount <= 0){
             println("Out of ATK Up!");
           }
           if(ally3.isAtkBuffed == true){
             println("Already buffed!");
           }
           if(ally3.hp <= 0){
             println(ally3.name + " is down!");
           }
        }
        if(butt4.isPressed() == true){
            butt4.hC = color(255,255,255);
            //Init Button Labels
              button1 = "Attack";
              button2 = "Stats";
              button3 = "Item";
              button4 = "Run";
            menuAction = 6;
            turnProgress = 10;
          }
      break;
      case 9: // AOE Buff
      if(butt1.isPressed() == true){ // Player 1
           butt1.hC = color(255,255,255);
           if(aoeItemCount > 0 && ally1.hp > 0){
             isAoeBuff = 1;
           aoeItemCount -= 1;
           score += 150;
           affectedPlayerName = ally1.name;
           affectedPlayerHP = ally1.hp;
           startTime = millis();
           turnProgress = 16;
           }
           if(ally1.hp <= 0){
             println(ally1.name + " is down!");
           }
           if(aoeItemCount <= 0){
             println("Already used");
           }
        }
        if(butt2.isPressed() == true){ // Player 2
           butt2.hC = color(255,255,255);
           if(aoeItemCount > 0 && ally2.hp > 0){
             isAoeBuff = 2;
           aoeItemCount -= 1;
           score += 150;
           affectedPlayerName = ally2.name;
           affectedPlayerHP = ally2.hp;
           startTime = millis();
           turnProgress = 16;
           }
           if(ally2.hp <= 0){
             println(ally2.name + " is down!");
           }
           if(aoeItemCount <= 0){
             println("Already used");
           }
        }
          
         if(butt3.isPressed() == true){ // Player 3
           butt3.hC = color(255,255,255);
           if(aoeItemCount > 0 && ally3.hp > 0){
             isAoeBuff = 3;
           aoeItemCount -= 1;
           score += 150;
           affectedPlayerName = ally3.name;
           affectedPlayerHP = ally3.hp;
           startTime = millis();
           turnProgress = 16;
           }
           if(ally3.hp <= 0){
             println(ally3.name + " is down!");
           }
           if(aoeItemCount <= 0){
             println("Already used");
           }
        }
        if(butt4.isPressed() == true){
            butt4.hC = color(255,255,255);
            //Init Button Labels
              button1 = "Attack";
              button2 = "Stats";
              button3 = "Item";
              button4 = "Run";
            menuAction = 6;
            turnProgress = 10;
          }
      break;
     }
     break;
  }
 }

void keyPressed(){
  switch(scene){
    case 0:
    break;
    case 1:
    if(key == 'a' || key == 'A'){
      player.isMovingLeft = true;
      talyaWalkCycle.isAnimating = true;
      //encounter = int(random(1, 25));
    }
    if(key == 'd' || key == 'D'){
      player.isMovingRight = true;
      talyaWalkCycle.isAnimating = true;
      //encounter = int(random(1, 25));
    }
    if(key == 'w' || key == 'W'){
      player.isMovingUp = true;
      talyaWalkCycle.isAnimating = true;
      //encounter = int(random(1, 25));
    }
    if(key == 's' || key == 'S'){
      player.isMovingDown = true;
      talyaWalkCycle.isAnimating = true;
      //encounter = int(random(1, 25));
    }
    break;
    case 3:
    if(key == ' '){
      setup();
      scene = 0;
    }
    break;
    case 6:
    if(key == ' '){
      setup();
      score = 0;
      scene = 0;
    }
    break;
  }
}

void keyReleased(){
  switch(scene){
    case 0:
    break;
    case 1:
    if(key == 'a' || key == 'A'){
      player.isMovingLeft = false;
      talyaWalkCycle.isAnimating = false;
      //encounter = int(random(1, 25));
    }
    if(key == 'd' || key == 'D'){
      player.isMovingRight = false;
      talyaWalkCycle.isAnimating = false;
      //encounter = int(random(1, 25));
    }
    if(key == 'w' || key == 'W'){
      player.isMovingUp = false;
      talyaWalkCycle.isAnimating = false;
      //encounter = int(random(1, 25));
    }
    if(key == 's' || key == 'S'){
      player.isMovingDown = false;
      talyaWalkCycle.isAnimating = false;
      //encounter = int(random(1, 25));
    }
    break;
  }
}

void buffExpiration(){
  if(ally1.isAtkBuffed == false){
    buffExpiry = ally1.buffExpire;
  }
  if(ally2.isAtkBuffed == false){
    buffExpiry = ally2.buffExpire;
  }
  if(ally3.isAtkBuffed == false){
    buffExpiry = ally3.buffExpire;
  }
  //else { 
  //  buffExpiry = " ";
  //}
}

void aoeBuff(){
// Attack Enemy
      if(isAoeBuff == 1){
      println("You attacked the " + evil1.name + "!");
      butt1.hC = color(255,255,255);
      ally1.attack(evil1);
      ally1.attack(evil2);
      ally1.attack(evil3);
      score += 500;
      println(evil1.name + "'s HP: " + evil1.hp);
      turnText = ally1.name + " attacked all the enemies!";
      turnAftermath = evil1.name + "'s HP: " + evil1.hp + ", " + 
                      evil2.name + "'s HP: " + evil2.hp + ", " +
                      evil3.name + "'s HP: " + evil3.hp + ". ";
      
        //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      // Prepare for next turn
      //menuAction = 1;
      turnProgress = 1;
      isPlayerTurn = false;
      startTime = millis();
        if (aoeBuffCount <= 0){
          isAoeBuff = 0;
      }
  }
  if(isAoeBuff == 2){
      //println("You attacked the " + evil1.name + "!");
      butt1.hC = color(255,255,255);
      ally2.attack(evil1);
      ally2.attack(evil2);
      ally2.attack(evil3);
      score += 500;
      //println(evil1.name + "'s HP: " + evil1.hp);
      turnText = ally2.name + " attacked all the enemies!";
      turnAftermath = evil1.name + "'s HP: " + evil1.hp + ", " + 
                      evil2.name + "'s HP: " + evil2.hp + ", " +
                      evil3.name + "'s HP: " + evil3.hp + ". ";
      
        //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      // Prepare for next turn
      //menuAction = 2;
      turnProgress = 3;
      isPlayerTurn = false;
      startTime = millis();
        if (aoeBuffCount <= 0){
          isAoeBuff = 0;
      }
  }
  if(isAoeBuff == 3){
      //println("You attacked the " + evil1.name + "!");
      butt1.hC = color(255,255,255);
      ally3.attack(evil1);
      ally3.attack(evil2);
      ally3.attack(evil3);
      score += 500;
      //println(evil1.name + "'s HP: " + evil1.hp);
      turnText = ally3.name + " attacked all the enemies!";
      turnAftermath = evil1.name + "'s HP: " + evil1.hp + ", " + 
                      evil2.name + "'s HP: " + evil2.hp + ", " +
                      evil3.name + "'s HP: " + evil3.hp + ". ";
      
        //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      // Prepare for next turn
      //menuAction = 3;
      turnProgress = 4;
      isPlayerTurn = false;
      startTime = millis();
        if (aoeBuffCount <= 0){
          isAoeBuff = 0;
      }
  }
}

void collisionOW(){
  player.collision();
  if(object1.isDefeated == false){
  object1.collision();
  }
  if(object2.isDefeated == false){
    object2.collision();
  }
  if(object3.isDefeated == false){
    object3.collision();
  }
  if(player.pBottom > object1.oTop &&
     player.pLeft < object1.oRight &&
     player.pTop < object1.oBottom &&
     player.pRight > object1.oLeft) {
       encounter = 5;
     }
     if(player.pBottom > object2.oTop &&
     player.pLeft < object2.oRight &&
     player.pTop < object2.oBottom &&
     player.pRight > object2.oLeft) {
       encounter = 6;
     }
     if(player.pBottom > object3.oTop &&
     player.pLeft < object3.oRight &&
     player.pTop < object3.oBottom &&
     player.pRight > object3.oLeft) {
       encounter = 7;
     }
}

void playerAtkBoss(){
// Attack Enemy
      if(turnState == 0){
      println("You attacked the " + evil4.name + "!");
      butt1.hC = color(255,255,255);
      ally1.attack(evil4);
      score += 500;
      println(evil4.name + "'s HP: " + evil4.hp);
      turnText = ally1.name + " attacked " + evil4.name + "! ";
      turnAftermath = evil4.name + "'s HP: " + evil4.hp + " ";
      
        //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      // Prepare for next turn
      //menuAction = 1;
      turnProgress = 1;
      isPlayerTurn = false;
      startTime = millis();
        if (aoeBuffCount <= 0){
          isAoeBuff = 0;
      }
  }
  if(turnState == 5){
      println("You attacked the " + evil4.name + "!");
      butt1.hC = color(255,255,255);
      ally2.attack(evil4);
      score += 500;
      println(evil4.name + "'s HP: " + evil4.hp);
      turnText = ally2.name + " attacked " + evil4.name + "! ";
      turnAftermath = evil4.name + "'s HP: " + evil4.hp + " ";
      
        //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      // Prepare for next turn
      //menuAction = 2;
      turnProgress = 3;
      isPlayerTurn = false;
      startTime = millis();
        if (aoeBuffCount <= 0){
          isAoeBuff = 0;
      }
  }
  if(turnState == 6){
      println("You attacked the " + evil4.name + "!");
      butt1.hC = color(255,255,255);
      ally3.attack(evil4);
      score += 500;
      println(evil4.name + "'s HP: " + evil4.hp);
      turnText = ally3.name + " attacked " + evil4.name + "! ";
      turnAftermath = evil4.name + "'s HP: " + evil4.hp + " "; 
                     
      
        //Init Button Labels
          button1 = "Attack";
          button2 = "Stats";
          button3 = "Item";
          button4 = "Run";
      // Prepare for next turn
      //menuAction = 3;
      turnProgress = 4;
      isPlayerTurn = false;
      startTime = millis();
        if (aoeBuffCount <= 0){
          isAoeBuff = 0;
      }
  }
}
