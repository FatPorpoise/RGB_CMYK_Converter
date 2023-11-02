//modified slider from Processing examples
class Slider extends Control{
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min position values of slider
  int loose;              // how loose/heavy
  float ratio;
  float valueMin, valueMax;         // max and min value of the slider

  Slider (float xp, float yp, float sw, float sh, color c, int l, float min, float max) {
    super(xp,yp,sw,sh,c);
    float widthtoheight = sw - sh;
    ratio = sw/widthtoheight;
    spos = xp + sw/2 - sh/2;
    newspos = spos;
    sposMin = xp;
    sposMax = xp + sw - sh;
    loose = l;
    valueMin = min;
    valueMax = max;
  }

  void update() {
    super.update();
    if (focus) {
      newspos = constrain(mouseX-Height/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  void display() {
    noStroke();
    super.display();
    if (mouseOver() || focus) {
      if(Color == color(0,0,0))
      fill(255,255,255);
      else
      fill(0, 0, 0);
    } else {
      if(Color == color(0,0,0))
      fill(153, 153, 153);
      else
      fill(102, 102, 102);
    }
    rect(spos, ypos, Height, Height);
  }
  
  void setValue(int value){
    float valueFloat = (float)value;
    if(valueFloat>=valueMin && valueFloat<=valueMax){
      valueFloat = (valueFloat - valueMin)/(valueMax - valueMin)*(sposMax - sposMin) + sposMin;
      spos = valueFloat;
      newspos = valueFloat;
    }
  }

    // Convert spos to be values between min and max
  float getFloat() {
    return (spos-sposMin) * ratio/Width*(valueMax-valueMin)+valueMin;
  }  
  int getInt() {
    return round((spos-sposMin) * ratio/Width*(valueMax-valueMin)+valueMin);
  }
}
