ArrayList<Particle> pts;
boolean didPress;

Button nextButton;
Button prevButton;


String title;
color titleColor;

int num = 0;
int count = 0;

int delaySketch = 0;

void setup() {
  size(displayWidth, displayHeight, P2D);
 // size(500,500,P2D);
  orientation(LANDSCAPE);

  //

  pts = new ArrayList<Particle>();

  titleColor = color(75, 0, 130);
  nextButton = new Button("Next", 1520, 900, 300, 125);
  prevButton = new Button("Previous", 100, 900, 300, 125);

  didPress = false;

  colorMode(HSB);
  

  
}

void draw() {

  background(200, 26,255);

  switch(num) {
  case 0:
    //title = "Mimic 3D Mobile";
    titleText();
    nextButton.Draw();
    break;
  case 1:
    titleInstruction();
    nextButton.Draw();
    prevButton.Draw();
    break;
  case 2:
    drawParticles();
    prevButton.Draw();
    title = "";
    break;
  }

  
}

void titleText(){
  title = "Draw Disappearing Dots";
  fill(titleColor);
  textAlign(CENTER);
  textSize(85);
 // textLeading(36);
  text( title, width * 0.5, height * 0.5);
  
}

void titleInstruction(){
  title = "Touch the screen and draw a series of dots. Take a moment and watch the dots dissapear.";
  fill(titleColor);
  textAlign(CENTER);
  textSize(65);
  textLeading(60);
  text(title, width *0.25, height *0.35, width *0.5, height *0.5);
 // text( title, 1000, 1000, 1000, 500);
}
void drawParticles() {

   
    if (didPress) {
      for (int i = 0; i < 10; i++) {
        Particle addPart = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size());
        pts.add(addPart);
      }
      // fill(255,255,255,20);
      // rect(0,0,width,height);
    }

    for (int i=0; i<pts.size(); i++) {
      Particle p = pts.get(i);
      p.update();
      p.display();
    }
  
    for (int i=pts.size()-1; i>-1; i--) {
      Particle p = pts.get(i);
      if (p.end) {
        pts.remove(i);
      }
    }
 
}


void mousePressed() {
  if (didPress == false) {
    didPress = true;
  }
 
 if (nextButton.isMouseOver()) {

    if (num == 0) {
      num = 1;
    } else if (num == 1) {
      //drawParticles();
      num = 2;
    }
  }else if (prevButton.isMouseOver()) {

    if (num == 2) {

      num = 1;
    } else if (num == 1) {
      num = 0;
    }
  }  
}

//void mouseReleased(){
//  didPress = false;
//}