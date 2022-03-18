PImage bg; 
PImage soil; 
PImage groundhogIdle,groundhogDown,groundhogLeft,groundhogRight;
PImage life; 
PImage soldier;
//PImage robot;
PImage cabbage,gameover;
PImage title,startHovered,startNormal,restartHovered,restartNormal;
int soldierPosition;
float soldierWalk;
float robotPosition_X;
float robotPosition_Y;
int laserPosition_X; int laserPosition_X1;
int laserPosition_Y;
int laserLong=0;
float cabbage_X = floor(random(0,8));
float cabbage_Y = floor(random(2,6));
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
final int GAME_WIN = 3;
final int hogWidth=80,cabbageWidth=80,soldierWidth=80;
int gameState = GAME_START; 
float groundhog_X =320 , groundhog_Y=80;
float groundhog_X1 =320 , groundhog_Y1=80;
boolean  ca_Situation = false ;
int lifes = 2, lifes1 = 2;
int test =310;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

boolean typeAgain = true;

int upTimes=0;  //test derection
int downTimes=0;
int leftTimes=0;
int rightTimes=0;
int countdown;

void setup(){
  frameRate(60);
  //println(test/80);
  
  size(640,480);
   bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
   groundhogIdle= loadImage("img/groundhogIdle.png");
   groundhogDown= loadImage("img/groundhogDown.png");
   groundhogLeft= loadImage("img/groundhogLeft.png");
   groundhogRight= loadImage("img/groundhogRight.png");
   life= loadImage("img/life.png");
   soldier= loadImage("img/soldier.png");
   //robot= loadImage("img/robot.png");
   cabbage = loadImage("img/cabbage.png");
   gameover = loadImage("img/gameover.jpg");
   title = loadImage("img/title.jpg"); 
   restartHovered = loadImage("img/restartHovered.png");
   restartNormal = loadImage("img/restartNormal.png");    
   startHovered = loadImage("img/startHovered.png");
   startNormal = loadImage("img/startNormal.png");    
   //backGound 
   soldierPosition=floor(random(2,6));
   soldierWalk=0;
   
 //  switch (gameState){  
   
 //  case GAME_RUN
 //}
  
 
   ////robot position
   //robotPosition_X=floor(random(2,8));
   //robotPosition_Y=floor(random(2,6));
   
   ////laser position
   //laserPosition_X=robotPosition_X*80+25;
   //laserPosition_X1=laserPosition_X;
   //laserPosition_Y=robotPosition_Y*80-43;
   
   
    gameState=GAME_START;
}

