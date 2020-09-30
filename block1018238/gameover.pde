int gameover(){
  

 if(t>3){
   textSize(18);
   fill(255);
 text("Press 'a' key to title", width * 0.5, height * 0.5);
 if(keyPressed && key == 'a') {//タイトルに戻ることができる
   life=10;
   return 0;
 }
 }
 fill(255,0,0);
 textSize(45);
  text("GAME OVER", width * 0.5, height * 0.4);
  return 4;
}
