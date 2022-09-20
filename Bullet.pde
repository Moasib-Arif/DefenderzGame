class Bullet
{
  int x; //constant value 
   int y; //changes position
   int bulletspeed = -10; //moves up screen
   int value;
   Bullet(int number)
   {
     value=number;
   }
   Bullet(int x, int y) //constructor
   {
   this.x=x;  //initalises x and 
   this.y= y;
   } // end constructor
   //methods
   
   void shot() //master method which will be called by void draw and this procedure will call the relvant methods in the program.
   {
     render(); //draws the bullet when master method is called
     move(); // moves the bullet when master method is called.
    // wall();
   } // end master method
   void render() 
   {
     rect(x+20,y,5,5); //draws a rectangl 
   } //end render
   
   void move() //method bullet speed so it moves left
   {
     x = x - bulletspeed;
   } // end move
   

}// end class
