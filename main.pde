int stScreen = 0;
int PhishHunter = 1;
int FirewallMatrix = 2;

Frame frame;
Grid menuGrid;
Grid grid2;
ScoreManager score;
Time time;

int screen;
int xSize;
int ySize;

PImage stIcons[] = new PImage[6];
PImage Icons2[] = new PImage[7];

void settings(){
  //size(1024, 576);
  //size(1920, 1080);
  size(1536, 864);
  xSize = width;
  ySize = height; 
}

void setup() {
  stIcons[0] = loadImage("./src/img/lock.png");
  stIcons[1] = loadImage("./src/img/cuadrito_feliz_boton.png");
  stIcons[2] = stIcons[0];
  stIcons[3] = stIcons[0];
  Icons2[0] = loadImage("./src/img/cuadrito_feliz.png");
  Icons2[1] = loadImage("./src/img/cuadrito_serio.png");
  Icons2[2] = loadImage("./src/img/cuadrito_enojado.png");
  screen = stScreen;
  //screen = 2;
  menuGrid = new Grid(1, 4, width * 0.185, height * 0.35, width*0.15, stIcons, width*0.01);
  grid2 = new Grid(5, 5, width*0.3, height * 0.2, width*.08, 
  Icons2);
  score = new ScoreManager("Daniel");
  time = new Time();
}

void draw() {
  switch(screen) {
  case 0:
    menuGrid.display();
    
    //image(stIcons[0], width *0.185, height * 0.35, width *0.15, width*0.15);
    //image(stIcons[1], width *0.335 + width*0.01, height * 0.35, width *0.15, width*0.15);
    //image(stIcons[0], width *0.485 + width*0.02, height * 0.35, width *0.15, width*0.15);
    //image(stIcons[0], width *0.635 + width*0.03, height * 0.35, width *0.15, width*0.15);
    
    menuGrid.mouseHover();
    screen = menuGrid.button();
    
    break;
  case 1:
    break;
  case 2:
    background(120);
    grid2.display();
    if(time.getSeconds() <= 50){
      score.display(50, 50, time.getSeconds());
      grid2.change(300);  
      grid2.mouseCollision(score);
      grid2.mouseHover();
      grid2.stateHandle(1500);
      time.setFinalTime(time.getSeconds());
    }
    score.display(50, 50, time.getFinalTime());
  }
}
