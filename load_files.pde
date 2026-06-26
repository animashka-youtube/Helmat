import processing.video.*;
import processing.sound.*;
import processing.svg.*;
import gifAnimation.*;

PImage img, Helmat, play1, play2, sett, help, help2, help_smal, home, home2, help_smal2, portalSvet;
PImage back1, back2, shest, shest2, shest_smal, shest_smal2, lvl1, lvl1_dek, egupt;

PShape heart, one, two, three, four, fife, six, seven, eight, nine, zero;
color plus, plus2, minus, minus2, liveChange;

int stadia, a, baze_st, click, flag, stadia_progress, live, lvl, sqrt, sqrt2, size, px;
int first, second, podlvl1, r = 3, a2 = 75, dx, dy, h = 10, lvl2A, countBlocks = 9, podlvl2, lvl2stadia2;

int b0, a1, b1, c1, a3, b3, c3, x4, a4, b4, a5, b5, randlvl2; int[] zadania = new int[5]; int[] randOtv = new int[10];

float s, baseM, baseS, k, wightlvl1, yVel, wk, hk, portalK;

PFont f48, f30, f64, fLvl2, fPravila;

boolean scena = false, left = false, right = false, up = false, isJump = false, fall = false;
int[] butt = new int[5]; int[] results = new int[7]; int[] positionX = new int[7]; 
int[] positionY = new int[7]; int[] rotates = new int[7];
int[][] blocksSet = new int[countBlocks][3]; float[][] portalSet = new float[5][2];
PShape[] numbers = new PShape[10];
PImage[] fonts = new PImage[3]; PImage[] pers = new PImage[4];
color[] colors = new color[5]; color[] numb = new color[7]; color[] otvets = new color[10];



Gif portal;
Movie movie, luzer, win, lvl2;
SoundFile music, sound, verno, neverno;

blocks[] block = new blocks[countBlocks];
human hum;
