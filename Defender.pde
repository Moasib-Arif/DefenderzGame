class Defender {
  //member variables
  int x, y; //position
  int dx = 60; // speed






  //constructor
  Defender(int x, int y) { //in the constructor passing the x and y location
    this.x = x; //initalises x and y
    this.y = y;
  }




  //methods
  // master method
  void defaction() { //master method which will be called by void draw and this procedure will call the relvant methods in the program.
    render(); // this will desiplay and draw the defender
     wall(); //this checks if defender doesnot go off the screen
  }


  void render() {
    //draw a defender:x,y is top left corner, shape is from y..y+30 tall
    fill(0, 0, 200); // fills the colour of rectangle
    rect(x, y, 20, 10); //draw top box
    fill(255, 0, 0); //draw rocket
    rect(x, y+10, 50, 20); // draws a rectangle
    triangle(x+50, y+10, x+50, y+30, x+60, y+20); //draws the 
  }

    void wall() // methods wall to check if defender has hit the boundary
  {
    if (this.y < 0 )  // so it doesn't go off screen and its push back.
  {
    y = 0;
  }
    if (this.y > height)
  {
    y = y - dx;
  }
  }
}// end class
