int ending(){

  if(t > 3){
    textSize(18);
    text("Press 'a' key to title", width * 0.5, height * 0.5);
    if(keyPressed && key == 'a'){
    return 0;
    }
  }
  fill(255,50,50);
  textSize(45);
    text("GAME CLEAR", width * 0.5, height * 0.4);
  return 3;
}//タイトルに戻ることができる
