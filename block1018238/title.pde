int title(){
  textSize(45);
  fill(200,100,200);
  text("GAME nothing name", width * 0.5, height * 0.4);
  textSize(18);
  fill(255);
  text("Press 'z' key to start", width * 0.5, height * 0.5);
  if(keyPressed && key == 'z'){
    return 1;
  } // ｚを押すとステージ1突入
  return 0;
}
