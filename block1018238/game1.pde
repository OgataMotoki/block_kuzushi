int game1(){

  
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
  }//弾が下に行くとライフが減り、かつやり直し

  if(T_x+15>240&&T_x<258&&T_y<13){//ゴールに到達したとき

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
    return 2;
  }// ステージ２へ移動するためのリセット
  
  if(life<=-1){
    return 4;
  }//ライフがなくなるとゲームオーバーの画面へ
  
  noStroke();
  fill(230);
  int[] tate_x={30, 30, 30, 30, 470,470,470,470,130,130,250,380,380,380,290};
  int[] tate_y={20, 110,200,290,20, 110,200,290,130,220,80, 80, 170,260,180};//縦向きの壁のｘ、ｙ座標
  int[] yoko_x={10, 110,310,410,155,280};
  int[] yoko_y={5  ,5,  5,  5,  170,140};//横向きの壁のｘ、ｙ座標
  for(int i=0; i<tate_x.length; i++){
  rect(tate_x[i],tate_y[i],10,80);//縦向きの壁生成
  if((tate_x[i]<T_x+15&&tate_x[i]+2>T_x+15&&tate_y[i]<T_y+15&&tate_y[i]+80>T_y)||
    (tate_x[i]+10>T_x&&tate_x[i]+8<T_x&&tate_y[i]<T_y+15&&tate_y[i]+80>T_y)){
    T_dx=-T_dx;
  }
  if((tate_x[i]<T_x+15&&tate_x[i]+10>T_x&&tate_y[i]-1<T_y+15&&tate_y[i]+1>T_y+15)||
  (tate_x[i]<T_x+15&&tate_x[i]+10>T_x&&tate_y[i]+80>T_y&&tate_y[i]+78<T_y)){
  T_dy=-T_dy;
}
  }//縦向きの壁の当たり判定と反射
  for(int j=0; j<yoko_x.length; j++){
  rect(yoko_x[j],yoko_y[j],80,10);//横向きの壁生成
  if((yoko_x[j]<T_x+15&&yoko_x[j]+2>T_x+15&&yoko_y[j]<T_y+15&&yoko_y[j]+10>T_y)||
  (yoko_x[j]+80>T_x&&yoko_x[j]+78<T_x&&yoko_y[j]<T_y+15&&yoko_y[j]+10>T_y)){
    T_dx=-T_dx;
  }
  if((yoko_x[j]<T_x+15&&yoko_x[j]+80>T_x&&yoko_y[j]<T_y+15&&yoko_y[j]+2>T_y+15)||
  (yoko_x[j]<T_x+15&&yoko_x[j]+80>T_x&&yoko_y[j]+10>T_y&&yoko_y[j]+8<T_y)){
    T_dy=-T_dy;
  }
  }//横向きの壁の当たり判定と反射
  

  
  I_bar_x = I_bar_x+I_dx;//プレイヤーバーの動き
  T_x = T_x+T_dx;//
  T_y = T_y+T_dy;//弾の動き
  stroke(0);
  textSize(18);
  fill(200,230,0);
  text("stage 1",255,440);//ステージ番号表示
  fill(255);
  textSize(18);
  text("Press 'r' key to reset stage1",360,580);//ｒキーによるリセット喚起（詰み防止）
  textSize(15);
  text("life",50,580);//保険バーの残りライフ表示
  textSize(23);
  text(life,85,580);
  rect(I_bar_x,I_bar_y,80,5);//プレイヤーバー生成
  rect(T_x,T_y,15,15);//弾生成
  if(key_count==0){
  if((keyPressed==true)&&(key==' ')){
    I_dx=0;
    T_dx=0;
    key_count=1;
  }//キーが押されるとバーの移動停止
  else{
  if(I_bar_x<0){
    I_dx=0.5;
    T_dx=0.5;
  }else if(I_bar_x > width-80){
    I_dx=-0.5;
    T_dx=-0.5;
  }
  }//押されてないときはそのまま同じ運動
  }
      line_rad=line_rad+d_rad;//弾進行方向の座標の変化
   if(I_dx==0){
      stroke(255,255,0);
      line(I_bar_x+40,I_bar_y,(cos(radians(line_rad)))*90+I_bar_x+40,(sin(radians(line_rad)))*90+I_bar_y);//バーが停止すると弾の進行方向の表示
   if((keyPressed==true)&&((key=='s')||(key=='S'))){
      d_rad=0;
      rad_count+=1;
   }//弾発射（SHOTのS）
   if(rad_count==2){
      T_dx=cos(radians(line_rad));
      T_dy=sin(radians(line_rad));
   }//弾が発射するlineは停止。プレーヤーがどの方向に打ったかが自分で分かる仕組み。
}
  if(line_rad>=360){
    d_rad=-0.5;
  }
  if(line_rad<=180){
    d_rad=0.5;
  }//打つ方向が常に上側になる

  if(T_x<0||T_x+15>500||(I_bar_x<T_x+15&&I_bar_x+2>T_x+15&&I_bar_y<T_y+15&&I_bar_y+5>T_y)||
  (I_bar_x+80>T_x&&I_bar_x+78<T_x&&I_bar_y<T_y+15&&I_bar_y+5>T_y)){
    T_dx=-T_dx;
  }
  if(T_y<0||(I_bar_x<T_x+15&&I_bar_x+80>T_x&&I_bar_y<T_y+15&&I_bar_y+2>T_y+15)||
  (I_bar_x<T_x+15&&I_bar_x+80>T_x&&I_bar_y+5>T_y&&I_bar_y+3<T_y)){
    T_dy=-T_dy;
  }//プレイヤーバーの弾との反射
  

  noStroke();
  rect(b_x,b_y,492,5);//保険バー生成
  if(b_x<T_x+4&&b_x+492>T_x+11&&b_y<T_y+15&&b_y+2>T_y+15){
     T_dy=-T_dy;
     bar_count=bar_count+1;
   }//保険バーの当たり判定と反射
  if(bar_count>=5){
    b_y=1000;//バー耐久値が一定に達すると画面外へ（消えたように見せる）
  }else{
    textSize(13);
    text(bar_count,5,545);
  }//バー耐久値の表示
  fill(255,0,0);
  textSize(13);
  text("goal",width/2,15);//ゴール
    
  return 1;
  
}
