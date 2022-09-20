class Alien{
  //member variables
  int x, y; //position
  int dx = 1; //x speed
  int dy = 3; // speed
  color ALIEN1 = color(0,255,0); //memeber variables for the colours of alien
  color ALIEN2 = color(50,100,0);

 
 
 
 
  //constructor
  Alien(int x , int y){ //this will initalise x and y
  this.x = x;
  this.y = y;

   
  } //end constructor
 
 
 
 
  //methods
 
  void action(){ //master methods  when it is called in game 
    render(); //drawas the alien only 1 alien
    move(); //makes the alien move
    wall(); //thsi will check if the alien has hit the border or canvas and if to call them again
  } // end action
  void render(){
    //draw an alien
    
    fill(ALIEN1);
    ellipse(x,y,30,30);
    fill(ALIEN2);
    ellipse(x,y,50,15);

   
   
  } // end render
  
   void move() //moves the alien 
   {
     x =x - dx; //x - speed so it is moving towards right
     y=y + (int) random(-5,5) ; // using the random function so the aliens are moving randomly up and down

   }
  void wall() // wall checks that alien has not touched the boundary of screen if it has that comes back or if touched height than bounces back.
  {
  if (this.x < 0 )
  {
    x = width;
  }
    if (this.x > height)
  {
    x = x - dx;
  }
    if (this.y < 0 )
  {
    y = y + dx;
  }
    if (this.y > height)
  {
    y = y - dx;
  }
  }
  boolean crash(Defender other) // booolean crash consequence cehck if alien has hit defender by checking the distance between them x and y 
  {
    return(abs(this.x-other.x )<= 50 && abs(this.y - other.y)<= 30);
  }
     boolean IsShot(Bullet other)  //boolean is used to check if alien has been shot or not and using distance formula and returns true or false.
  {
    return(abs(this.x- other.x )<= 25 && abs(this.y - other.y)<= 35);
  }
   



     
  }
  
