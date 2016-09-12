//description: This project is where I had to include collisions and functions and what happens when both of these circles collide, little circles start forming and they start moving backwards from both of the big circles.  
float ellipseX = 10;
float ellipseY = 200;
float ellipseW = 80;
float ellipseH = 80;
float ellipseSpeed = 10;

float[] explosionX;
float[] explosionY;
float[] velX; 
float[] velY;
float[] xmove; 
float[] ymove; 
 
//Properties of second rectangle
float ellipse2X = 1000;
float ellipse2Y = 200;
float ellipse2W = 80;
float ellipse2H = 80;
float ellipse2Speed = -10;
boolean hasExploded = false;
 
void setup()
{
  fullScreen();
  explosionX = new float [20];
  explosionY = new float [20];
  velX = new float [30]; 
  velY = new float [20];
  xmove= new float [10];
  ymove= new float [10];
}
 
void draw()
{
 
  if ( isColliding(ellipseX, ellipseY, ellipseW, ellipseH, ellipse2X, ellipse2Y, ellipse2W, ellipse2H) )
  {
    ellipseSpeed  = ellipseSpeed * -1;
    ellipse2Speed = ellipse2Speed * -1;
    hasExploded=true;
    for (int i=0; i<20; i++)
    {
      explosionX[i]=ellipseX;
      explosionY[i]=ellipseY;
      velX[i]=random(-5,5);
      velY[i]=random(-2,3); 
    }
  }  
  
  if(hasExploded==true)//when two circles touch the little circles form 
  {
    for (int i=0; i<20; i++)
    {
      explosionX[i]=explosionX[i]+velX[i];
      ellipse(explosionX[i],explosionY[i],10,10);
    }
  }
  
  ellipseX = ellipseX + ellipseSpeed;
  ellipse2X = ellipse2X + ellipse2Speed;
 
  fill(150,180,200);
  ellipse(ellipseX, ellipseY, ellipseW, ellipseH);
  random(10,20);
  ellipse(ellipse2X, ellipse2Y, ellipse2W, ellipse2H);
}
 

boolean isColliding(float boxX, float boxY, float boxW, float boxH,
                            float otherX, float otherY, float otherW, float otherH)
{
  float rightSideX  = boxX + boxW;
  float leftSideX   = boxX;
  float topSideY    = boxY;
  float bottomSideY = boxY + boxH;
 
 
  if ( ( rightSideX > otherX  && // AND        
         rightSideX < otherX + otherW ) || // OR
        (leftSideX  < otherX + otherW &&
         leftSideX  > otherX) )
  {
    println ("We're in the Same X");
   
        if ( ( topSideY <= otherY + otherH &&
               topSideY >= otherY) ||
             ( bottomSideY >= otherY &&
               bottomSideY <= otherY + otherH) )
        {
          println("We're also in the same Y! WE'RE COLLIDING!!");
       
          return true;
        }
   
  }
 
 
  return false;
}