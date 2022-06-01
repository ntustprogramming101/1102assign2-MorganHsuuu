class Blanket{
     float blanketX,blanketY;
     PImage blanket;
   Blanket(){
     blanket = loadImage("img/blanket.png");
   
   
   }
   
   void move(float x){
    blanketX = knight_X-20;
    blanketY = knight_Y+50-x;
   }
   
   void display(float x){
   image(blanket,blanketX,blanketY,100-x,50-x);
   }

}
