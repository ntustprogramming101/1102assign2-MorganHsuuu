PImage knight,fireball2; //<>// //<>//
float SOLDIER_W = 60;
float SOLDIER_H = 60;
PImage bg,dragon,small,big,fast,slow;
PImage  [] upperBarrier = new PImage [20];
PImage  [] lowerBarrier = new PImage [20];  
final float BARRIER_INIT_X = 0;
float [] upperX = new float [20];
float [] upperY = new float [20];
float [] lowerX = new float [20];
float [] lowerY = new float [20];
float [] moveX = new float [20];
float [] moveXPo = new float [20];
float BARRIER_W = 100;
float BARRIER_H = 400;
float SPACE = 100;
float move = 0;
float movePo = 0;
float  knight_X,  knight_Y;
float []  Bmove = new float [20];
float bigger_H =50;
float bigger_W =50;
boolean isBig = false;
float timer = 400;
boolean block = false;
boolean up = false;
boolean left = false;
boolean right = false;
boolean down = false;
float gofront=0;
float go= -2;
boolean demoMode = true;
int life = 5*60;
boolean fireout = false;
float firego = 0;
float fireballTimer = 300;
//float value = saturation(100);

Blanket blanket;

void setup(){
  size(640,480);
  bg = loadImage("img/background22.jpg");
  knight = loadImage("img/knight.png");
  dragon = loadImage("img/Dragon.png");
  small = loadImage("img/life.png");
  fireball2 = loadImage("img/fireball.png");
  float fireballTimer = 300;
   for(int i=0; i<20 ; i++){
     int x = floor(random(2,6));
     int y = floor(random(2,6));
     upperBarrier[i] = loadImage("img/color"+x+".png");
     lowerBarrier[i] = loadImage("img/color"+y+".png");
     upperX[i] = 500 +BARRIER_INIT_X + i*6* BARRIER_W;
     upperY[i] = random(-200,100);
     lowerX[i] = upperX[i]+BARRIER_W+100;
     BARRIER_H =  floor(random(200,300));
     lowerY[i] = BARRIER_H + SPACE + upperY[i];
     moveX[i]  = random(0,4);
  }
  for(int i=0; i<5 ; i++){
    Bmove[i] = random(0);
  }
   for(int i=5; i<15 ; i++){
    Bmove[i] = random(5);
  } 
   for(int i=15; i<20 ; i++){
    Bmove[i]  = random(5,10);
  }   
  
   knight_X = 300;
   knight_Y = 300;
   blanket = new Blanket();

}


