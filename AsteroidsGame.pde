//tasks - make bullets move and make siZe of bullet increase with the ship
// add bullets to array list when key is pressed, remove the bullet if it exits the screen
// fix the motion of the bullets
// 

//arrays
ArrayList <Asteroid> rock = new ArrayList <Asteroid>();
Star nebula [] = new Star[200];
ArrayList <Bullet> bolt = new ArrayList <Bullet>();
//your variable declarations here
SpaceShip ender = new SpaceShip();
float acc = 0.0;
float speed = 0.0;
boolean big = false;
//variables for projectile coordinates/arguments
int n1;
int n2;
boolean collision;


public void setup() 
{
  //your code here
  size(900, 900);
  for (int i = 0; i < nebula.length; i++) {
    nebula[i] = new Star((float)(Math.random()*1000)-50, (float)(Math.random()*1000)-50, (float)(Math.random()*5));
  }
  for (int j = 0; j < 20; j++) {

    n1 = (int)(Math.random()*10)+5;
    n2 = (int)(Math.random()*12)+3;
    
    Asteroid tempA = new Asteroid(n1, n2);
    rock.add(tempA);

  }

  }
public void draw() 
{
  //your code here
  background(0);
  for (int i = 0; i < nebula.length; i++) {
    nebula[i].move();
    nebula[i].show();
  }
//check collision with ship
  for (int u = 0; u < rock.size(); u++) {
    
    rock.get(u).move();
    rock.get(u).show();
    rock.get(u).setDistanceS( (int)dist(rock.get(u).getX(), rock.get(u).getY(), ender.getX(), ender.getY() ) );
    
    if (big == false && rock.get(u).getDistanceS() < 25) {
      rock.remove(rock.get(u));
      break;
    }
  else if (big == true  && rock.get(u).getDistanceS() < 80 ) {
      rock.remove(rock.get(u));
      break;
    } 
    //check collisions with bullets
    for(int v = 0; v < bolt.size() ; v++) {
      rock.get(u).setDistanceB((int)dist(rock.get(u).getX(), rock.get(u).getY(), bolt.get(v).getX(), bolt.get(v).getY() ) );
      if (big == false && rock.get(u).getDistanceB() < 30) {
      rock.remove(rock.get(u));
      break;
    }
      else if (big == true  && rock.get(u).getDistanceB() < 80 ) {
      rock.remove(rock.get(u));
      break;
    } 
    }
    
  }



  for (int i = 0; i < bolt.size(); i ++) {
    bolt.get(i).move();
    bolt.get(i).show();
  }
  //ship movement
  ender.keyPressed();
  ender.move();
  ender.accelerate(speed);
  ender.show();

   //remove bullets if they leave the screen
   for(int b = 0; b < bolt.size(); b++) {

    if(bolt.get(b).getX() > width || bolt.get(b).getX() < 0 || bolt.get(b).getY() > height || bolt.get(b).getY() < 0)
    {     
     bolt.remove(b); 
    }
  }
            for (int j = 0; j < 20 - rock.size(); j++) {
            n1 = (int)(Math.random()*10)+5;
            n2 = (int)(Math.random()*12)+3;    
            Asteroid tempB = new Asteroid(n1, n2);
            rock.add(tempB);
  }
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

  class Asteroid extends Floater  
  {
    private double omega;
    
    Asteroid(int s1, int s2) {
      corners = 6;
      int m1 = s1;
      int m2 = s2;
 
      xCorners = new int[6];
      yCorners = new int[6];
      xCorners[0] = 4*m1-10;
      yCorners[0] = 0;
      xCorners[1] = 2*m2;
      yCorners[1] = 2*m1;
      xCorners[2] = -2*m2;
      yCorners[2] = 2*m1;
      xCorners[3] = -4*m2+10;
      yCorners[3] = 0;
      xCorners[4] = -2*m1;
      yCorners[4] = -2*m2;
      xCorners[5] = 2*m1;
      yCorners[5] = -2*m2;

      myColor = (100);

      myCenterX = (int)(Math.random()*900);
      myCenterY = (int)(Math.random()*900);
      omega = (double)(Math.random()*6) -3;
      if (omega == 0) {
        if (Math.random()  < .5) {
          omega = 1.5;
        }
        else{
          omega = -1.5;
        }
      }

      myDirectionX = (double)(Math.random()*2) -1;
      myDirectionY = (double)(Math.random()*2) -1;
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
      public void setDistanceS(int d) {distance = d;}
      public int getDistanceS() {return distance;}
      public void setDistanceB(int d) {distance = d;}
      public int getDistanceB() {return distance;}
      //work on this
      public void move ()
  {      

    myPointDirection += omega;
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    


if(myCenterX > width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX < 0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY > height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
 
}
}
}
class Bullet extends Floater {
  Bullet (SpaceShip theShip) {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    double dRadians = theShip.getPointDirection()*(Math.PI/180);
    myDirectionX = 10 * Math.cos(dRadians) + theShip.getDirectionX();
    myDirectionY = 10 * Math.sin(dRadians) + theShip.getDirectionY(); 
  }
  public void show() {
    noStroke();
    if(!big) {
      fill(120, 255, 150);
    ellipse((int)myCenterX, (int)myCenterY, 5, 5);
    }
    else if (big) {
      fill (120, 255, 150);
      ellipse((int)myCenterX, (int)myCenterY, 20, 20);
    }

  }
  public void move(){

    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;  

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
      public void setDistance(int d) {distance = d;}
      public int getDistance() {return distance;}
}



abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int distance;
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
    myDirectionX = ((dAmount) * Math.cos(dRadians));    
    myDirectionY = ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void keyPressed()
  {

       
        
        if (key == 'v' && speed != 0 && !big) {
          myDirectionX = 0;
          myDirectionY = 0;
          speed = 0;
          myPointDirection = (double)(Math.random()*360);
          myCenterX = (double)(Math.random()*900);
          myCenterY = (double)(Math.random()*900);  
          }
        if (key == 'b' && !big) {
          for (int j = 0; j < 6; j++) {
            xCorners[j] = xCorners[j]*10;
            yCorners[j] = yCorners[j]*10;
            big = true;
    }
          }
        if (key == 'n' && big) {
          for (int j = 0; j < 6; j++) {
            xCorners[j] = xCorners[j]/10;
            yCorners[j] = yCorners[j]/10;
            big = false;
          }
        }

    
    if (keyCode == UP && speed < 2) {
          speed = 4;
        }
    if (keyCode == DOWN && speed >= 0) {
          speed -= 2;
    }
    if (keyCode == RIGHT) {
            myPointDirection++;
          }
    if (keyCode == LEFT) {
            myPointDirection--;
          }
    if (keyPressed == true) {
      
     if (key == ' ' ) {
        
            Bullet tempC = new Bullet(ender);
           bolt.add(tempC); 
      
        }
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
    else if (myCenterX < 0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY > height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  
  {//Draws the floater at the current position  
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

