int state;    //現在の状態
long t_start; //その状態になった時間
float t;      // 経過時間
float bar_x = 180;//ステージ２、お邪魔バーのｘ座標
float bar_y = 30;//　　　　　　　　　　　　  y座標
float bar_dx = 0.15;//お邪魔バーの変化量
float I_bar_x = 210;//プレイヤーバーのｘ座標
float I_bar_y = 520;//　　　　　　　　ｙ座標
float T_x = I_bar_x+(80/2-15/2);//弾のｘ座標
float T_y = I_bar_y-15;//　　　　　　 ｙ座標
float I_dx = 0.5;//プレイヤーバーのｘ座標の変化量
float T_dx = 0.5;//弾のｘ座標の変化量
float T_dy = 0;//　　ｙ座標の変化量
float line_rad = 270; //弾進行方向を表示するラインの要素
float d_rad = 0.5;//回転速度
float rad_count = 1;//回転の制御
float key_count = 0;//キーの判定
int bar_count = 0;//バーの耐久値
float b_x=4;//保険バーのｘ座標
float b_y=550;//　　　　ｙ座標
int life = 10;//ライフ



void setup(){

  frameRate(300);
  size(500, 600);
  textSize(32);
  textAlign(CENTER);//座標を中心に合わせる
  fill(255);
  state = 0;
  t_start = millis();
}




void draw(){


  background(0);
  t = (millis() - t_start) / 1000.0; //経過時間を更新
  
  int nextState= 0;
  if(state == 0){ nextState = title(); }
  else if(state == 1){ nextState = game1(); }
  else if(state == 2){ nextState = game2(); }
  else if(state == 3){ nextState = ending(); }
  else if(state == 4){ nextState = gameover();}//ステージの変化
  
  if(state != nextState){ t_start = millis(); } 
  state = nextState;
}// ステージごとに時間を図るため、時間を更新する。今後の追加編集において利用価値あり。



void keyPressed(){
  
if(keyPressed==true&&((key=='r')||(key=='R'))){
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
}//キーが押されるとリセットされる
