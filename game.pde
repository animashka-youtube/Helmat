void setup() {
  stadia = 1; stadia_progress = 1; lvl = 0; s = 0; baseM = 0.5; a = 0; baseS = 0.8; click = 0;
  live = 3; size = 1; podlvl1 = 1; lvl2stadia2 = 1; podlvl2 = 1;
  frameRate(60);
  minus = color(#000000); minus2 = color(#000000); plus = color(#266c00); plus2 = color(#266c00); liveChange = color(#FFFFFF);
  
  butt[0] = 255; for (int i=1; i<5; i++) butt[i] = 0; for (int i=0; i<5; i++) colors[i] = color(#00271f);
  
  blocksSet[0][0] = int(random(600, 800)); blocksSet[0][1] = int(random(820, 830)); blocksSet[0][2] = int(random(20, 55));
  for (int i=1; i<countBlocks; i++){
    if (i%5 == 0) blocksSet[i][0] = int(random(700, 900)); else if (i%5 == 1) blocksSet[i][0] = int(random(900, 1300));
    else if (i%5 == 2) blocksSet[i][0] = int(random(1300, 1800)); else if (i%5 == 3) blocksSet[i][0] = int(random(900, 1300));
    else if (i%5 == 4) blocksSet[i][0] = int(random(1800, 2300));
    blocksSet[i][1] = int(random(820-i*230, 830-i*230)); //x от 0 до 3300 (нормал: 0 до 3800) и y от -850 до 850 (нормал -1100 до 1100)
    blocksSet[i][2] = int(random(25, 50)); if (i == 3) blocksSet[i][2] = int(random(25, 30));//wx
    
  } for (int i=0; i<countBlocks; i++){
    block[i] = new blocks(blocksSet[i][0], blocksSet[i][1], blocksSet[i][2]);
  }
  
  for (int i=0; i<5; i++){
    portalK = random(1.2, 6);
    portalSet[i][0] = blocksSet[i+3][0]+blocksSet[i+3][2]*19/portalK; portalSet[i][1] = blocksSet[i+3][1]-8*11; //x + wx формула (ответ в px), а y просто над платформой
  }
  
  for (int i=0; i<10; i++){
    otvets[i] = color(#FFFFFF);
  }
  
  hum = new human(12, 92); randlvl2 = int(random(1, 6));
  b0 = int(random(2, 11)); 
  zadania[0] = b0+b0; //тип 2+2
  b1 = int(random(8, 41)); if (b1 == 0) b1 = 24; if (b1%8 != 0) b1 -= b1%8;
  a1 = 2; c1 = (b1*b1)/(4*a1);
  zadania[1] = b1/4; //b1 со знаком - в уравнении; квадратное ур
  zadania[2] = int(random(2, 41));
  a3 = int(random(1, 2*zadania[2])); c3 = 9*zadania[2]-5*a3;
  x4 = int(random(-5, 6)); a4 = int(random(2, 5)); b4 = int(random(-100, 101)); if (b4 == 0) b4 = 666;
  zadania[3] = 3*x4*x4 - a4*2*x4;
  a5 = int(random(-20, 21)); b5 = int(random(-20, 21)); if (a5 == 0) a5 = 6; if (b5 == 0) b5 = 8; if (a5%2 != 0) a5++; if (b5%2 != 0) b5--; 
  zadania[4] = a5/2+b5/2;
  
  switch (randlvl2){
    case 1: for (int i=0; i<10; i++) {randOtv[i] = int(random(4, 21)); if (randOtv[i] == zadania[0]) randOtv[i]++;} randOtv[4] = zadania[0]; break;
    case 2: for (int i=0; i<10; i++) {randOtv[i] = int(random(-41, 41)); if (randOtv[i] == zadania[1]) randOtv[i]--;} randOtv[4] = zadania[1]; break;
    case 3: for (int i=0; i<10; i++) {randOtv[i] = int(random(2, 41)); if (randOtv[i] == zadania[2]) randOtv[i]++;} randOtv[4] = zadania[2]; break;
    case 4: for (int i=0; i<10; i++) {randOtv[i] = int(random(-25, 131)); if (randOtv[i] == zadania[3]) randOtv[i]--;} randOtv[4] = zadania[3]; break;
    case 5: for (int i=0; i<10; i++) {randOtv[i] = int(random(-40, 40)); if (randOtv[i] == zadania[4]) randOtv[i]--;} randOtv[4] = zadania[4]; break;
  }
  
  sqrt = int(random(11, 99)); sqrt2 = int(random(1, sqrt)); results[0] = sqrt; positionX[0] = int(random(-1700, 3600));
  positionY[0] = int(random(20, 90)); rotates[0] = int(random(-30, 30));
  for (int i=1; i<7; i++) {results[i] = int(random(11, 99)); if (results[i] == results[0]) results[i]--; positionX[i] = int(random(-1700, 3600)); positionY[i] = int(random(10, 90));
  rotates[i] = int(random(-30, 30)); numb[i] = color(#FFFFFF);}
  
  size(1900, 1100);
  background(#D1F6FF);
  cursor(WAIT);

  img = loadImage("plazh-fon.jpg"); Helmat = loadImage("Helmat.png"); play1 = loadImage("play1.png");
  play2 = loadImage("play2.png"); shest = loadImage("shesternya.png"); shest2 = loadImage("shesternya2.png");
  shest_smal = loadImage("shest-smal.png"); shest_smal2 = loadImage("shest-smal2.png"); help = loadImage("help.png");
  help2 = loadImage("help2.png"); help_smal = loadImage("help_smal.png"); help_smal2 = loadImage("help_smal2.png"); 
  sett = loadImage("settings.png"); back1 = loadImage("back1.png"); back2 = loadImage("back2.png");
  lvl1 = loadImage("plazh-fon-lvl1.jpg"); lvl1_dek = loadImage("plazh-fon-lvl1.png"); heart = loadShape("heart.svg");
  one = loadShape("one.svg"); two = loadShape("two.svg"); three = loadShape("three.svg"); four = loadShape("four.svg");
  fife = loadShape("fife.svg"); six = loadShape("six.svg"); seven = loadShape("seven.svg"); eight = loadShape("eight.svg");
  nine = loadShape("nine.svg"); zero = loadShape("zero.svg"); egupt = loadImage("egupt.jpg");
  home = loadImage("home.png"); home2 = loadImage("home2.png"); portalSvet = loadImage("portal.png");
  pers[0] = loadImage("pers22.png"); pers[1] = loadImage("pers-right.png"); pers[2] = loadImage("pers-left.png"); pers[3] = loadImage("pers-up.png");
  numbers[0] = zero; numbers[1] = one; numbers[2] = two; numbers[3] = three; numbers[4] = four; numbers[5] = fife;
  numbers[6] = six; numbers[7] = seven; numbers[8] = eight; numbers[9] = nine; fonts[0] = img; fonts[1] = img; fonts[2] = egupt;
  
  portal = new Gif(this, "portal.gif");
  movie = new Movie(this, "animacia-version-konechnaya.mp4"); luzer = new Movie(this, "luzer.mp4");
  win = new Movie(this, "happyEnd.mp4"); lvl2 = new Movie(this, "lvl2.mp4");
  music = new SoundFile(this, "muzic1.wav"); sound = new SoundFile(this, "sound-button.wav");
  verno = new SoundFile(this, "verno.wav"); neverno = new SoundFile(this, "neverno.wav");
  
  f48 = loadFont("MyriadPro-Bold-48.vlw"); f30 = loadFont("MyriadPro-Bold-30.vlw"); f64 = loadFont("MyriadPro-Bold-64.vlw");
  fLvl2 = loadFont("AAlgerius-128.vlw"); fPravila = loadFont("MyriadPro-Regular-48.vlw");
  
  portal.play();
  music.loop(1, 0.0);
  surface.setLocation(0, 0);
  surface.setTitle("Helmat");
  //surface.setResizable(true);
  frameRate(30); smooth(8);
  imageMode(CENTER); shapeMode(CENTER); textAlign(CENTER);
}


void draw(){                                               //ГЛАВНЫЙ ЭКРАН
  float vw = width/100, vh = height/100; //1900 на 1100
  int x = mouseX; int y = mouseY;
  if (stadia > 2) scena = true;
  
  if (stadia == 1){ //стадии: (-1) - настройки, (-2) - проигрыш, 0 - переход, 2 - кат-сцена, 3 - игра, 4 - выигрыш, (-4) - правила, (-3) - переход
    if (s < baseM) {s+=0.01; music.amp(s);}
    cursor(ARROW); liveChange = color(#FFFFFF);
    image(img, width/2, height/2, width, height); image(Helmat, width/2, height/2, width, height);
    image(shest, 95*vw, 93*vh, 5.5*vw, 5.5*vw); image(help, 5*vw, 93*vh, 5.5*vw, 5.5*vw);
    
    if (x>92.25*vw && x<97.25*vw && y>90.25*vh && y<95.25*vh) {
      image(shest2, 95*vw, 93*vh, 5.5*vw, 5.5*vw);
      if (mousePressed == true && mouseButton == LEFT) {sound.play(1, baseS); stadia_progress = stadia; stadia=-1;}
    } else {
      image(shest, 95*vw, 93*vh, 5.5*vw, 5.5*vw);
    }
    
    if (x>2.25*vw && x<7.25*vw && y>90.25*vh && y<95.25*vh) {
      image(help2, 5*vw, 93*vh, 5.5*vw, 5.5*vw);
      if (mousePressed == true && mouseButton == LEFT) {sound.play(1, baseS); stadia_progress = stadia; stadia=-4;}
    } else {
      image(help, 5*vw, 93*vh, 5.5*vw, 5.5*vw);
    }
    
    if (x>width/2.05-150 && x<width/2.05+150 && y>height/1.4-50 && y<height/1.4+50) {
      image(play2, width/2.05, height/1.4, 300, 100);
      if (mousePressed == true && mouseButton == LEFT) {sound.play(1, baseS); stadia_progress++; stadia*=0; lvl++;}
    } else {
      image(play1, width/2.05, height/1.4, 300, 100);
    }
  }
                                                        //НАСТРОЙКИ
  if (stadia == -1){
    image(fonts[lvl], width/2, height/2, width, height); image(sett, width/2, height/2, width, height);
    image(back2, width-18-52, 18+52, 5.47*vw, 5.47*vw);
    noStroke();
    fill(minus); circle(width/5.5, height/3.35, 3*vw); fill (#ffffff); rect(width/5.7, height/3.4, 1.3*vw, vh);
    fill(plus); circle(width/1.3, height/3.35, 3*vw); fill (#ffffff); rect(width/1.314, height/3.38, 1.6*vw, 0.6*vh); rect(width/1.303, height/3.5, 0.37*vw, 2.72*vh);
    fill(minus2); circle(width/5.5, height/1.95, 3*vw); fill (#ffffff); rect(width/5.7, height/1.96, 1.3*vw, vh);
    fill(plus2); circle(width/1.3, height/1.95, 3*vw); fill (#ffffff); rect(width/1.314, height/1.96, 1.6*vw, 0.6*vh); rect(width/1.303, height/2, 0.37*vw, 2.72*vh);
   
    fill(#afdab7); rect(width/4.9, height/3.45, width/1.85, vw, vh);
    rect(width/4.9, height/1.98, width/1.85, vw, vh);
    
    fill (#3aaf4f); noStroke(); rect(width/4.9, height/3.45, width/1.85*baseM, vw, vh);
    rect(width/4.9, height/1.98, width/1.85*baseS, vw, vh);
    
    fill (#ffffff);
    textFont(f48, 2.53*vw); text(round(baseM*10), width/1.245, height/3.2);
    text(round(baseS*10), width/1.245, height/1.9);
    
    strokeWeight(8); textFont(f30, 1.58*vw);
    fill(colors[0]); stroke(#3aaf4f, butt[0]); rect(16.94*vw, height/1.42, 10.5*vw, 9.09*vh, 10);
    fill(colors[1]); stroke(#3aaf4f, butt[1]); rect(29.58*vw, height/1.42, 10.5*vw, 9.09*vh, 10);
    fill(colors[2]); stroke(#3aaf4f, butt[2]); rect(42.21*vw, height/1.42, 12.63*vw, 9.09*vh, 10);
    fill(colors[3]); stroke(#3aaf4f, butt[3]); rect(57.47*vw, height/1.42, 10.5*vw, 9.09*vh, 10);
    fill(colors[4]); stroke(#3aaf4f, butt[4]); rect(70.1*vw, height/1.42, 10.5*vw, 9.09*vh, 10);
    fill(#ffffff); text("1900x1100 (базовый)", 16.94*vw, height/1.39, 10.5*vw, 9.09*vh);
    text("1920x1080", 29.58*vw, height/1.35, 10.5*vw, 9.09*vh);
    text("На весь экран", 43.3*vw, height/1.35, 10.5*vw, 9.09*vh);
    text("1280х720", 57.47*vw, height/1.35, 10.5*vw, 9.09*vh);
    text("1300х700", 70.1*vw, height/1.35, 10.5*vw, 9.09*vh);
    
    if (x>16.94*vw && x<27.45*vw && y>70.42*vh && y<79.5*vh && butt[0] != 255) {
      colors[0] = color(#00634f);
      if (mousePressed == true && mouseButton == LEFT) {                                             //базовый экран
          click++;                                                                     
         if (click==1){
         for (int i=1; i<5; i++) butt[i] = 0; butt[0] = 255; surface.setSize(1900, 1100); sound.play(1, baseS); size = 1; px=0; dx=0; dy=0;
        } else click = 0;}
      } else {
      colors[0] = color(#00271f);
      }
      
    if (x>29.58*vw && x<40.08*vw && y>70.42*vh && y<79.5*vh && butt[1] != 255) {
      colors[1] = color(#00634f);
      if (mousePressed == true && mouseButton == LEFT) {                                             //1920 на 1080
         click++;                                                                     
         if (click==1){
         for (int i=0; i<5; i++) butt[i] = 0; butt[1] = 255; surface.setSize(1920, 1080); sound.play(1, baseS); size = 2; px=0; dx=0; dy=0;
        } else click = 0;}
      } else {
      colors[1] = color(#00271f);
     }
      
    if (x>43.3*vw && x<52.71*vw && y>70.42*vh && y<79.5*vh && butt[2] != 255) {
      colors[2] = color(#00634f);
      if (mousePressed == true && mouseButton == LEFT) {                                             //full screen
         click++;                                                                     
         if (click==1){
         for (int i=0; i<5; i++) butt[i] = 0; butt[2] = 255; surface.setSize(displayWidth, displayHeight); sound.play(1, baseS); size = 3; px=0; dx=0; dy=0;
        } else click = 0;}
      } else {
      colors[2] = color(#00271f);
     }
      
    if (x>57.47*vw && x<67.97*vw && y>70.42*vh && y<79.5*vh && butt[3] != 255) {
      colors[3] = color(#00634f);
      if (mousePressed == true && mouseButton == LEFT) {                                             //1280 на 720
         click++;                                                                     
         if (click==1){
         for (int i=0; i<5; i++) butt[i] = 0; butt[3] = 255; surface.setSize(1280, 720); sound.play(1, baseS); size = 4; px=0; dx=0; dy=0;
        } else click = 0;}
    } else {
      colors[3] = color(#00271f);
     }
      
    if (x>70.1*vw && x<80.6*vw && y>70.42*vh && y<79.5*vh && butt[4] != 255) {
      colors[4] = color(#00634f);
      if (mousePressed == true && mouseButton == LEFT) {                                             //1300 на 700
         click++;                                                                     
       if (click==1){
         for (int i=0; i<5; i++) butt[i] = 0; butt[4] = 255; surface.setSize(1300, 700); sound.play(1, baseS); size = 5; px=0; dx=0; dy=0;
        } else click = 0;}
    } else {
      colors[4] = color(#00271f);
    }
  
    if (x>width/5.5-28.5 && x<width/5.5+28.5 && y>height/3.35-28.5 && y<height/3.35+28.5) {
      minus = color(#606060);
      if (mousePressed == true && mouseButton == LEFT) {
          click++;
       if (click==1) {if (baseM>0.0) {
         minus = color(#C6C6C6);
         baseM = round(baseM*10-1)/10.0; music.amp(baseM); sound.play(1, baseS);                        //верхний минус
        } else baseM = 0;}
      } else click = 0;
    } else {
      minus = color(#000000);
      }
    
    if (x>width/1.3-28.5 && x<width/1.3+28.5 && y>height/3.35-28.5 && y<height/3.35+28.5) {
      plus = color(#24bd00);
      if (mousePressed == true && mouseButton == LEFT) {
          click++;                                                                     //верхний плюс
       if (click==1) {if (baseM<1.0) {
         plus = color(#86FFA3);
         baseM = round(baseM*10+1)/10.0; music.amp(baseM); sound.play(1, baseS);
        } else baseM = 1;}
      } else click = 0;
    } else {
      plus = color(#266c00);
    }

    if (x>width/5.5-28.5 && x<width/5.5+28.5 && y>height/1.95-28.5 && y<height/1.95+28.5) {
      minus2 = color(#606060);
      if (mousePressed == true && mouseButton == LEFT) {
          click++;
       if (click==1) {if (baseS>0.0) {
         minus2 = color(#C6C6C6);
         baseS = round(baseS*10-1)/10.0;  sound.play(1, baseS);    //нижний минус.
         sound.amp(baseS); verno.amp(baseS); neverno.amp(baseS);
        } else baseS = 0;}
      } else click = 0;
    } else {
      minus2 = color(#000000);
    }

    if (x>width/1.3-28.5 && x<width/1.3+28.5 && y>height/1.95-28.5 && y<height/1.95+28.5) {
      plus2 = color(#24bd00);
      if (mousePressed == true && mouseButton == LEFT) {
          click++;   
       if (click==1) {if (baseS<1.0) {
         plus2 = color(#86FFA3);
         baseS = round(baseS*10+1)/10.0; sound.play(1, baseS);    //нижний плюс
         sound.amp(baseS); verno.amp(baseS); neverno.amp(baseS);
        } else baseS = 1;}
      } else click = 0;
    } else {
      plus2 = color(#266c00);
    }  
 
    if (x>width-122 && x<width-18 && y>18 && y<122) {
      image(back1, width-18-52, 18+52, 5.47*vw, 5.47*vw);
      if (mousePressed == true && mouseButton == LEFT) {sound.play(1, baseS); stadia=stadia_progress;}      //выход
    } else {
      image(back2, width-18-52, 18+52, 5.47*vw, 5.47*vw);
      }
    }
    
  if (stadia == -4){                                        //ПРАВИЛА
  
    image(fonts[lvl], width/2, height/2, width, height); noStroke(); fill(#000000, 180);
    rect(10*vw, 10*vh, 80*vw, 80*vh, 30);
    image(back2, width-18-52, 18+52, 5.47*vw, 5.47*vw);
    textFont(f64, 3.368*vw); fill(#FFFFFF);
    text("Правила", 50*vw, 18*vh);
    textFont(fPravila, 2.526*vw);
    textAlign(LEFT);
    if (lvl == 0) text("В этой игре Вас ждёт 2 увлекательных уровня. На первом Вам" +
    " предстоит отправиться в небольшое путешествие по пляжу, а на втором Вы" +
    " будете покорять пирамиды Геометрического Египта. На данное путешествие у вас будет всего 3 жизни." +
    " Хорошей игры! Более подробные правила будут доступны в начале каждого уровня.", 15*vw, 25*vh, 72*vw, 80*vh);
    
    if (lvl == 1) text("Вот Вы и на пляже. Всё просто: посчитайте то, что просится в задании," +
    " и найдите нужную цифру на пляже. Заданий на этом уровне всего 5. Пляж двигается с помощью стрелок или клавиш 'A' (влево)" +
    " и 'D' (вправо). Если нажмёте на неправильное число, вы потеряете жизнь. Восстановить можно будет" +
    " только одну и в начале следующего уровня. Жизнь прибавится автоматически. Правильные ответы помогают" +
    " Треугольнику спасти свой мир, хотя он сам об этом не знает.", 15*vw, 25*vh, 72*vw, 80*vh);
    
    if (lvl == 2 && lvl2stadia2 == 1) text("Египет... Треугольник погнался за вами в погоню! Управляйте им, чтобы он не догнал Веру!" +
    " Треугольник двигается с помощью стрелок или клавиш 'A' (влево), 'D' (вправо). Прыгать можно по" +
    " нажатию на стрелку вверх или 'W'. Вам нужно допрыгнуть до любого из порталов, указав Треугольнику неверный путь! Дерзайте!", 15*vw, 25*vh, 72*vw, 80*vh);
    
    if (lvl == 2 && lvl2stadia2 == 2) text("Да-да, решайте математику! Треугольнику она очень нравится! Если вам выпало что-то из разряда" +
    " '2+2?', то вам очень крупно повезло! Ошибка стоит вам жизни, не нажимайте на цифры бездумно." +
    " Чем больше у вас жизней, тем больше вероятность, что азартный Треугольник забудет о Вере. Если у вас не останется жизней,"+
    " Треугольник разочаруется, вспомнит про Веру и догонит её, а вы проиграете! Если же вы успешно решите 3 задания," +
    " Треугольник сам спасёт свой мир, а Вера вернётся домой!", 15*vw, 25*vh, 72*vw, 80*vh);
    
    if (x>width-122 && x<width-18 && y>18 && y<122) {
      image(back1, width-18-52, 18+52, 5.47*vw, 5.47*vw);
      if (mousePressed == true && mouseButton == LEFT) {sound.play(1, baseS); stadia=stadia_progress;}      //выход из правил
    } else {
      image(back2, width-18-52, 18+52, 5.47*vw, 5.47*vw);
    }
    textAlign(CENTER);
  }

                                                        //ПЕРЕХОД
  if (stadia == 0){
    if (stadia_progress < 4) a+=20; else a+=5;
    fill(#FFFFFF, a); noStroke();
    rect(0, 0,  width, height);
    if (s == 0 || s == 0.01) {s=0.01;}
    else s=baseM;
    if (a >= 255) {stadia = stadia_progress; a=255;}
    
  }
  
                                                     //КАТ-СЦЕНА
  if (stadia == 2){
    if (scena == false){
    if (round(s*100) > 1) {s-=0.01; music.amp(s);}
    if (round(s*100) == 1) {s = 0;}
    a-=20; fill(#FFFFFF, a);
    movie.play();
    image(movie, width/2, height/2, width, height);
    rect(0, 0,  width, height);
    if (mousePressed == true && mouseButton == LEFT) {sound.play(1, baseS); stadia_progress++; stadia*=0; a = 0; movie.stop();}
    else if (int(movie.time()) == int(movie.duration())) {stadia_progress++; stadia*=0; a = 0;}
    } else stadia++;
  }
  
  if (stadia == -3 && podlvl2 == 1){  //ПЕРЕХОД НА ЛВЛ 2
    lvl2.play(); if (a < 256){tint(255, a); a+=2;} else {tint(255, 255); a = 255;}
    image(lvl2, width/2, height/2, width, height);
    if (int(lvl2.time()) == int(lvl2.duration())) {stadia*=0; a = 0; lvl=2; stadia_progress = 3;}
  }
  
                                                      
  if (stadia == 3){
      if (lvl == 1){                                    //УРОВЕНЬ 1
      if (s < baseM) {s+=0.01; music.amp(s);}
      //pg.beginDraw();
      
      switch(size) {
        case 1: k = 1; wightlvl1 = 5612; break;
        case 2: k = height/1900.0; wightlvl1 = 5612*k; break; //1920 x 1080 
        case 3: k = height/1900.0; wightlvl1 = 5612*k; break;//фулл
        case 4: k = height/1900.0; wightlvl1 = 5612*k; break; //1280 x 720
        case 5: k = height/1900.0; wightlvl1 = 5612*k; break; //1300 x 700
      }
      image(lvl1, width/2+px, height/2, wightlvl1, height);
      image(shest_smal, 4*vw, 6*vh, 4.5*vw, 4.5*vw);
      
      if (keyPressed) {
      if ((key == 'a' || key == 'A' || key == 'ф' || key == 'Ф' || (key == CODED && keyCode == LEFT)) && px < ((wightlvl1)-width)/2) {
        px+=5;
      } else if ((key == 'd' || key == 'D' || key == 'в' || key == 'В' || (key == CODED && keyCode == RIGHT)) && px > -((wightlvl1)-width)/2) px-=5;
      }
      int r = 3, a2 = 75;
      
      if (podlvl1 < 6) {
      for (int i=0; i<7; i++) {
         first = int(results[i]/10);
         second = results[i]%10;
         noStroke(); 
         
         numbers[first].disableStyle();
         pushMatrix();
         translate(positionX[i]*k+px, positionY[i]*vh);
         rotate(radians(rotates[i]));
         fill(numb[i], a2);
         shape(numbers[first], 0, 0, r*vw, r*vw);
         popMatrix();
         numbers[first].enableStyle();
         
         numbers[second].disableStyle();
         pushMatrix();
         translate(positionX[i]*k+0.7*r*vw+px, positionY[i]*vh);
         rotate(radians(rotates[i]));
         fill(numb[i], a2); shape(numbers[second], 0, 0, r*vw, r*vw);
         popMatrix();
         numbers[second].enableStyle();
      }
      for (int i=0; i<7; i++) {
        if (positionX[i]*k+px-r*vw<x && positionX[i]*k+px+r*vw>x && positionY[i]*vh-r*vw<y && positionY[i]*vh+r*vw>y){
           numb[i] = color(#000000);
      } else {
           numb[i] = color(#FFFFFF);
      }
      }
      tint(255, 100);
      image(lvl1_dek, width/2+px, height/2, wightlvl1, height);
      
      image(shest_smal, 4*vw, 6*vh, 4.5*vw, 4.5*vw);
      fill(#ffffff); rect(25*vw, 7*vh, 50*vw, 12*vh, 15);
      textFont(f48, 2.53*vw); fill(#000000);
      switch (podlvl1){
        case 1: text(podlvl1 + ". Cколько будет " + (sqrt-sqrt2) + "+" + sqrt2 + "?", 50*vw, 15*vh); break;
        case 2: if (sqrt2-sqrt < 0) text(podlvl1 + ". Cколько будет " + sqrt2 + " - (" + (sqrt2-sqrt) + ")?", 50*vw, 15*vh);
          else text(podlvl1 + ". Cколько будет " + sqrt2 + "-" + (sqrt2-sqrt) + "?", 50*vw, 15*vh); break;
        case 3: text(podlvl1 + ". Cколько будет " + (sqrt*sqrt2) + ":" + sqrt2 + "?", 50*vw, 15*vh); break;
        case 4: text(podlvl1 + ". Корень из " + sqrt*sqrt + "?", 50*vw, 15*vh); break;
        case 5: text(podlvl1 + ". Чему равен Х? " + (sqrt2-13) +"x" + " + " +"13x" + " = " + (sqrt*sqrt2), 50*vw, 15*vh); break;
      }
      
      
      } else { //закрывается podlvl1
        stadia = -3; a = 0; if (live < 3) live++;
      }
      tint(255, 255);
      noStroke();
      if (a>0) {a-=20; fill(#ffffff, a);  
      rect(0, 0,  width, height);} else {a = 0; liveChange = color(#FFFFFF);}
     } //уровень 1 закончился
     
     
     if (lvl == 2){                                                //УРОВЕНЬ 2
       noStroke(); tint(255, 255);
       if (podlvl2 < 4){
       wk = width/1900.0; hk = height/1100.0;
     
       if (lvl2stadia2 == 1){
         image(egupt, width+dx, height/8+dy, 2*width, 2*height);
         image(shest_smal, 4*vw, 6*vh, 4.5*vw, 4.5*vw);
         for (int i=0; i<countBlocks; i++){
            block[i].display(dx, dy, wk, hk);
         }
         for (int i=0; i<5; i++){
           image(portalSvet, portalSet[i][0]*wk+dx, portalSet[i][1]*hk+dy, 7.5*vw, 22.5*vh);
           image(portal, portalSet[i][0]*wk+dx, portalSet[i][1]*hk+dy, 7.5*vw, 22.5*vh);
         }
         
         hum.update();
       }
       
       if (lvl2stadia2 == 2) {
         image(fonts[lvl], width/2, height/2, width, height);
         image(shest_smal, 4*vw, 6*vh, 4.5*vw, 4.5*vw); image(home, 96*vw, 94*vh, 4.5*vw, 4.5*vw); image(help_smal, 4*vw, 94*vh, 4.5*vw, 4.5*vw);
         fill(#000000, 180); noStroke(); rect(10*vw, 13*vh, 80*vw, 80*vh, 30);
         textFont(f48, 2.53*vw); fill(#FFFFFF);
         switch (randlvl2){//Код выполнен Добровольской Надеждой Анатольевной, МИМИ-122
            case 1: text("Cколько будет " + b0 + " + " + b0 + "?", 50*vw, 25*vh); break;
            case 2: text("Решите уравнение  " + a1 + "x² - " + b1 + "x + " + c1, 50*vw, 25*vh); break;
            case 3: text("Решите уравнение  lg(2x - " + a3 + ") + lg5 = lg(x + " + c3 + ")", 50*vw, 25*vh); break;
            case 4: if (b4 > 0) text("Вычислите производную при х = " + x4 + ".  x³ - " + a4 + "x² + " + b4, 50*vw, 25*vh);
            else text("Вычислите производную при х = " + x4 + ".    x³ - " + a4 + "x² - " + -b4, 50*vw, 25*vh); break;
            case 5: if (b5 > 0) text("Вычислите:   " + a5 + "*arcsin(30) + " + b5 + "*arccos(60)", 50*vw, 25*vh);
            else text("Вычислите: " + a5 + "arcsin(30) - " + -b5 + "arccos(60)", 50*vw, 25*vh); break;
          }
         textFont(fLvl2, 6.74*vw);
         for (int i=0; i<10; i++){
          if (i<5) {fill(otvets[i]); text(randOtv[i], (21+15*i)*vw, 45*vh);}
           else {fill(otvets[i]); text(randOtv[i], (21+15*(i-5))*vw, 65*vh);}
         }
         textFont(f48, 2.53*vw); fill(#FFFFFF); text("*Нажмите на верный, по-вашему мнению, результат", 50*vw, 80*vh);
         
         for (int i=0; i<10; i++){
           if ((i<5 && x>(21+15*i)*vw-64 && x<(21+15*i)*vw+64 && y>45*vh-128 && y<45*vh) ||
           (i>=5 && x>(21+15*(i-5))*vw-64 && x<(21+15*(i-5))*vw+64 && y>65*vh-128 && y<65*vh)) {
              otvets[i] = color(#5aceff);
            } else {
              otvets[i] = color(#FFFFFF);
          }
         }
        }//Подстадия
       } if (podlvl2 == 4) {stadia_progress++; stadia*=0; a = 0;} //подлвл
     }//лвл2
    
                                                            //ОБЩЕЕ ВСЕХ LVL
    switch(live){
      case 1:
      heart.disableStyle();
      fill(#00c948); stroke(#000000); strokeWeight(50); shape(heart, 97*vw, 5*vh, 3.5*vw, 3.5*vw);
      fill(#000000); stroke(#00c948); shape(heart, 92*vw, 5*vh, 3.5*vw, 3.5*vw); shape(heart, 87*vw, 5*vh, 3.5*vw, 3.5*vw);
      heart.enableStyle(); break;
     case 2:
       heart.disableStyle();
      fill(#00c948); stroke(#000000); strokeWeight(50); shape(heart, 97*vw, 5*vh, 3.5*vw, 3.5*vw); shape(heart, 92*vw, 5*vh, 3.5*vw, 3.5*vw);
      fill(#000000); stroke(#00c948); shape(heart, 87*vw, 5*vh, 3.5*vw, 3.5*vw);
      heart.enableStyle(); break;
     case 3:
       heart.disableStyle();
      fill(#00c948); stroke(#000000); strokeWeight(50); shape(heart, 97*vw, 5*vh, 3.5*vw, 3.5*vw);
      shape(heart, 92*vw, 5*vh, 3.5*vw, 3.5*vw); shape(heart, 87*vw, 5*vh, 3.5*vw, 3.5*vw);
      heart.enableStyle(); break;
     default:
       shape(heart, 97*vw, 5*vh, 3.5*vw, 3.5*vw); shape(heart, 92*vw, 5*vh, 3.5*vw, 3.5*vw);
       shape(heart, 87*vw, 5*vh, 3.5*vw, 3.5*vw); stadia=-2; a = 0; break;
     }
     if (a>0) {stroke(liveChange); fill(liveChange, a); rect(0,0, width, height); a-=10;}
     
     if (x>1.75*vw && x<6.25*vw && y>3.75*vh && y<8.25*vh) {
        image(shest_smal, 4*vw, 6*vh, 4.5*vw, 4.5*vw);         //настройки
      } else {
        noStroke(); fill(#FFFFFF, 100); circle(4*vw, 6*vh, 4.5*vw);
      }
      
      if (x>93.75*vw && x<98.25*vw && y>90.25*vh && y<95.25*vh) {
        image(home, 96*vw, 94*vh, 4.5*vw, 4.5*vw);
      } else {
      noStroke(); fill(#FFFFFF, 30); circle(96*vw, 94*vh, 4.5*vw);                                 //домой
      }
    
      if (x>2.25*vw && x<7.25*vw && y>90.25*vh && y<95.25*vh) {
        image(help_smal, 4*vw, 94*vh, 4.5*vw, 4.5*vw);
        if (mousePressed == true && mouseButton == LEFT) {image(help_smal2, 4*vw, 94*vh, 4.5*vw, 4.5*vw); 
      sound.play(1, baseS); stadia_progress = stadia; stadia=-4;}
      } else {
        noStroke(); fill(#FFFFFF, 30); circle(4*vw, 94*vh, 4.5*vw);                                               //в правила
      }
   }//стадия 3
  
  if (stadia == -2){                                          //ПРОИГРЫШ
  
    music.pause(); if (a < 256){tint(255, a); a+=2;} luzer.play();
    if (int(luzer.time()) < int(luzer.duration())) {image(luzer, width/2, height/2, width, height);}
    else {
      textFont(f48, 2.53*vw); fill(#ffffff); text("Нажмите мышкой, чтобы начать сначала", 50*vw, 85*vh);
      if (mousePressed == true) {music.loop(1, 0.0); s=0; stadia = 1; stadia_progress = 1; lvl = 0; live = 3; podlvl1 = 1; lvl2stadia2 = 1; podlvl2 = 1; tint(255, 255);}}
  }
  
  if (stadia == 4){
    music.pause(); win.play();
    a-=20; fill(#FFFFFF, a);
    image(win, width/2, height/2, width, height);
    rect(0, 0,  width, height);
    if (int(win.time()) == int(win.duration())) noLoop();
  }
}

void movieEvent(Movie movie) {
  movie.read();
}

void movieEvent2(Movie luzer) {
  luzer.read();
}

void movieEvent3(Movie win) {
  win.read();
}

void movieEvent4(Movie lvl2) {
  lvl2.read();
}

void mouseClicked(){
  verno = new SoundFile(this, "verno.wav"); neverno = new SoundFile(this, "neverno.wav");
  float vh = height/100, vw = width/100;
  int x = mouseX; int y = mouseY;
  if (stadia == 3){
  if (podlvl1 < 6 && mouseButton == LEFT && lvl == 1){
    for (int i=0; i<7; i++) {
        if (positionX[i]*k+px-r*vw<x && positionX[i]*k+px+r*vw>x && positionY[i]*vh-r*vw<y && positionY[i]*vh+r*vw>y){
           if (i==0) {
             verno.play(1, baseS);
              numb[i] = color(#2EFF60); podlvl1++; if (podlvl1 < 6) {sqrt = int(random(11, 99)); results[0] = sqrt;
              switch (podlvl1){
                case 1: sqrt2 = int(random(5, sqrt)); break;
                case 2: sqrt2 = int(random(21, 1000)); break;
                case 3: sqrt2 = int(random(5, 101)); break;
                case 4: sqrt2 = 0; break;
                case 5: sqrt2 = int(random(21, 1000)); break;
              }
               positionX[0] = int(random(-1700, 3600)); positionY[0] = int(random(20, 90)); rotates[0] = int(random(-30, 30));
              for (int d=1; d<7; d++) {results[d] = int(random(11, 99)); if (results[d] == results[0]) results[d]--;
              positionX[d] = int(random(-1700, 3600)); positionY[d] = int(random(10, 90));
              rotates[d] = int(random(-30, 30)); numb[d] = color(#FFFFFF); liveChange = color(#00FF00); a = 255;}
              }} else {
           neverno.play(1, baseS); numb[i] = color(#FF0000); live--; liveChange = color(#FF0000); a = 255;}
        }
      }
    }
    if (mouseButton == LEFT && x>93.75*vw && x<98.25*vw && y>90.25*vh && y<95.25*vh){
      image(home2, 96*vw, 94*vh, 4.5*vw, 4.5*vw);
      sound.play(1, baseS); stadia_progress = 1; stadia=0; lvl--;
    }
    if (mouseButton == LEFT && x>1.75*vw && x<6.25*vw && y>3.75*vh && y<8.25*vh){
      image(shest_smal2, 4*vw, 6*vh, 4.5*vw, 4.5*vw);
      sound.play(1, baseS); stadia_progress = stadia; stadia=-1;
    }
    
    if (lvl2stadia2 == 2 && lvl == 2){
      for (int i=0; i<10; i++){
           if ((((i<4) || (i==5)) && x>(21+15*i)*vw-64 && x<(21+15*i)*vw+64 && y>45*vh-128 && y<45*vh && mouseButton == LEFT) ||
           (i>5 && x>(21+15*(i-5))*vw-64 && x<(21+15*(i-5))*vw+64 && y>65*vh-128 && y<65*vh && mouseButton == LEFT)) {
              otvets[i] = color(#FF0000); live--; a=255; neverno.play(1, baseS); liveChange = color(#FF0000);
            } else if (i==4 && x>(21+15*i)*vw-64 && x<(21+15*i)*vw+64 && y>45*vh-128 && y<45*vh && mouseButton == LEFT) {
              otvets[i] = color(#00FF00); podlvl2++; lvl2stadia2 = 1; a=255; verno.play(1, baseS); liveChange = color(#00FF00); 

              if (podlvl2 == 2){
              blocksSet[0][0] = int(random(1800, 2300)); blocksSet[0][1] = int(random(820, 830)); blocksSet[0][2] = int(random(20, 55));
              for (int i2=1; i2<countBlocks; i2++){
                if (i2%5 == 0) blocksSet[i2][0] = int(random(700, 900)); else if (i2%5 == 1) blocksSet[i2][0] = int(random(1300, 1800));
                else if (i2%5 == 2) blocksSet[i2][0] = int(random(900, 1300)); else if (i2%5 == 3) blocksSet[i2][0] = int(random(1300, 1800));
                else if (i2%5 == 4) blocksSet[i2][0] = int(random(600, 800));
                blocksSet[i2][1] = int(random(820-i2*230, 830-i2*230)); //x от 0 до 3300 (нормал: 0 до 3800) и y от -850 до 850 (нормал -1100 до 1100)
                blocksSet[i2][2] = int(random(20, 55)); //wx
              }
              }
              
              if (podlvl2 == 3){
              blocksSet[0][0] = int(random(800, 1300)); blocksSet[0][1] = int(random(820, 830)); blocksSet[0][2] = int(random(20, 55));
              for (int i2=1; i2<countBlocks; i2++){
                if (i2%5 == 0) blocksSet[i2][0] = int(random(300, 800)); else if (i2%5 == 1) blocksSet[i2][0] = int(random(1300, 1800));
                else if (i2%5 == 2) blocksSet[i2][0] = int(random(1800, 2300)); else if (i2%5 == 3) blocksSet[i2][0] = int(random(1100, 1600));
                else if (i2%5 == 4) blocksSet[i2][0] = int(random(800, 1300));
                blocksSet[i2][1] = int(random(820-i2*230, 830-i2*230));
                blocksSet[i2][2] = int(random(20, 55)); //wx
              }
              }
               for (int i2=0; i2<countBlocks; i2++){
                block[i2] = new blocks(blocksSet[i2][0], blocksSet[i2][1], blocksSet[i2][2]);
              }
              
              for (int i2=0; i2<5; i2++){
                portalK = random(1.2, 6);
                portalSet[i2][0] = blocksSet[i2+3][0]+blocksSet[i2+3][2]*19/portalK; portalSet[i2][1] = blocksSet[i2+3][1]-8*11; //x + wx формула (ответ в px), а y просто над платформой
              }
              
              for (int i2=0; i2<10; i2++){
                otvets[i2] = color(#FFFFFF);
              }
              
              hum = new human(12, 92); randlvl2 = int(random(1, 6));
              b0 = int(random(2, 11));
              zadania[0] = b0+b0;
              b1 = int(random(8, 41)); if (b1 == 0) b1 = 24; if (b1%8 != 0) b1 -= b1%8;
              a1 = 2; c1 = (b1*b1)/4*a1;
              zadania[1] = b1/4; //b1 со знаком - в уравнении;
              zadania[2] = int(random(2, 41));
              a3 = int(random(1, 2*zadania[2])); c3 = 9*zadania[2]-5*a3;
              x4 = int(random(-5, 6)); a4 = int(random(2, 5)); b4 = int(random(-100, 101)); if (b4 == 0) b4 = 666;
              zadania[3] = 3*x4*x4 - a4*2*x4;
              a5 = int(random(-20, 21)); b5 = int(random(-20, 21)); if (a5 == 0) a5 = 6; if (b5 == 0) b5 = 8; if (a5%2 != 0) a5++; if (b5%2 != 0) b5--; 
              zadania[4] = a5/2+b5/2;
              
              switch (randlvl2){
                case 1: for (int i2=0; i2<10; i2++) {randOtv[i2] = int(random(4, 21)); if (randOtv[i2] == zadania[0]) randOtv[i2]++;} randOtv[4] = zadania[0]; break;
                case 2: for (int i2=0; i2<10; i2++) {randOtv[i2] = int(random(-41, 41)); if (randOtv[i2] == zadania[0]) randOtv[i2]--;} randOtv[4] = zadania[1]; break;
                case 3: for (int i2=0; i2<10; i2++) {randOtv[i2] = int(random(2, 41)); if (randOtv[i2] == zadania[0]) randOtv[i2]++;} randOtv[4] = zadania[2]; break;
                case 4: for (int i2=0; i2<10; i2++) {randOtv[i2] = int(random(-25, 131)); if (randOtv[i2] == zadania[0]) randOtv[i]--;} randOtv[4] = zadania[3]; break;
                case 5: for (int i2=0; i2<10; i2++) {randOtv[i2] = int(random(-40, 40)); if (randOtv[i2] == zadania[0]) randOtv[i2]--;} randOtv[4] = zadania[4]; break;
              }
            }
         }
      }
    }
}


void keyPressed(){
  if (stadia == 3 && lvl == 2 && lvl2stadia2 == 1){
    if (keyCode == RIGHT || key == 'd' || key == 'D' || key == 'в' || key == 'В') right = true;
    if (keyCode == LEFT || key == 'a' || key == 'A' || key == 'ф' || key == 'Ф') left = true;
    up = keyCode == UP || key == 'w' || key == 'W' || key == 'ц' || key == 'Ц';
  }
}
void keyReleased(){
  if (stadia == 3 && lvl == 2 && lvl2stadia2 == 1){
  right = false; left = false; up = false;
  }
}
