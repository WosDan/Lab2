import controlP5.*;
import java.lang.Math;

boolean wasPressed = false;
boolean justReleased = false;
boolean mouseWasPressed = false;
boolean mouseJustReleased = false;
boolean enterWasPressed = false;
boolean enterJustReleased = false;

ControlP5 cp5;
Textfield inputName;
Juego3 BookCipherGame;
DefenderWare dw;

void name(String inptName) {
  currentUser = inptName;
}

void input(String inpt) {
  BookCipherGame.input(inpt);
}

void mouseClicked() {
  BookCipherGame.mouseClicked();
  dw.mouseClicked();
}

void mousePressed() {
  dw.mousePressed();
}

void mouseDragged() {
  dw.mouseDragged();
}

void mouseReleased() {
  dw.mouseReleased();
}

int stScreen = 0;
int PhishHunter = 1;
int FirewallMatrix = 2;
boolean resetInput = false;

Frame frame;
Grid menuGrid;
ImpostorGrid grid;
Grid grid2;
ScoreManager score2;
Time time;
Ranking ranking;

int screen;
int xSize;
int ySize;
int now;
int selected = 0;
int among_us_screen = 0;
String currentUser;

PFont amongUsFont;

int ids[] = {
  0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
  10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
  20, 21, 22, 23, 24, 25, 26, 27, 28, 29
};

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
  "Actualizador.exe",
  "BancoEstelar",
  "PayFriend",
  "MicrosofUpdate",
  "SeguridadDigital",
  "CorreoInstitucional",
  "SoporteTecnicoGlobal",
  "UniversidadVirtual",
  "EstudioOnline",
  "MegaStore",
  "SuperCompras",
  "FinanzasYA",
  "DineroExpress",
  "CodeHub",
  "RepoFail",
  "IAResearch",
  "BotConversacional",
  "SystemPatch",
  "DriverFixer"
};

boolean impostors[] = {
  false, true, false, true, false, true,
  false, true, false, true, false, true,
  false, true, true, true, true, true,
  false, true, true, true, false, true,
  true, true, false, true, true, true
};

