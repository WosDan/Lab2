import controlP5.*;
import java.lang.Math;

ControlP5 cp5;
Juego3 BookCipherGame;

void input(String inpt) {
  BookCipherGame.input(inpt);
}

void mouseClicked() {
  BookCipherGame.mouseClicked();
}

int stScreen = 0;
int PhishHunter = 1;
int FirewallMatrix = 2;

Frame frame;
Grid menuGrid;
ImpostorGrid grid;
Grid grid2;
ScoreManager score;
Time time;

int screen;
int xSize;
int ySize;
int now;
int selected = 0;

PFont amongUsFont;
int ids[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11};
String[] names = {
  "Uninorte",
  "Unisur",
  "Amazon",
  "Armazon",
  "Nequi",
  "Ñequi",
  "Github",
  "GidJuV",
  "OpenAI",
  "ChatGePeTe",
  "WindowsUpdate",
  "Actualizador.exe"
};
boolean impostors[] = {false, true, false, true, false, true, false, true, false, true, false, true};
String[] texts = {"Actualización importante de servicios académicos",
  "Notificación sobre tu matrícula pendiente",
  "Confirmación de compra realizada en tu cuenta",
  "Alerta: actividad sospechosa en tu pedido reciente",
  "Tu transferencia ha sido procesada correctamente",
  "Advertencia: movimiento no autorizado detectado",
  "Invitación a colaborar en un nuevo repositorio",
  "Error crítico: repositorio corrupto necesita verificación",
  "Nuevo anuncio sobre mejoras en nuestros modelos de IA",
  "Tu cuenta presenta actividad no reconocida, verifícala",
  "Disponibles nuevas actualizaciones de seguridad del sistema",
  "Se requiere instalación urgente para evitar fallos del equipo"
};

Impostor imp1;

PImage stIcons[] = new PImage[6];
PImage Icons[] = new PImage[12];
PImage IconsHover[] = new PImage[12];
PImage Icons2[] = new PImage[7];
PImage FondoM;
PImage Fondo;

void settings() {
  // size(1024, 576);
  // size(1920, 1080);
  size(1280, 720);
  xSize = width;
  ySize = height;
}

void setup() {
  cp5 = new ControlP5(this);

  BookCipherGame = new Juego3();

  FondoM = loadImage("./src/img/fondo_principal.png");
  Fondo = loadImage("./src/img/who_is_the_impostor.png");
  stIcons[0] = loadImage("./src/img/logo1.png");
  stIcons[1] = loadImage("./src/img/cuadrito_feliz_boton.png");
  stIcons[2] = loadImage("./src/img/book.png");
  stIcons[3] = loadImage("./src/img/resortera.png");

  Icons[0]  = loadImage("./src/img/among_us_blue.png");
  Icons[1]  = loadImage("./src/img/among_us_brown_grey.png");
  Icons[2]  = loadImage("./src/img/among_us_brunnete.png");
  Icons[3]  = loadImage("./src/img/among_us_dark_green.png");
  Icons[4]  = loadImage("./src/img/among_us_green.png");
  Icons[5]  = loadImage("./src/img/among_us_grey.png");
  Icons[6]  = loadImage("./src/img/among_us_light_blue.png");
  Icons[7]  = loadImage("./src/img/among_us_light_grey.png");
  Icons[8]  = loadImage("./src/img/among_us_orange.png");
  Icons[9]  = loadImage("./src/img/among_us_pink.png");
  Icons[10] = loadImage("./src/img/among_us_purple.png");
  //Icons[12] = loadImage("./src/img/among_us_red.png");
  Icons[11] = loadImage("./src/img/among_us_terracota.png");

  IconsHover[0]  = loadImage("./src/img/among_us_blue_hover.png");
  IconsHover[1]  = loadImage("./src/img/among_us_brown_grey_hover.png");
  IconsHover[2]  = loadImage("./src/img/among_us_brunnete_hover.png");
  IconsHover[3]  = loadImage("./src/img/among_us_dark_green_hover.png");
  IconsHover[4]  = loadImage("./src/img/among_us_green_hover.png");
  IconsHover[5]  = loadImage("./src/img/among_us_grey_hover.png");
  IconsHover[6]  = loadImage("./src/img/among_us_light_blue_hover.png");
  IconsHover[7]  = loadImage("./src/img/among_us_light_grey_hover.png");
  IconsHover[8]  = loadImage("./src/img/among_us_orange_hover.png");
  IconsHover[9]  = loadImage("./src/img/among_us_pink_hover.png");
  IconsHover[10] = loadImage("./src/img/among_us_purple_hover.png");
  //IconsHover[12] = loadImage("./src/img/among_us_red_hover.png");
  IconsHover[11] = loadImage("./src/img/among_us_terracota_hover.png");


  Icons2[0] = loadImage("./src/img/cuadrito_feliz.png");
  Icons2[1] = loadImage("./src/img/cuadrito_serio.png");
  Icons2[2] = loadImage("./src/img/cuadrito_enojado.png");
  screen = 3;
  //screen = 2;
  menuGrid = new Grid(1, 4, width * 0.27, height * 0.5, width*0.1, width*0.1, stIcons, width*0.01);
  //grid = new Grid(4, 3, width*0.15, height * 0.28, width * 0.22, height*0.11, Icons, width*0.01, IconsHover, ids, names);
  grid = new ImpostorGrid(3, 12, width*0.22, height * 0.11, width * 0.145, height*0.28, Icons, IconsHover, names, texts, ids, impostors);
  grid2 = new Grid(5, 5, width*0.3, height * 0.2, width*.08, Icons2);
  score = new ScoreManager("Daniel");
  time = new Time();
  amongUsFont = createFont("ArialMTPro-Regular", 16);
}

void draw() {
  now = millis();
  switch(screen) {
  case 0:
    grid2.reset(time.getMillis());
    score.resetPoints();
    time.reset();
    screen = 1;
    image(FondoM, 0, 0, width, height);
    menuGrid.display();

    //image(stIcons[0], width *0.185, height * 0.35, width *0.15, width*0.15);
    //image(stIcons[1], width *0.335 + width*0.01, height * 0.35, width *0.15, width*0.15);
    //image(stIcons[0], width *0.485 + width*0.02, height * 0.35, width *0.15, width*0.15);
    //image(stIcons[0], width *0.635 + width*0.03, height * 0.35, width *0.15, width*0.15);

    menuGrid.mouseHover();
    screen = menuGrid.button();
    break;
  case 1:
    image(Fondo, 0, 0, width, height);
    grid.display();
    grid.displayDialog();
    if (!grid.activeDialog) {
      grid.mouseHover();
    }
    grid.finishGame();
    break;
  case 2:
    background(120);
    grid2.display();
    if (time.getSeconds() <= 30 && grid2.isRed() == false) {
      score.display(50, 50, time.getSeconds());
      grid2.change(300, time.getMillis(), 1);
      grid2.mouseCollision(score);
      grid2.mouseHover();
      grid2.stateHandle(1500, time.getMillis(), 1);
      time.setFinalTime(time.getSeconds());
    } else {
      screen = score.displayEnd2(width*0.2, height*0.6, time, grid2);
    }
    break;
  case 3:
    BookCipherGame.draw();
    break;
  case 4:
    break;
  }
}