void draw(){
  
  // the edge
  if(knight_X < -20-movePo){
   knight_X = -20-movePo;
  
  }
  if(knight_X > width-movePo){
   knight_X = width-movePo;
  
  }
  if(knight_Y < -20){
   knight_Y = -20;
  
  }
  if(knight_Y > height-20){
   knight_Y = height-20;
  
  }
 
  pushMatrix();
  translate(movePo,0);
  for(int i =0 ; i<5; i++){
    image(bg,2500*i,0); 
  }
  
   
 
  //knight_X = mouseX-movePo - SOLDIER_W/2;
  //knight_Y = mouseY - SOLDIER_H/2;
  move=-2;
   if(movePo<-1000){
           move=-2;
          }
          if(movePo<-1500 ){
           move=-2;
          }
          if(movePo<-2000){
           move=-2;
          }
  //println(move);
  movePo += move;
  
  
  for(int i=0; i<20 ; i++){
     image(upperBarrier[i], upperX[i], upperY[i],BARRIER_W,BARRIER_H);
     image(lowerBarrier[i], lowerX[i], lowerY[i],BARRIER_W,BARRIER_H);
     saturation(100);
     //fill(value);
     //println(i+"   "+moveXPo[i]);
     moveXPo[i] += moveX[i];
     if(abs(moveXPo[i])>80){
         moveX[i]*=-1;
     }
     upperX[i] += moveX[i];
     lowerX[i] -= moveX[i];
          upperY[i] += Bmove[i];
          lowerY[i] += Bmove[i];
           if (upperY[i]>200||upperY[i]<-300){
           Bmove[i] *= -1;
           }
           //println(i+"   "+upperY[i]);
           if (lowerY[i]>600||lowerY[i]<-100){
           Bmove[i] *= -1;
           }
     
  } 

 if(movePo>-500){
    if(knight_X<-movePo-20-gofront){
        knight_X  = -movePo-20;
      }
   for(int i=0; i<8; i++){
   //scale(1,1);
   image(dragon, -movePo-20,i*60,80,50);
     if(isHit(knight_X,knight_Y,60,60,-movePo-20,i*60,50,50)){  
      life--;
     }  
   }
 }
else{
  
    // wheyher knight bump the dragon
      if(knight_X<-movePo-20-gofront){
        knight_X  = -movePo-20-gofront;
      }
  
    // change the front and back
       if(gofront <-200 ||gofront > 0 ){
         go *= -1;
       }
       
       gofront += go;
       for(int i=0; i<8; i++){
       image(dragon, -movePo-20-gofront,i*60,80,50);
       if(isHit(knight_X,knight_Y,SOLDIER_W,SOLDIER_H,-movePo-20-gofront,i*60,50,50)){  
          life--;
     }  
       }        
     }
if(movePo<-500){
  fireballTimer--;
 if(fireballTimer == 0){
   fireout = true;
   fireballTimer = 300;
 }
}
  if(fireout){
    firego+=5;
  image(fireball2,-movePo-20-gofront+firego,120,50,50);
  if(firego>800){
    fireout = false;
    firego = 0;s
   }
  }

     
 println(fireballTimer) ;
 println(firego) ;  
   if(isHit(knight_X,knight_Y,60,60,900,250,50,50)){  
   isBig = true;  
   }
   
   for(int i=0; i<20; i++){
     if(isHit(knight_X,knight_Y,SOLDIER_W,SOLDIER_H,upperX[i],upperY[i],BARRIER_W-10,BARRIER_H)){
     
      if(knight_X + SOLDIER_W > upperX[i] && knight_Y  < upperY[i]+BARRIER_H && 
         knight_Y + SOLDIER_H > upperY[i]&& knight_X<upperX[i]-20){
           //print("left");
         knight_X = (upperX[i] -  SOLDIER_W);
       }
        else if(knight_Y + SOLDIER_H > upperY[i]
            &&  knight_X+SOLDIER_W >=upperX[i]
            &&  knight_X <= upperX[i]+BARRIER_W-10 
            && knight_Y < upperY[i]){
              //print("up");
         knight_Y  = (upperY[i]- SOLDIER_H);
       }
       
      else if(knight_X < upperX[i]+BARRIER_W-10 &&
              knight_Y  < upperY[i]+BARRIER_H && 
              knight_Y + SOLDIER_H > upperY[i] &&
              knight_X+SOLDIER_W >upperX[i]+BARRIER_W+20){
               // print("right");
       knight_X = upperX[i]+BARRIER_W-10;
       }
        else if(knight_Y < BARRIER_H + upperY[i] && 
                knight_X >= upperX[i]-SOLDIER_W-10 &&
                knight_X <= upperX[i]+BARRIER_W-10  &&
                knight_Y  > upperY[i]
                ){
                 // print("down");
           knight_Y = BARRIER_H + upperY[i];
       }
       
     }  
     else if(isHit(knight_X,knight_Y,SOLDIER_W,SOLDIER_H,lowerX[i],lowerY[i],BARRIER_W-10,BARRIER_H)){
     
      if(knight_X + SOLDIER_W > lowerX[i] && knight_Y  < lowerY[i]+BARRIER_H && 
         knight_Y + SOLDIER_H > lowerY[i]&& knight_X<lowerX[i]-20){
         knight_X = (lowerX[i] -  SOLDIER_W);
         //print("left");
       }
        else if(knight_Y + SOLDIER_H > lowerY[i]
            &&  knight_X+SOLDIER_W >=lowerX[i]
            &&  knight_X <= lowerX[i]+BARRIER_W-10 
            && knight_Y < lowerY[i]){
         knight_Y  = (lowerY[i]- SOLDIER_H);
          //print("up");
       }
       
      else if(knight_X < lowerX[i]+BARRIER_W-10 &&
              knight_Y  < lowerY[i]+BARRIER_H && 
              knight_Y + SOLDIER_H > lowerY[i] &&
              knight_X+SOLDIER_W >lowerX[i]+BARRIER_W+20){
                 //print("right");
       knight_X = lowerX[i]+BARRIER_W-10;
       }
        else if( knight_Y < BARRIER_H + lowerY[i] && 
                knight_X >= lowerX[i]-SOLDIER_W-10 &&
                knight_X <= lowerX[i]+BARRIER_W-10  &&
                knight_Y  > lowerY[i]
                ){
                   //print("down");
                   
                  
           knight_Y = BARRIER_H + lowerY[i];
       }
       
     }  
    
     //println(i+" X "+knight_X);
     //println(i+" Y "+knight_Y);
   }
   if(left){
    knight_X -=6;
   }
   if(right){
    knight_X +=6;
   }
   if(up){
    knight_Y -=6;
   }if(down){
    knight_Y +=6;
   }
   
  
   if(isBig){
    image(small,0,250);
    SOLDIER_W = 40;
    SOLDIER_H = 40;
     image(knight, knight_X, knight_Y,SOLDIER_W, SOLDIER_H);
      blanket.display(30);
      blanket.move(20);
     timer--;
     if(timer == 0){
      isBig = false;
     }
  }else{
      blanket.display(0);
      blanket.move(0);
     image(knight, knight_X, knight_Y,SOLDIER_W, SOLDIER_H);
      SOLDIER_W = 60;
      SOLDIER_H = 60;
     image(small,900,250);
  }
   //if(knight_X <= upperX[i]+BARRIER_W-10&& knight_X+ SOLDIER_W >= upperX[i])
   //  if(knight_Y <= upperY[i] + BARRIER_H && knight_Y + SOLDIER_H >= upperY[i]){
   //    println("isHit");
       
   //    stop();
   //  }
   //  if(knight_X <= lowerX[i]+BARRIER_W-10&& knight_X+ SOLDIER_W >= lowerX[i])
   //  if(knight_Y <= lowerY[i] + BARRIER_H && knight_Y + SOLDIER_H >= lowerY[i]+15){
   //    println("isHit");
   //    stop();
     
 
    
     
  
   
   

 popMatrix();
 
   if (demoMode) {

    fill(255);
    textSize(26);
    textAlign(LEFT, TOP);
    text(life/60,400,10);

  }   

}
void keyPressed() {
  if (key==CODED) {
    
      switch(keyCode) {
      case LEFT:
        left = true;//playerX-=40;
        break;
      case RIGHT:
        right = true;//playerX+=40;
        break;
      case UP:
        up = true;//playerX-=40;
        break;
      case DOWN:
        down = true;//playerX-=40;
        break;
      
    }
  }
}

void keyReleased() {
  if (key==CODED) {
   
      switch(keyCode) {     
      case LEFT:
        left = false;//playerX-=40;
        break;
      case RIGHT:
        right = false;//playerX+=40;
        break;
       case UP:
        up = false;//playerX-=40;
        break;
      case DOWN:
        down = false;//playerX-=40;
        break;
      
    }
  }
}





boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh){
  return  ax + aw > bx &&    // a right edge past b left
        ax < bx + bw &&    // a left edge past b right
        ay + ah > by &&    // a top edge past b bottom
        ay < by + bh;
}
