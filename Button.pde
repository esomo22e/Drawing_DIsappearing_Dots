class Button{
  String label;
  float x;
  float y;
  float w;
  float h;
  
  boolean showButton;
  
  color titleButColor;
  color titleButTextColor;
  
  Button(String labelB, float xPos, float yPos, float widthB, float heightB ){
     label = labelB;
     x = xPos;
     y = yPos;
     w = widthB;
     h = heightB;
     
     titleButColor = color(115, 0, 130);
     titleButTextColor = color(255,250,205);
  }
  
  void Draw(){
    
    //if(showButton == true){
    fill(titleButColor);
    noStroke();
    rect(x, y, w, h, 15);
    fill( titleButTextColor);
    textAlign(CENTER, CENTER);
    textSize(45);
    text(label, x + (w/2), y + (h/2));
    //}
    
  }
  
  boolean isMouseOver(){
    if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < (y+h)){
      return true;
    }
    return false;
  }
}