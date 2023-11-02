class ColorManager{
  int r, g, b;
  float c, m, y, k;
  ColorManager(int _r, int _g, int _b){
    r = _r;
    g = _g;
    b = _b;
    convertToCMYK();
    setControls();
  }
  ColorManager(float _c,float _m,float _y,float _k){
    c = _c;
    m = _m;
    y = _y;
    k = _k;
    convertToRGB();
    setControls();
  }
  void setColor(int value, color whatColor){
    if(whatColor == red) r = value;
    else if(whatColor == green) g = value;
    else if(whatColor == blue) b = value;
    
    convertToCMYK();
    setControls();
  }
  void setColor(float value, color whatColor){
    if(whatColor == cyan) c = value;
    else if(whatColor == magenta) m = value;
    else if(whatColor == yellow) y = value;
    else if(whatColor == black) k = value;
    
    convertToRGB();
    setControls();
  }
  void convertToCMYK(){
    float rNorm = (float)r/255, gNorm = (float)g/255, bNorm = (float)b/255;
    k=min(1-rNorm,1-gNorm,1-bNorm);
    if(k==1){
      c = 0; m = 0; y = 0;
    }
    else{
      c = (1-rNorm-k)/(1-k);
      m = (1-gNorm-k)/(1-k);
      y = (1-bNorm-k)/(1-k);
    }
  }
  
  void convertToRGB(){
    r = (int)((1-min(1,c*(1-k)+k))*255);
    g = (int)((1-min(1,m*(1-k)+k))*255);
    b = (int)((1-min(1,y*(1-k)+k))*255);
  }
  
  int[] getRGB(){
    return new int[]{r,g,b};
  }
  color getRGBcolor(){
    return color(r,g,b);
  }
  float[] getCMYK(){
    return new float[]{c,m,y,k};
  }
  void setControls(){
    //rgb
    redSlider.setValue(r);
    redNumberBox.setValue(r);
    greenSlider.setValue(g);
    greenNumberBox.setValue(g);
    blueSlider.setValue(b);
    blueNumberBox.setValue(b);
    //cmyk
    cyanSlider.setValue(round(c*100));
    cyanNumberBox.setValue(round(c*100));
    magentaSlider.setValue(round(m*100));
    magentaNumberBox.setValue(round(m*100));
    yellowSlider.setValue(round(y*100));
    yellowNumberBox.setValue(round(y*100));
    blackSlider.setValue(round(k*100));
    blackNumberBox.setValue(round(k*100));
  }
}
