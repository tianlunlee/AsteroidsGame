//your variable declarations here
SpaceShip ender = new SpaceShip();
float acc = 0.0;
float speed = 0.0;
Star nebula [] = new Star[200];
boolean moving;
public void setup() 
{
  //your code here
  size(900, 900);
  for (int i = 0; i < nebula.length; i++) {
    nebula[i] = new Star((float)Math.random()*1000-50, (float)Math.random()*1000-50, (float)Math.random()*5);
  }

}
public void draw() 
{
  //your code here
  background(0);
  ender.keyPressed();
  ender.show();
  
    for (int i = 0; i < nebula.length; i++) {
    if (moving == true){
    nebula[i].move();
  }
    nebula[i].show();
  }
 

  
  ender.move();
  ender.accelerate(speed);

}

class SpaceShip extends Floater  
{   
    //your code here
    SpaceShip() {
      corners = 6;
      xCorners = new int[6];
      yCorners = new int[6];
      xCorners[0] = 6;
      yCorners[0] = 0; 
      xCorners[1] = -6;
      yCorners[1] = -6; 
      xCorners[2] = -3;
      yCorners[2] = -1;
      xCorners[3] = -6;
      yCorners[3] = 0;       
      xCorners[4] = -3;
      yCorners[4] = 1;  
      xCorners[5] = -6;
      yCorners[5] = 6; 

      myColor = (255);
      myCenterX = 450.00;
      myCenterY = 450.00;
      myDirectionX = 0.00;
      myDirectionY = 0.00;
      myPointDirection = 0.00;
    }
      
      public void setX(int x) {myCenterX = x;}
      public int getX() { return (int)myCenterX;}
      public void setY(int y) {myCenterY = y;}
      public int getY() {return (int)myCenterY;}
      public void setDirectionX(double x) {myDirectionX = x;}
      public double getDirectionX() {return myDirectionX;}
      public void setDirectionY(double y) {myDirectionY = y;}
      public double getDirectionY() {return myDirectionY;}
      public void setPointDirection(int degrees) {myPointDirection = degrees;}
      public double getPointDirection() {return myPointDirection;}




}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void keyPressed()
  {

    if(keyPressed == true)
      {
        
          if (key == 'v' && speed != 0 ) {
            myDirectionX = 0;
            myDirectionY = 0;
            speed = 0;
            myCenterX = (double)(Math.random()*900);
            myCenterY = (double)(Math.random()*900);
          }
    
    if (keyCode == UP && speed < 2) {


          speed =.01;
        }
    if (keyCode == DOWN && speed >= 0) {
          speed += -.02;
    }
        if (keyCode == RIGHT) {
            myPointDirection++;
          }
        else if (keyCode == LEFT) {
            myPointDirection--;
          }
    }
     if (myDirectionX != 0 || myDirectionY != 0) {
      moving = true;
    }
    else {
      moving =false;
    }
  }

//move the floater in the current direction of travel
  public void move ()

  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    

    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
}

public class Star 
{
  float sX, sY, sR;
  Star(float x, float y, float r) {
    sX = x;
    sY = y;
    sR = r;
   
  }
  public void show(){
    fill(255);
    ellipse(sX, sY, sR, sR);
  }
  public void move(){
    sX += 1;
    sY += 1;
   if (sX > 900) {
        sX = 0;
      } 
   if (sY > 900) {
        sY = 0;
      }
  }

} 

