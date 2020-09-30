int game2(){//game1とほぼ同じ内容なので、追加項目のみコメントします

  if(T_y>600){
  I_bar_x=210;
  T_x = I_bar_x+(80/2-15/2);
  T_y = I_bar_y-15;
  I_dx=0.5;
  T_dx=0.5;
  T_dy=0;
  d_rad=0.5;
  rad_count=1;
  key_count=0;
  life=life-1;
  }

  
  if(T_x+15>240&&T_x<258&&T_y<13){

    I_bar_x=210;
    T_x = I_bar_x+(80/2-15/2);
    T_y = I_bar_y-15;
    I_dx=0.5;
    T_dx=0.5;
    T_dy=0;
    d_rad=0.5;
    rad_count=1;
    key_count=0;
    bar_count=0;
    b_y=550;
    life=10;
    return 3;
  }
  
  if(life<=-1){
    return 4;
  }
  
  noStroke();
  fill(230);
  int[] tate_x={30, 30, 30, 30, 470,470,470,470,155,155,345,360,270};
  int[] tate_y={20, 110,200,290,20, 110,200,290,80, 220,15, 240,290};
  int[] yoko_x={10, 110,310,410,120,280,165};
  int[] yoko_y={5  ,5,  5,  5,  300,310,115};
  int[] square_x={80,235,365};
  int[] square_y={50, 210,130};//新たな四角い壁生成
  for(int i=0; i<tate_x.length; i++){
  rect(tate_x[i],tate_y[i],10,80);
  if((tate_x[i]<T_x+15&&tate_x[i]+2>T_x+15&&tate_y[i]<T_y+15&&tate_y[i]+80>T_y)||
    (tate_x[i]+10>T_x&&tate_x[i]+8<T_x&&tate_y[i]<T_y+15&&tate_y[i]+80>T_y)){
    T_dx=-T_dx;
  }
  if((tate_x[i]<T_x+15&&tate_x[i]+10>T_x&&tate_y[i]-1<T_y+15&&tate_y[i]+1>T_y+15)||
  (tate_x[i]<T_x+15&&tate_x[i]+10>T_x&&tate_y[i]+80>T_y&&tate_y[i]+78<T_y)){
  T_dy=-T_dy;
}
  }
  for(int j=0; j<yoko_x.length; j++){
  rect(yoko_x[j],yoko_y[j],80,10);
  if((yoko_x[j]<T_x+15&&yoko_x[j]+2>T_x+15&&yoko_y[j]<T_y+15&&yoko_y[j]+10>T_y)||
  (yoko_x[j]+80>T_x&&yoko_x[j]+78<T_x&&yoko_y[j]<T_y+15&&yoko_y[j]+10>T_y)){
    T_dx=-T_dx;
  }
  if((yoko_x[j]<T_x+15&&yoko_x[j]+80>T_x&&yoko_y[j]<T_y+15&&yoko_y[j]+2>T_y+15)||
  (yoko_x[j]<T_x+15&&yoko_x[j]+80>T_x&&yoko_y[j]+10>T_y&&yoko_y[j]+8<T_y)){
    T_dy=-T_dy;
  }
  }
  for(int k=0; k<square_x.length; k++){
  rect(square_x[k],square_y[k],40,40);
  if((square_x[k]<T_x+15&&square_x[k]+2>T_x+15&&square_y[k]<T_y+15&&square_y[k]+40>T_y)||
  (square_x[k]+40>T_x&&square_x[k]+38<T_x&&square_y[k]<T_y+15&&square_y[k]+40>T_y)){
    T_dx=-T_dx;
  }
  if((square_x[k]<T_x+15&&square_x[k]+40>T_x&&square_y[k]<T_y+15&&square_y[k]+2>T_y+15)||
  (square_x[k]<T_x+15&&square_x[k]+40>T_x&&square_y[k]+40>T_y&&square_y[k]+8<T_y)){
    T_dy=-T_dy;
  }
}//四角い壁の当たり判定

  I_bar_x = I_bar_x+I_dx;
  T_x = T_x+T_dx;
  T_y = T_y+T_dy;
  stroke(0);
  textSize(18);
  fill(200,230,0);
  text("stage 2",255,440);
  fill(255);
  textSize(18);
  text("Press 'r' key to reset stage2",360,580);
  textSize(15);
  text("life",50,580);
  textSize(23);
  text(life,85,580);
  rect(I_bar_x,I_bar_y,80,5);
  rect(T_x,T_y,15,15);
  if(key_count==0){
  if((keyPressed==true)&&(key==' ')){
    I_dx=0;
    T_dx=0;
    key_count=1;
  }
  else{
  if(I_bar_x<0){
    I_dx=0.5;
    T_dx=0.5;
  }else if(I_bar_x > width-80){
    I_dx=-0.5;
    T_dx=-0.5;
  }
  }
  }
      line_rad=line_rad+d_rad;
  if(I_dx==0){
    stroke(255,255,0);
    line(I_bar_x+40,I_bar_y,(cos(radians(line_rad)))*90+I_bar_x+40,(sin(radians(line_rad)))*90+I_bar_y);
   if((keyPressed==true)&&((key=='s')||(key=='S'))){
      d_rad=0;
      rad_count+=1;
   }
   if(rad_count==2){
      T_dx=cos(radians(line_rad));
      T_dy=sin(radians(line_rad));
   }
}
  if(line_rad>=360){
    d_rad=-0.5;
  }
  if(line_rad<=180){
    d_rad=0.5;
  }
  noStroke();
  bar_x=bar_x+bar_dx;//お邪魔バーの動作
  
  if(bar_x>=260){
    bar_dx=-0.3;  
  }else if(bar_x<=180){
    bar_dx=0.3;
  }//お邪魔バーの制御
  rect(bar_x,bar_y,60,5);//お邪魔バー生成  
    if(T_x<0||T_x+15>500||(bar_x<T_x+15&&bar_x+2>T_x+15&&bar_y<T_y+15&&bar_y+5>T_y)||
  (bar_x+60>T_x&&bar_x+58<T_x&&bar_y<T_y+15&&bar_y+5>T_y)||
  (I_bar_x<T_x+15&&I_bar_x+2>T_x+15&&I_bar_y<T_y+15&&I_bar_y+5>T_y)||
  (I_bar_x+80>T_x&&I_bar_x+78<T_x&&I_bar_y<T_y+15&&I_bar_y+5>T_y)){
    T_dx=-T_dx;
  }
  if(T_y<0||(bar_x<T_x+15&&bar_x+60>T_x&&bar_y<T_y+15&&bar_y+2>T_y+15)||
  (bar_x<T_x+15&&bar_x+60>T_x&&bar_y+5>T_y&&bar_y+3<T_y)||
  (I_bar_x<T_x+15&&I_bar_x+80>T_x&&I_bar_y<T_y+15&&I_bar_y+2>T_y+15)||
  (I_bar_x<T_x+15&&I_bar_x+80>T_x&&I_bar_y+5>T_y&&I_bar_y+3<T_y)){
    T_dy=-T_dy;
  }//お邪魔バーの当たり判定と反射
  

    noStroke();
    rect(b_x,b_y,492,5);
    if(b_x<T_x+4&&b_x+492>T_x+11&&b_y<T_y+15&&b_y+2>T_y+15){
      T_dy=-T_dy;
      bar_count=bar_count+1;
    }
  if(bar_count>=5){
    b_y=1000;
  }else{
    textSize(13);
    text(bar_count,5,545);
  }
  fill(255,0,0);
  textSize(13);
  text("goal",width/2,15);


  return 2;
  
}
