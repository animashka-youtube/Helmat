class blocks{
  int x, y, wx, dx, dy;
  float wk, hk;
  blocks(int x, int y, int wx){
    this.x = x;
    this.y = y;
    this.wx = wx;
  }
  
 void display(int dx, int dy, float wk, float hk){
  this.dx = dx; this.dy = dy; this.wk = wk;
  float vw = width/100, vh = height/100;
  fill(#006c00); stroke(#00c948); strokeWeight(5);
  rect(x*wk+dx, y*hk+dy, wx*vw, 5*vh, 5);
  
 }
}

class human{
  
  float x, y, h = 8, StartVelY = -6.5;
  PVector loc, vel, grav;
  int block = -1, sost = 0;
  boolean flag8 = false;
  
  human(float x, float y) {
  this.x = x;
  this.y = y;
  loc = new PVector(x, y);
  vel = new PVector(0, 0);
  grav = new PVector(0, 0);
  }
  void update(){
    
    float vw = width/100, vh = height/100;
      
      if (right && (loc.x < 93) && !isJump && !fall) {
        grav.x = 0.03; sost = 1;
        if (up) {isJump = true; vel.y = StartVelY;}
    } else if (left && (loc.x > 7) && !isJump && !fall) {
        grav.x = -0.03; sost = 2;
        if (up) {isJump = true; vel.y = StartVelY;}
    } else if (up && !isJump && !right && !left && !fall) {
        vel.x = 0; isJump = true; vel.y = StartVelY; grav.x = 0;
    }
    
      if (isJump) { //прыжок, проверено
        sost = 3; grav.y = 0.5;
        for (int i=0; i<countBlocks; i++){ 
        if (vel.y > 0 && blocksSet[i][0]/19.0+dx/19 <= loc.x && loc.x <= blocksSet[i][0]/19.0+blocksSet[i][2]+dx/19
        && blocksSet[i][1]/11.0-4+dy/11 <= loc.y+h/2 && loc.y+h/2 <= blocksSet[i][1]/11.0+3+dy/11){
          grav.y = 0; vel.y = 0; loc.y = blocksSet[i][1]/11.0-h/2+dy/11; isJump = false; block = i;}
        }
        if (vel.y >= -StartVelY+0.01 && flag8 == false) {isJump = false; grav.y = 0;}
        if (loc.y <= 8) {
          flag8 = true;}
          if (flag8){
          for (int i=0; i<countBlocks; i++){
            if (blocksSet[i][0]/19.0+dx/19 <= loc.x && loc.x <= blocksSet[i][0]/19.0+blocksSet[i][2]+dx/19
            && blocksSet[i][1]/11.0+3+dy/11 <= loc.y+h/2 && loc.y+h/2 < blocksSet[i][1]/11.0+8+dy/11){  
            grav.y = 0; vel.y = 0; loc.y = blocksSet[i][1]/11.0-h/2+dy/11; isJump = false; vel.x = 0; grav.x = 0; block = i; flag8 = false; fall = false;
          }
        } 
      }
      }
       
       for (int i=0; i<countBlocks; i++){ //нижний барьер, проверено
       //fill(#FF0000, 100); noStroke(); rect(blocksSet[i][0]/19.0*vw+dx, blocksSet[i][1]/11.0*vh+3*vh+dy, blocksSet[i][2]*vw, 5*vh);
        if (isJump && blocksSet[i][0]/19.0+dx/19 <= loc.x && loc.x <= blocksSet[i][0]/19.0+blocksSet[i][2]+dx/19
        && blocksSet[i][1]/11.0+3+dy/11 <= loc.y-h/2 && loc.y-h/2 <= blocksSet[i][1]/11.0+8+dy/11){
          fall = true; vel.y = 0;}
      }
      
      
      if (fall) { //blocksSet[i][0] - x (px), blocksSet[i][1] - y (px), blocksSet[i][2] - ширина, высота 5vh 
        grav.y = 0.5; sost = 3;
        for (int i=0; i<countBlocks; i++){
        if (blocksSet[i][0]/19.0+dx/19 <= loc.x && loc.x <= blocksSet[i][0]/19.0+blocksSet[i][2]+dx/19
        && blocksSet[i][1]/11.0+3+dy/11 <= loc.y+h/2 && loc.y+h/2 < blocksSet[i][1]/11.0+7+dy/11){  
          grav.y = 0; vel.y = 0; loc.y = blocksSet[i][1]/11.0-h/2+dy/11; fall = false; vel.x = 0; grav.x = 0; block = i;
        } else if (dy <= 0 && loc.y >= 92) {
          loc.y = 92; grav.y = 0; vel.y = 0; fall = false; vel.x = 0; grav.x = 0; block = -1;
        }
      }
      }
      
      if (block > -1){
        if (blocksSet[block][0]/19.0+dx/19 > loc.x || loc.x > blocksSet[block][0]/19.0+blocksSet[block][2]+dx/19){
          fall = true;}
      }
      
      for (int i=0; i<5; i++){
        //fill(#FF0000, 100); noStroke(); rect(portalSet[i][0]/19.0*vw+dx-2*vw, portalSet[i][1]/11.0*vh+dy-7.5*vh, 4*vw, 15*vh);
        if (portalSet[i][0]/19.0+dx/19-2 <= loc.x && loc.x <= portalSet[i][0]/19.0+dx/19+2 &&
        portalSet[i][1]/11.0+dy/11-7.5 <= loc.y && loc.y <= portalSet[i][1]/11.0+dy/11+7.5) {
          lvl2stadia2 = 2; loc.x = 12; loc.y = 92; grav.x = 0; vel.x = 0; dx = 0; dy = 0; break;
        }
      }    
      vel.add(grav);
      loc.add(vel);
      if (!keyPressed && !isJump && !fall) {vel.x = 0;  grav.x = 0; vel.y = 0; grav.y = 0; sost = 0;}
      if (loc.y <= 8 && isJump) {if (dy < height-14*vh) dy+=15; sost = 3;}
      if (loc.y > 92) {loc.y = 92; if (dy > 0) dy-=15; sost = 3; if (dy == 0) fall = false; isJump = false; sost = 0;}
      if (loc.x >= 93 && keyPressed && right && dx > -width) {loc.x = 93; dx-=7; sost = 1;} if (loc.x >= 93) loc.x = 93;
      if (loc.x <= 7 && keyPressed && left && dx < 0) {loc.x = 7; dx+=7; sost = 2;} if (loc.x <= 7) loc.x = 7;
      noStroke(); fill(#FFFFFF); image(pers[sost], (loc.x)*vw, (loc.y-2)*vh, 8*vw, 8*vw);
}
}