String[] texts = {
  "Actualización importante de servicios académicos en Uninorte: ingresa al portal oficial para confirmar tu matrícula y evitar inconvenientes en el inicio de clases.",
  "Notificación sobre tu matrícula pendiente en Unisur: si no completas el proceso hoy mismo, perderás tu cupo en las asignaturas seleccionadas.",
  "Confirmación de compra realizada en Amazon: tu pedido ha sido registrado exitosamente y será enviado en las próximas 48 horas con seguimiento disponible.",
  "Alerta: actividad sospechosa en tu pedido de Armazon. Ingresa al enlace proporcionado para verificar tu cuenta y evitar bloqueos.",
  "Tu transferencia en Nequi ha sido procesada correctamente. El monto ya está disponible en la cuenta destino y puedes consultarlo en tu historial.",
  "Advertencia: movimiento no autorizado detectado en Ñequi. Ingresa tus datos personales para desbloquear tu cuenta y recuperar acceso.",
  "Invitación a colaborar en un nuevo repositorio de Github. Únete al proyecto compartido y revisa las instrucciones iniciales para contribuir.",
  "Error crítico en tu repositorio de GidJuV: descarga la herramienta adjunta para reparar los archivos corruptos y recuperar tu trabajo.",
  "Nuevo anuncio de OpenAI: descubre las últimas mejoras en nuestros modelos de inteligencia artificial y cómo aplicarlas en tus proyectos.",
  "Tu cuenta de ChatGePeTe presenta actividad no reconocida. Ingresa al enlace de verificación para confirmar tu identidad y evitar bloqueos.",
  "Disponibles nuevas actualizaciones de seguridad en WindowsUpdate. Instálalas de inmediato para mantener tu equipo protegido contra vulnerabilidades recientes.",
  "Se requiere instalación urgente de Actualizador.exe para evitar fallos graves en tu sistema operativo. Haz clic aquí para iniciar el proceso.",
  "Mensaje oficial de BancoEstelar: hemos detectado intentos de acceso desde dispositivos no registrados. Ingresa al enlace seguro para confirmar tu identidad.",
  "Recordatorio de PayFriend: tu suscripción anual está próxima a vencer. Renueva ahora para seguir disfrutando de todos los beneficios sin interrupciones.",
  "Aviso de MicrosofUpdate: se han liberado parches críticos que corrigen vulnerabilidades graves. La instalación es obligatoria para continuar usando el sistema.",
  "Sistema de SeguridadDigital: tu contraseña expira en 3 días. Actualízala cuanto antes para mantener el acceso sin inconvenientes.",
  "CorreoInstitucional: se ha publicado un nuevo reglamento académico que entrará en vigor el próximo semestre. Consulta el documento completo en la plataforma.",
  "SoporteTecnicoGlobal: hemos identificado errores en tu configuración de red. Descarga la herramienta de diagnóstico para solucionarlos inmediatamente.",
  "UniversidadVirtual: tu acceso a las clases en línea ha sido renovado. Ingresa al campus digital para revisar los nuevos contenidos disponibles.",
  "EstudioOnline: tu examen programado está listo. Ingresa al sistema para confirmar tu asistencia y revisar las instrucciones detalladas.",
  "MegaStore: tu compra ha sido confirmada y será enviada en un plazo máximo de 72 horas. Revisa tu correo para el número de seguimiento.",
  "SuperCompras: detectamos actividad sospechosa en tu cuenta. Ingresa al enlace de verificación para confirmar tus datos personales.",
  "FinanzasYA: tu inversión ha sido registrada exitosamente. Consulta el portal para revisar el estado de tus movimientos financieros.",
  "DineroExpress: hemos bloqueado temporalmente tu cuenta por actividad no reconocida. Ingresa tus credenciales para recuperar acceso.",
  "CodeHub: se ha creado un nuevo repositorio colaborativo. Únete al proyecto y revisa las guías iniciales para contribuir.",
  "RepoFail: error crítico detectado en tu repositorio. Descarga la herramienta adjunta para reparar los archivos dañados.",
  "IAResearch: nuevas publicaciones sobre avances en inteligencia artificial están disponibles. Ingresa al portal para leer los artículos completos.",
  "BotConversacional: tu cuenta presenta actividad no reconocida. Ingresa al enlace de verificación para confirmar tu identidad.",
  "SystemPatch: nuevas actualizaciones de seguridad están disponibles. Instálalas de inmediato para mantener tu equipo protegido.",
  "DriverFixer: se requiere instalación urgente de controladores para evitar fallos graves en tu sistema. Haz clic aquí para iniciar el proceso."
};


Impostor imp1;

PImage stIcons[] = new PImage[6];
PImage Icons[] = new PImage[12];
PImage IconsHover[] = new PImage[12];
PImage Icons2[] = new PImage[7];
PImage amongusitos[] = new PImage[12];
PImage endScreens2[] = new PImage[2];
PImage FondoM;
PImage Fondo;
PImage Fondo2;
PImage FondoRanking;
PImage Fondo_Among;
EjectionAnimation test;
EjectionAnimation EjectionBackgrounds[] = new EjectionAnimation[5];

void settings() {
  // size(1024, 576);
  //size(1920, 1080);
  size(1280, 720);
  xSize = width;
  ySize = height;
  smooth(8);
}

