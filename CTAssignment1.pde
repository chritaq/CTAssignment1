//ints for animation
int xAxisStart = -750;
int xspeed = 3;
int whereToStop = 75;

//ints for wiggle animation, one for each letter
int twiggler = 0;
int aowiggler = 0;
int qwiggler = 0;
int vwiggler = 0;
int iwiggler = 0;
int swiggler = 0;
int twiggler2 = 0;
boolean tmovingdown = true;
boolean aomovingdown = true;
boolean qmovingdown = true;
boolean vmovingdown = true;
boolean imovingdown = true;
boolean smovingdown = true;
boolean tmovingdown2 = true;

//Used to start wiggling each letter at different times
int spaceBeforeStart = 20;
boolean aostart = false;
boolean qstart = false;
boolean vstart = false;
boolean istart = false;
boolean sstart = false;
boolean tstart2 = false;


void setup(){
  //Sets screensize
  size(768, 432);
}

void draw (){
  //Sets background color.
  background(0, 0, 250);
  
  //Sets strokewidth, color and nofill.
  strokeWeight(12.6);
  stroke(250, 0, 0);
  noFill();
  
  //Animates
  Animate();
  
  //Draws the name
  DrawName();
}

void DrawName() { 
  //T
  line(92, twiggler + 119, 92, twiggler + 243);
  line(140, twiggler + 118, 47, twiggler + 118);
  
  //å
  ellipse(184, aowiggler + 205, 76, 74);
  line(219, aowiggler + 190, 232, aowiggler + 243);
  ellipse(184, aowiggler + 133, 33, 29);
  
  //q
  ellipse(293, qwiggler + 205, 76, 74);
  line(332, qwiggler + 170, 332, qwiggler + 303);
  //ellipse(184, 133, 33, 29);
  
  //v
  line(356, vwiggler + 170, 381, vwiggler + 238);
  line(409, vwiggler + 170, 384, vwiggler + 238);

  //i
  line(436, iwiggler + 170, 438, iwiggler + 238);
  ellipse(436, iwiggler + 140, -2, 15);
  
  //s
  arc(482, swiggler + 187, 33, 42, PI+QUARTER_PI, TWO_PI);
  arc(509, swiggler + 191, 97, 60, PI, PI+QUARTER_PI);
  arc(481, swiggler + 189, 42, 37, HALF_PI, PI);
  arc(489, swiggler + 222, 32, 32, -2, HALF_PI);
  
  //t
  arc(553, twiggler2 + 148, 45, 185, HALF_PI, PI);
  line(558, twiggler2 + 170, 512, twiggler2 + 170);
}


//Animation function
void Animate(){
  

  //Changes variables to move whole text. Stops at whereToStop.
  if (xAxisStart < whereToStop) {
    xAxisStart += xspeed;
  }
  translate(xAxisStart, 0);

  
  //Changes variables for wiggle animation when texts stops.
  if (xAxisStart == whereToStop) {
    
    //T
    twiggler = WiggleLetter(tmovingdown, twiggler);
    tmovingdown = MovingDownOrUp(tmovingdown, twiggler);
    //Starts the next letter when this letter has moved a little.
    if (twiggler > spaceBeforeStart) {
      aostart = true;
    }
    
    //å
    if (aostart == true) {
      aowiggler = WiggleLetter(aomovingdown, aowiggler);
      aomovingdown = MovingDownOrUp(aomovingdown, aowiggler);
      if (aowiggler > spaceBeforeStart) {
        qstart = true;
      }
    }
    
    //q
    if (qstart == true) {
      qwiggler = WiggleLetter(qmovingdown, qwiggler);
      qmovingdown = MovingDownOrUp(qmovingdown, qwiggler);
      if (aowiggler > spaceBeforeStart) {
        vstart = true;
      }
    }
    
    
    //v
    if (vstart == true) {
      vwiggler = WiggleLetter(vmovingdown, vwiggler);
      vmovingdown = MovingDownOrUp(vmovingdown, vwiggler);
      if (vwiggler > spaceBeforeStart) {
        istart = true;
      }
    }
    
    //i
    if (istart == true) {
      iwiggler = WiggleLetter(imovingdown, iwiggler);
      imovingdown = MovingDownOrUp(imovingdown, iwiggler);
      if (iwiggler > spaceBeforeStart) {
        sstart = true;
      }
    }
    
    //s
    if (sstart == true) {
      swiggler = WiggleLetter(smovingdown, swiggler);
      smovingdown = MovingDownOrUp(smovingdown, swiggler);
      if (swiggler > spaceBeforeStart) {
        tstart2 = true;
      }
    }
    
    //t
    if (tstart2 == true) {
      twiggler2 = WiggleLetter(tmovingdown2, twiggler2);
      tmovingdown2 = MovingDownOrUp(tmovingdown2, twiggler2);
    }
  }
}

//Function to change values for wiggle
int WiggleLetter(boolean movingdown, int wiggler){
    //T
    if(movingdown == true) {
      wiggler = wiggler + 1;
    }
    
    else {
      wiggler -= 1;
    }
    return wiggler;
}

//Function to toggle between text moving up and moving down
boolean MovingDownOrUp(boolean movingdown, int wiggler) {
   if (wiggler > 50) {
     movingdown = false;
   }
   
   if (wiggler < -50) {
     movingdown = true;
   }
   
   return movingdown;
}
