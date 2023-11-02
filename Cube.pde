void cube(){
  pushMatrix(); 
 
  translate(width*2/3, height/2, -30);

  rotateX(angleX);
  rotateY(angleY);
  
  scale(120);
  beginShape(QUADS);

  fill(cyan); vertex(-1,  1,  1);
  fill(white); vertex( 1,  1,  1);
  fill(magenta); vertex( 1, -1,  1);
  fill(blue); vertex(-1, -1,  1);

  fill(white); vertex( 1,  1,  1);
  fill(yellow); vertex( 1,  1, -1);
  fill(red); vertex( 1, -1, -1);
  fill(magenta); vertex( 1, -1,  1);

  fill(yellow); vertex( 1,  1, -1);
  fill(green); vertex(-1,  1, -1);
  fill(black); vertex(-1, -1, -1);
  fill(red); vertex( 1, -1, -1);

  fill(green); vertex(-1,  1, -1);
  fill(cyan); vertex(-1,  1,  1);
  fill(blue); vertex(-1, -1,  1);
  fill(black); vertex(-1, -1, -1);

  fill(green); vertex(-1,  1, -1);
  fill(yellow); vertex( 1,  1, -1);
  fill(white); vertex( 1,  1,  1);
  fill(cyan); vertex(-1,  1,  1);

  fill(black); vertex(-1, -1, -1);
  fill(red); vertex( 1, -1, -1);
  fill(magenta); vertex( 1, -1,  1);
  fill(blue); vertex(-1, -1,  1);

  endShape();
  
  popMatrix();
}