void setup() {
  dw = new DefenderWare();
  cp5 = new ControlP5(this);
  BookCipherGame = new Juego3();
  ranking = new Ranking("src/files/ranking.csv");
  //EjectionBackgrounds[0] = new EjectionAnimation(loadImage("./src/img/ejection_skeld.png"));
  endScreens2[0] = loadImage("./src/img/protegiste_la_red.png");
  endScreens2[1] = loadImage("./src/img/comprometiste_la_red.png");

  FondoM = loadImage("./src/img/fondo_principal.png");
  Fondo = loadImage("./src/img/who_is_the_impostor.png");
  Fondo2 = loadImage("./src/img/fondo2.png");
  FondoRanking = loadImage("./src/img/ranking.png");
  Fondo_Among = loadImage("./src/img/among_us_start_screen.png");
  stIcons[0] = loadImage("./src/img/logo1.png");
  stIcons[1] = loadImage("./src/img/cuadrito_feliz_boton.png");
  stIcons[2] = loadImage("./src/img/book.png");
  stIcons[3] = loadImage("./src/img/resortera.png");

  for (int i = 0; i < amongusitos.length; i++) {
    amongusitos[i] = loadImage("./src/img/amongusito_" + (i+1) + ".png");
  }

  Icons[0]  = loadImage("./src/img/among_us_light_pink.png");
  Icons[1]  = loadImage("./src/img/among_us_brown.png");
  Icons[2]  = loadImage("./src/img/among_us_brunnete.png");
  Icons[3]  = loadImage("./src/img/among_us_yellow.png");
  Icons[4]  = loadImage("./src/img/among_us_green.png");
  Icons[5]  = loadImage("./src/img/among_us_grey.png");
  Icons[6]  = loadImage("./src/img/among_us_light_blue.png");
  Icons[7]  = loadImage("./src/img/among_us_light_grey.png");
  Icons[8]  = loadImage("./src/img/among_us_orange.png");
  Icons[9]  = loadImage("./src/img/among_us_pink.png");
  Icons[10] = loadImage("./src/img/among_us_purple.png");
  //Icons[12] = loadImage("./src/img/among_us_red.png");
  Icons[11] = loadImage("./src/img/among_us_grey_yellow.png");

  IconsHover[0]  = loadImage("./src/img/among_us_light_pink_hover.png");
  IconsHover[1]  = loadImage("./src/img/among_us_brown_hover.png");
  IconsHover[2]  = loadImage("./src/img/among_us_brunnete_hover.png");
  IconsHover[3]  = loadImage("./src/img/among_us_yellow_hover.png");
  IconsHover[4]  = loadImage("./src/img/among_us_green_hover.png");
  IconsHover[5]  = loadImage("./src/img/among_us_grey_hover.png");
  IconsHover[6]  = loadImage("./src/img/among_us_light_blue_hover.png");
  IconsHover[7]  = loadImage("./src/img/among_us_light_grey_hover.png");
  IconsHover[8]  = loadImage("./src/img/among_us_orange_hover.png");
  IconsHover[9]  = loadImage("./src/img/among_us_pink_hover.png");
  IconsHover[10] = loadImage("./src/img/among_us_purple_hover.png");
  //IconsHover[12] = loadImage("./src/img/among_us_red_hover.png");
  IconsHover[11] = loadImage("./src/img/among_us_grey_yellow_hover.png");


  Icons2[0] = loadImage("./src/img/cuadrito_feliz.png");
  Icons2[1] = loadImage("./src/img/cuadrito_serio.png");
  Icons2[2] = loadImage("./src/img/cuadrito_enojado.png");
  screen = stScreen;
  //screen = 2;
  menuGrid = new Grid(1, 4, width * 0.27, height * 0.5, width*0.1, width*0.1, stIcons, width*0.01);
  //grid = new Grid(4, 3, width*0.15, height * 0.28, width * 0.22, height*0.11, Icons, width*0.01, IconsHover, ids, names);
  grid = new ImpostorGrid(3, 12, width*0.22, height * 0.11, width * 0.145, height*0.28, Icons, IconsHover, amongusitos, names, texts, ids, impostors);
  grid2 = new Grid(5, 5, width*0.3, height * 0.14, width*.08, Icons2);
  score2 = new ScoreManager("");
  time = new Time();
  amongUsFont = createFont("ArialMTPro-Regular", 16);
  //screen = 5;
}

