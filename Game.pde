PImage background, gameend;
int bgX=0; //global variable background location



Defender defender1; // initalising the defender variable 
int score= 0; //global variable for score

//declares an ArrayList of class Bullet
ArrayList<Bullet>bulletList;  //ArrayList <Classname>listname 
ArrayList<Alien>alienlist; //to declare an array
// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\

void setup() {
  size(800, 400); // set the size of the canvas

  background = loadImage("spaceBackground.jpg"); // this will load an image and save it in backgorunf
  background.resize(width, height); //set image to be same size as the canvas
  gameend = loadImage("explosion.png"); //game end sequence
  gameend.resize(width/4, height/4); //resizing the image size
 
  
  // initalising the arraylist
  defender1 = new Defender(width/20, height/2); //set the inital location of defender which is being passed in.
  bulletList = new ArrayList<Bullet>(); // created a new instance in the array list called bulletlsit
  alienlist = new ArrayList<Alien>(); // created a new instance in the array list called alienlist
  addalien(); //calling the alien procedures
}
void addalien() //addalien procedure
{
  alienlist.add(new Alien(width, height/2)); // gets the objects and dispalys them
  alienlist.add(new Alien(width, height/3));
  alienlist.add(new Alien(width, height/5));
}


void draw()
{
  //scrolling background image
  image(background, bgX, 0); //draw image to fill the canvas
  //draw image again off the right of the canvas
  image(background, bgX+background.width, 0);
  bgX = bgX- 4;
  if (bgX == -background.width) //if first image completely off the canvas
  {
    bgX=0; //reset back to initial value background
  }
  defender1.defaction(); //calling the defender procedure
  text("Score : "+score+" point", width/2, height -10); // this will constantly be displaying the score
  
  for (Bullet a : bulletList) //the for loop is to check the all the arraylist
  {
    a.shot(); //this will assure to make the bullet dispaly when user presses right key
  }

  //alien appears
  for (Alien a : alienlist)  //the for loop is to check the all the arraylist
  {
    a.action(); //this will display the aliens 
  } //end for loop

 
  
  
  
  
  //keep on appearing arraylist loop
  for (int i=0; i<alienlist.size(); i++)  //Nested for loops are used again to to check if the bullet has crashed with the alien by check each bullet with each alien
  {
  //  if (alienlist.get(i).x == 0 || alienlist.size() == 0)
  //  {
  //    alienlist.remove(i);
  //    alienlist.add(new Alien(width, height/2));
  //  }
    if (alienlist.get(i).crash(defender1))  //this if staemtn check if the alien has not collided with the defender
    {
      imageMode(CENTER);  //sets the image x,y to be in the center
      image(gameend, alienlist.get(i).x, alienlist.get(i).y); // if yes that plays the animation of crashw
      exit(); //than closes the game
    }
  }
  for (int i=alienlist.size()-1; i >= 0; i--)  //nested for loops to check both of thearray to see if any of the alien or bullet has crashed
  {
    Alien a = alienlist.get(i); // this will get one of the items in the array list and get the detaisl about that
    for (int j=bulletList.size()-1; j >= 0; j--) //using nested for loops this will check all the items in the bullet array
    {
      Bullet b = bulletList.get(j); //gets one of the item in bullet arrays
      if (a.IsShot(b)) //using if statment it will check if alein item has been shoot using Isshot boolean
      {
        alienlist.remove(i);//if yes it will remove the laien from list
        score = score + 10; // this will add 10 point on the score which will increment the gloabl varaiable
        bulletList.remove(j); //it will remove the bullet list for the bullet array
        alienlist.add(new Alien(width, a.y + + (int) random(-5,5) )); // this will craete a new alien in the but differrent location using random place generater.
      }
    }
  }
}


void keyPressed() //key press is used to comand the defender
{
  if (key == CODED)
  {
    if (keyCode == UP) //if user presses the up key than the defender will move up 10 pxls
    {
      defender1.y = defender1.y - 10;
    }
    if (keyCode == DOWN)
    {
      defender1.y = defender1.y + 10; //if the user presses the down key the defender will move down with 10 pixels
    }
    if (keyCode == RIGHT) //if user presses right key than one bullet will be added tobulletlist and defender1 location and then using the for loop it will shoot.
    {
      bulletList.add(new Bullet(defender1.x, defender1.y));
    }
  }
}