void draw() {
   
  
   switch (gameState){  
    case GAME_START:
     image(title,0,0);
     if(mouseX>=248 && mouseX<=392 && mouseY>=360 && mouseY<=420){
      image(startHovered,248,360);
     if(mousePressed){
         gameState = GAME_RUN;
       }
     }else{
       image(startNormal,248,360);
     } 
     break;
     
   case GAME_RUN:
   image(bg,0,0);
  //grassLand
      rectMode(CORNERS);
      fill(124,204,25);
      noStroke();
      rect(0,145,640,160);
  
  //Soil
  image(soil,0,160);

  //lifes 
 
   if(lifes==3){
   image(life,10,10);
   image(life,80,10);    
   image(life,150,10);
 }
  else if(lifes==2){
   image(life,80,10);    
    image(life,10,10);
  }else if(lifes==1){
    image(life,10,10);
  }else if(lifes<=0){
    gameState = GAME_OVER;
  }
    
  
  //sun
  strokeWeight(5);  
  stroke(255, 255,0);
  fill(253, 184, 19);
  ellipse(590,50,120,120);
  

 //cabbage
 if(ca_Situation == true){ 
     image(cabbage,-100,-100);
     cabbage_X=-100;
     cabbage_Y=-100;
     
     //println(lifes);
     
   }else{
    image(cabbage,cabbage_X*80,cabbage_Y*80);

   }
 //soldier
  image(soldier,soldierWalk,soldierPosition*80);
   if(soldierWalk>630){
     soldierWalk=-50;
     }
     else {
     soldierWalk+=3;
     }
  
 //hog 
  if(groundhog_Y<=hogWidth){
        groundhog_Y=hogWidth;
        } 
  if(groundhog_X>=width-hogWidth){
        groundhog_X=width-hogWidth;  
  }
 if(groundhog_X<0){
    groundhog_X=0;
   }
   if(groundhog_Y>height-hogWidth){
   groundhog_Y=height-hogWidth;
   }

       
//hog -- set counter

  if(upTimes == 0 && downTimes == 0 && rightTimes == 0 && leftTimes ==0){
    image(groundhogIdle,groundhog_X,groundhog_Y);
    if(typeAgain == false){
      if(upPressed == true){
          upTimes = 15; 
          }
      else if(downPressed == true){
          downTimes = 15;
          }
      else if(downPressed == true){
          downTimes = 15;
          }
      else if(rightPressed == true){
          rightTimes = 15;
          }  
      else if(leftPressed == true){
          leftTimes = 15;
          }
  }
}
else {
  //Move according to counter
  if(upTimes > 0){
     groundhog_Y-= 16.0/3 ;
     upTimes--;
     //if(upTimes==0){
     //groundhog_Y=(groundhog_Y)/80*80;
     //}
     if(upTimes == 1 ){
       if(key == UP){
       upTimes += 15;
       }
     }
     if(upTimes == 1 ){
       typeAgain = true;
       if(upPressed == true){
        upTimes += 15;
       }
     }
     image(groundhogIdle,round(groundhog_X),round(groundhog_Y));
     //println("up  "+upTimes);
     //println("up  "+groundhog_X,groundhog_Y);
   }          
  if(downTimes > 0){
     groundhog_Y+= 16.0/3;
     downTimes--;
     if(downTimes == 1 ){
       typeAgain = true;
       
       if(downPressed == true){
        downTimes += 15;
       }
       
     }
      //println("downTimes"+downTimes);
      //println("down X Y"+groundhog_X,groundhog_Y);
     if(downTimes == 0 ){
     
     }
     image(groundhogDown,round(groundhog_X),round(groundhog_Y));
     
     //println("down  "+downTimes);
     //println("down  "+groundhog_X,groundhog_Y);
   }       
       
      
 if(rightTimes > 0){
    //println(rightTimes);
    groundhog_X+= 16.0/3;
    rightTimes--;
     //if(rightTimes==0){
     //groundhog_X=(groundhog_X+80)/80*80;
     //}
    if(rightTimes == 1 ){
     typeAgain = true;
     if(rightPressed == true){
        rightTimes += 15;
       }
     }
      //println("right  "+groundhog_X,groundhog_Y);
     image(groundhogRight,round(groundhog_X),round(groundhog_Y));  
   }  
       
       
     //press left  
       

  if(leftTimes > 0){
     groundhog_X -= 16.0/3 ;
     leftTimes--;
     //if(leftTimes==0){
     //groundhog_X=(groundhog_X)/80*80;
     //}
     if(leftTimes == 1 ){
     typeAgain = true;
     if(leftPressed == true){
        leftTimes += 15;
       }
     }
     
     image(groundhogLeft,(groundhog_X),(groundhog_Y)); 
     //println("left  "+leftTimes);
     //println("left  "+groundhog_X,groundhog_Y);
   }       
}
 

     
     
 //collision_cabbage
   if(round(groundhog_X)<cabbage_X*80 +cabbageWidth && round(groundhog_X) + hogWidth>cabbage_X*80 &&
      round(groundhog_Y) < cabbage_Y*80 + cabbageWidth && round(groundhog_Y)+ hogWidth > cabbage_Y*80){  
      ca_Situation = true;
      lifes++;
     
     }
 //collision_soldier   
   if(round(groundhog_X) < soldierWalk + soldierWidth && hogWidth + round(groundhog_X)>soldierWalk &&
      round(groundhog_Y) < soldierPosition*80 + soldierWidth && round(groundhog_Y) + hogWidth > soldierPosition*80){   
    lifes --;
    gameState=GAME_RUN;
    //println(lifes);
    groundhog_X=groundhog_X1;
    groundhog_Y=groundhog_Y1;
    soldierPosition=floor(random(2,6));
    ca_Situation = false;
  
     
    upTimes=0;  //test derection
    downTimes=0;
    leftTimes=0;
    rightTimes=0;
    typeAgain=true;
     }
     break;
     
     case GAME_OVER:
     image(gameover,0,0);
     if(mouseX>=248 && mouseX<=392 && mouseY>=360 && mouseY<=420){
      image(restartHovered,248,360);
     if(mousePressed){
         lifes = lifes1;
         ca_Situation = false;
         cabbage_X = floor(random(0,8));
         cabbage_Y = floor(random(2,6));
         
         upTimes=0;  //test derection
         downTimes=0;
         leftTimes=0;
         rightTimes=0;
         typeAgain=true;
         
         gameState = GAME_RUN;
         
        break; 
       }
     }else{
       image(restartNormal,248,360);
     } 
     break;
   } 
}
void keyPressed(){
  if(typeAgain==true) {
  if(key==CODED){
      switch (keyCode) {
      case UP:
        upPressed = true ;
        typeAgain = false ;
        break;
      
      case DOWN:
         downPressed = true;
         typeAgain = false ;
        break;
   
      case LEFT:
          leftPressed = true;
          typeAgain = false ;
        break;
         
      case RIGHT:
          rightPressed = true;
          typeAgain = false ;      
        break;      
      }
    
    }
  }
}
void keyReleased(){
  upPressed = false;
 downPressed = false;
 leftPressed = false;
 rightPressed = false;
}
