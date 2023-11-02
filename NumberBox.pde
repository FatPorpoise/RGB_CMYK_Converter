class NumberBox extends Control{
 color textColor, borderColor;
 int borderWeight, valueMax, fontSize;
 String text;
 boolean keyCooldown;
 
 NumberBox(float xp, float yp, float w, float h, color c, int font, int max) {
   super(xp,yp,w,h,c);
   borderWeight = 2;
   valueMax = max;
   text = "0";
   fontSize = font;
   if(Color == color(0,0,0))
     textColor = color(255,255,255);
   else
     textColor = color(0,0,0);
   borderColor = color(0,0,0);
   keyCooldown = false;
 }
 void setValue(int value){
   text = Integer.toString(value);
 }
 
 int getInt(){
   return Integer.parseInt(text);
 }
 float getFloat(){
   return Float.parseFloat(text);
 }
 
 void update(){
  if (firstMousePress && mouseOver()) {
    focus = true;
  }else
  if (mousePressed && !mouseOver()) {
    focus = false;
  }
    
  if (focus && keyPressed && !keyCooldown) {
    keyCooldown = true;
    if (key == BACKSPACE) {
      backspace();
    }else { 
    if (key >= '0' && key <= '9') {
      if(text.equals("0"))
        text = ""+key;
      else
       addText(key);
    }
   }
  }else if(!keyPressed)
    keyCooldown = false;
 }
 
 void display() {
  fill(Color);
  if (focus) {
    strokeWeight(borderWeight);
    stroke(borderColor);
  }
  
  rect(xpos, ypos, Width, Height);
  
  stroke(textColor);
  fill(textColor);
  textSize(fontSize);
  text(text, xpos + 2, ypos+Height/2+3);
  noStroke();
 }
 
 private void addText(char c) {
  if (Integer.parseInt(text + c) <= valueMax) {
   text += c;
  }
 }
 
 private void backspace() {
  if (text.length() - 1 > 0) {
    text = text.substring(0, text.length() - 1);
  }else 
  {
    text = "0";
  }
 }
}
