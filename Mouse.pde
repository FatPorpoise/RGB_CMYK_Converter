void mousePressed(){
  if (!firstMousePress) {
    firstMousePress = true;
  }
}
void mouseDragged(){
  if(ifNoControlFocused()){
    float deltaX = mouseX - pmouseX;
    float deltaY = mouseY - pmouseY;
    angleY += deltaX * sensitivity;
    angleX -= deltaY * sensitivity;
  }
}
void mouseReleased(){
}

boolean ifNoControlFocused(){
  for(Control c : allControls)
    if(c.focus) return false;
  return true;
}