void draw() {
  justReleased = false;
  mouseJustReleased = false;
  enterJustReleased = false;


  if (keyPressed && (keyCode == ENTER || keyCode == 13 || keyCode == RETURN)) {
    wasPressed = true;
    enterWasPressed = true;
  } else {
    if (enterWasPressed) {
      enterJustReleased = true;
      enterWasPressed = false;
    }
  }

  if (mousePressed) {
    mouseWasPressed = true;
  } else {
    if (mouseWasPressed) {
      mouseJustReleased = true;
      mouseWasPressed = false;
    }
  }

  switch(screen) {
  case 0:
    textFont(amongUsFont);
    if (!resetInput) {
      cp5.addTextfield("name")
        .setPosition(width*0.27, height*0.3)
        .setSize(Math.round(width*0.43), Math.round(height*0.1))
        .setAutoClear(true)
        .setFont(createFont("ArialMTPro-Regular", 32, true))
        .setColor(color(35, 42, 37))
        .setColorBackground(color(97, 111, 87))
        .setColorForeground(color(97, 111, 87))
        .setColorActive(color(97, 111, 87))
        .setLabel("");
      resetInput = true;
    }
    grid2.reset(time.getMillis());
    score2.resetPoints();
    time.reset();
    image(FondoM, 0, 0, width, height);
    menuGrid.display();

    fill(0, 0, 0, 150);
    rect(0, 0, width, height*0.02);
    noFill();

    //image(stIcons[0], width *0.185, height * 0.35, width *0.15, width*0.15);
    //image(stIcons[1], width *0.335 + width*0.01, height * 0.35, width *0.15, width*0.15);
    //image(stIcons[0], width *0.485 + width*0.02, height * 0.35, width *0.15, width*0.15);
    //image(stIcons[0], width *0.635 + width*0.03, height * 0.35, width *0.15, width*0.15);


    if (currentUser != null) {
      menuGrid.mouseHover();
      screen = menuGrid.button();
    }

    if (mouseX > 0 && mouseX < width &&
      mouseY > 0 && mouseY < height * 0.02 &&
      mouseJustReleased) {
      System.out.println("xd");
      screen = 5;
    }
    break;
  case 1:
    if (resetInput) {
      cp5.getController("name").remove();
      resetInput = false;
    }
    switch(among_us_screen) {
    case 0:
      image(Fondo_Among, 0, 0, width, height);
      if (mouseX > width * 0.375 && mouseX < width * 0.375 + width * 0.264 &&
        mouseY > height * 0.59 && mouseY < height * 0.59 + height * 0.2 &&
        mouseJustReleased) {
        among_us_screen = 1;
      }
      break;
    case 1:
      if (!grid.activeDialog) {
        image(Fondo, 0, 0, width, height);
        grid.display();
      }
      grid.displayDialog();
      if (!grid.activeDialog) {
        grid.mouseHover();
      }
      grid.finishGame(ranking);
      break;
    }

    break;
  case 2:
    if (resetInput) {
      cp5.getController("name").remove();
      resetInput = false;
    }
    image(Fondo2, 0, 0, width, height);
    grid2.display();
    if (time.getSeconds() <= 30 && grid2.isRed() == false) {
      score2.display(50, 50, time.getSeconds());
      grid2.change(300, time.getMillis(), 1);
      grid2.mouseCollision(score2);
      grid2.mouseHover();
      grid2.stateHandle(1500, time.getMillis(), 1);
      time.setFinalTime(time.getSeconds());
    } else {
      ranking.agregarOActualizar(currentUser, 0, score2.getPoints(), 0, 0);
      screen = score2.displayEnd2(endScreens2, time, grid2);
    }
    break;
  case 3:
    if (resetInput) {
      cp5.getController("name").remove();
      resetInput = false;
    }
    BookCipherGame.draw();
    break;
  case 4:
    if (resetInput) {
      cp5.getController("name").remove();
      resetInput = false;
    }
    dw.start();
    dw.draw();
    break;
  case 5:
    if (resetInput) {
      cp5.getController("name").remove();
      resetInput = false;
    }
    ranking.actualizarRanking();
    //EjectionBackgrounds[0].display();
    image(FondoRanking, 0, 0, width, height);
    fill(0, 0, 0, 150);
    rect(0, height*0.98, width, height);
    noFill();
    ranking.displayTops(width*0.08, height *0.25, width * 0.16, height*0.05, width * 0.055, height*0.01);
    if (mouseX > 0 && mouseX < width &&
      mouseY > height*0.98 && mouseY < height &&
      mouseJustReleased) {
      System.out.println("xd");
      screen = 0;
    }
    break;
  }
}
