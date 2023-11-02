float angleX = 0; // Initial rotation angle around X-axis
float angleY = 0; // Initial rotation angle around Y-axis
float sensitivity = 0.007; // Sensitivity for rotation speed

color red = color(255,0,0), green = color(0,255,0), blue = color(0,0,255), 
black = color(0,0,0), white = color(255,255,255),
cyan = color(0,255,255), magenta = color(255,0,255), yellow = color(255,255,0);

ColorManager colorManager;

ArrayList<Control> allControls;
Slider redSlider, greenSlider, blueSlider, cyanSlider, magentaSlider, yellowSlider, blackSlider;
NumberBox redNumberBox, greenNumberBox, blueNumberBox, cyanNumberBox, magentaNumberBox, yellowNumberBox, blackNumberBox;

boolean firstMousePress = false;

void setup() 
{ 
  size(1280, 720, P3D); 
  noStroke(); 
  colorMode(RGB, 255);
  
  allControls = new ArrayList<Control>();
  
  //rgb sliders
  redSlider = new Slider(30,30,200,30,red,1,0,255);
  greenSlider = new Slider(30,80,200,30,green,1,0,255);
  blueSlider = new Slider(30,130,200,30,blue,1,0,255);
  allControls.add(redSlider);
  allControls.add(greenSlider);
  allControls.add(blueSlider);
  
  //cmyk sliders
  cyanSlider = new Slider(30,200,200,30,cyan,1,0,100);
  magentaSlider = new Slider(30,250,200,30,magenta,1,0,100);
  yellowSlider = new Slider(30,300,200,30,yellow,1,0,100);
  blackSlider = new Slider(30,350,200,30,black,1,0,100);
  allControls.add(cyanSlider);
  allControls.add(magentaSlider);
  allControls.add(yellowSlider);
  allControls.add(blackSlider);
  
  //rgb numbers
  redNumberBox = new NumberBox(260,30,70,30,red,20,255);
  greenNumberBox = new NumberBox(260,80,70,30,green,20,255);
  blueNumberBox = new NumberBox(260,130,70,30,blue,20,255);
  allControls.add(redNumberBox);
  allControls.add(greenNumberBox);
  allControls.add(blueNumberBox);
  
  //cmyk numbers
  cyanNumberBox = new NumberBox(260,200,70,30,cyan,20,100);
  magentaNumberBox = new NumberBox(260,250,70,30,magenta,20,100);
  yellowNumberBox = new NumberBox(260,300,70,30,yellow,20,100);
  blackNumberBox = new NumberBox(260,350,70,30,black,20,100);
  allControls.add(cyanNumberBox);
  allControls.add(magentaNumberBox);
  allControls.add(yellowNumberBox);
  allControls.add(blackNumberBox);
  
  colorManager = new ColorManager(255,255,255);
} 
 
void draw() 
{ 
  background(180,180,180);
  cube();
  for(Control c : allControls){
    c.update();
    if(c.focus){
      if(c.Color == red || c.Color == green || c.Color == blue)
        colorManager.setColor(c.getInt(),c.Color);
      else
        colorManager.setColor(c.getFloat()/100,c.Color);
    }
    c.display();
  }
  fill(colorManager.getRGBcolor());
  rect(100,450,200,200);
  if (firstMousePress) {
    firstMousePress = false;
  }
} 
