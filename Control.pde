class Control{
  float Width, Height;
  float xpos, ypos;
  boolean focus;
  color Color;
  
  Control(float xp, float yp, float w, float h, color c){
    Width = w;
    Height = h;
    xpos = xp;
    ypos = yp;
    focus = false;
    Color = c;
  }
  boolean mouseOver() {
    if (mouseX > xpos && mouseX < xpos+Width &&
      mouseY > ypos && mouseY < ypos+Height) {
      return true;
    } else {
      return false;
    }
  }
  void update(){
    if (firstMousePress && mouseOver()) {
      focus = true;
    }
    if (!mousePressed) {
      focus = false;
    }
  }
  void display(){
    fill(Color);
    rect(xpos, ypos, Width, Height);
  }
  
  void setValue(int value){}
  int getInt(){
  return 0;}
  float getFloat(){
  return 0;}
}
