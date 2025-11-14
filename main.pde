import controlP5.*;
import java.lang.Math;

//Cosas de Javier:

int booksX = 35;

BookElement keyBook;
String message;
String encodedMessage;

BookElement[] books;
BookElement activeBook;
OpenBookElement openBook;
boolean bookOpened = false;
boolean inputIsVisible = false;
int startTime3;
int time3;

NoteElement postit;

AnswerElement answer;
ControlP5 cp5;

String[] mensajes = new String[]{
  "en la noche a las 8:35 en viena",
  "hola como estas",
  "hay que ir en la noche",
  "donde estas",
  "para mi tu eres la luna"
};

int getRandomIndex(int size) {
  return (int)(Math.random() * size) + 0;
}

String getRandomMessage() {
  int index = getRandomIndex(mensajes.length);
  return mensajes[index];
} 

BookElement getRandomBook() {
  int index = getRandomIndex(books.length);
  return books[index];
} 

void input(String inpt) {
      if (message.contains(inpt.toLowerCase())) {
        answer.decodedWords[answer.decodedIndex] = keyBook.cipher(inpt) + "->" + inpt;
        answer.decodedIndex++;
      }
}

void mouseClicked() {
  for (BookElement book : books) {
    if (book.isMouseOver() && book != activeBook) {
      bookOpened = true;
      activeBook = book;
      openBook.pageIndex = 0;
    }
  }
   
  if (openBook.prevPage.isMouseOver() && openBook.pageIndex > 0) {
      openBook.prevPage.trigger(-1);
  } else if (openBook.nextPage.isMouseOver() && openBook.pageIndex+2 < openBook.book.pages.length) {
      openBook.prevPage.trigger(1);
  }
}

/////

int stScreen = 0;
int PhishHunter = 1;
int FirewallMatrix = 2;

Frame frame;
Grid menuGrid;
Grid grid;
Grid grid2;
ScoreManager score;
Time time;

int screen;
int xSize;
int ySize;
int now;
int selected = 0;

PImage stIcons[] = new PImage[6];
PImage Icons[] = new PImage[13];
PImage IconsHover[] = new PImage[13];
PImage Icons2[] = new PImage[7];
PImage FondoM;
PImage Fondo;

void settings(){
  //size(1024, 576);
  //size(1920, 1080);
  size(1536, 864);
  xSize = width;
  ySize = height; 
}

void setup() {
  //Javier Setup:
  cp5 = new ControlP5(this);
 
 books = new BookElement[]{
  new BookElement(booksX, 10, "Dracula Cap1", "Bistritz, 3 de mayo. Salí de Münich a las 8:35 de la noche del primero de mayo, llegué a Viena a la mañana siguiente, temprano; debí haber llegado a las seis cuarenta y seis; el tren llevaba una hora de retraso. Budapest parece un lugar maravilloso, a juzgar por lo poco que pude ver de ella desde el tren y por la pequeña caminata que di por sus calles. Temí alejarme mucho de la estación, ya que, como habíamos llegado tarde, saldríamos lo más cerca posible de la hora fijada. La impresión que tuve fue que estábamos saliendo del oeste y entrando al este. Por el más occidental de los espléndidos puentes sobre el Danubio, que aquí es de gran anchura y profundidad, llegamos a los lugares en otro tiempo sujetos al dominio de los turcos. Salimos con bastante buen tiempo, y era noche cerrada cuando llegamos a Klausenburg, donde pasé la noche en el hotel Royale. En la comida, o mejor dicho, en la cena, comí pollo preparado con pimentón rojo, que estaba muy sabroso, pero que me dio mucha sed. (Recordar obtener la receta para Mina). Le pregunté al camarero y me dijo que se llamaba \"paprika hendl\", y que, como era un plato nacional, me sería muy fácil obtenerlo en cualquier lugar de los Cárpatos. Descubrí que mis escasos conocimientos del alemán me servían allí de mucho; de hecho, no sé cómo me las habría arreglado sin ellos. Como dispuse de algún tiempo libre cuando estuve en Londres, visité el British Museum y estudié los libros y mapas de la biblioteca que se referían a Transilvania; se me había ocurrido que un previo conocimiento del país siempre sería de utilidad e importancia para tratar con un noble de la región. Descubrí que el distrito que él me había mencionado se encontraba en el extremo oriental del país, justamente en la frontera de tres estados: Transilvania, Moldavia y Bucovina, en el centro de los montes Cárpatos; una de las partes más salvajes y menos conocidas de Europa. No pude descubrir ningún mapa ni obra que arrojara luz sobre la exacta localización del castillo de Drácula, pues no hay mapas en este país que se puedan comparar en exactitud con los nuestros; pero descubrí que Bistritz, el pueblo de posta mencionado por el conde Drácula, era un lugar bastante conocido. Voy a incluir aquí algunas de mis notas, pues pueden refrescarme la memoria cuando le relate mis viajes a Mina. En la población de Transilvania hay cuatro nacionalidades distintas: sajones en el sur, y mezclados con ellos los valacos, que son descendientes de los dacios; magiares en el oeste, y escequelios en el este y el norte. Voy entre estos últimos, que aseguran ser descendientes de Atila y los hunos. Esto puede ser cierto, puesto que cuando los magiares conquistaron el país, en el siglo XI, encontraron a los hunos, que ya se habían establecido en él. Leo que todas las supersticiones conocidas en el mundo están reunidas en la herradura de los Cárpatos, como si fuese el centro de alguna especie de remolino imaginativo; si es así, mi estancia puede ser muy interesante. (Recordar que debo preguntarle al conde acerca de esas supersticiones). No dormí bien, aunque mi cama era suficientemente cómoda, pues tuve toda clase de extraños sueños. Durante toda la noche un perro aulló bajo mi ventana, lo cual puede haber tenido que ver algo con ello; o puede haber sido también el pimentón, puesto que tuve que beberme toda el agua de mi garrafón, y todavía me quedé sediento. Ya de madrugada me dormí, pero fui despertado por unos golpes insistentes en mi puerta, por lo que supongo que en esos momentos estaba durmiendo profundamente. Comí más pimentón en el desayuno, una especie de potaje hecho de harina de maíz que dicen era \"mamaliga\", y berenjena rellena con picadillo, un excelente plato al cual llaman \"impletata\" (recordar obtener también la receta de esto). Me apresuré a desayunarme, ya que el tren salía un poco después de las ocho, o, mejor dicho, debió haber salido, pues después de correr a la estación a las siete y media tuve que aguardar sentado en el vagón durante más de una hora antes de que nos pusiéramos en movimiento. Me parece que cuanto más al este se vaya, menos puntuales son los trenes. ¿Cómo serán en China? Pareció que durante todo el día vagábamos a través de un país que estaba lleno de toda clase de bellezas. A veces vimos pueblecitos o castillos en la cúspide de empinadas colinas, tales como se ven en los antiguos misales; algunas veces corrimos a la par de ríos y arroyuelos, que por el amplio y pedregoso margen a cada lado de ellos, parecían estar sujetos a grandes inundaciones. Se necesita gran cantidad de agua, con una corriente muy fuerte, para poder limpiar la orilla exterior de un río. En todas las estaciones había grupos de gente, algunas veces multitudes, y con toda clase de atuendos."),
  new BookElement(booksX+110, 10, "Frankenstein Cap2", "Los acontecimientos que influyen decisivamente en nuestros destinos a menudo tienen su origen en sucesos triviales. La filosofía natural es el genio que ha ordenado mi destino. Así pues, en este resumen de mis primeros años, deseo explicar aquellos hechos que me condujeron a sentir una espe- cial predilección por la ciencia. Cuando tenía once años, fuimos todos de excursión a los baños que hay cerca de Thonon. Las inclemencias del tiem- po nos obligaron a quedarnos todo un día encerrados en la posada. En aque- lla casa, por casualidad, encontré un volumen con las obras de Cornelio Agrippa. Lo abrí sin mucho interés; la teoría que intentaba demostrar y los maravillosos hechos que relataba pronto cambiaron aquella apatía en entu- siasmo. Una nueva luz se derramó sobre mi entendimiento; y, dando saltos de alegría, comuniqué aquel descubrimiento a mi padre. No puedo dejar de señalar aquí cuántas veces los maestros tienen ocasión de dirigir los gustos de sus alumnos hacia conocimientos útiles y cuántas veces lo desaprove- chan inconscientemente. Mi padre observó sin mucho interés la cubierta del libro y dijo: —¡Ah… Cornelio Agrippa! Mi querido Víctor, no pierdas el tiempo en estas cosas; no son más que tonterías inútiles. Si en vez de esta advertencia, o incluso esa exclamación, mi padre se hu- biera tomado la molestia de explicarme que las teorías de Agrippa ya ha- bían quedado completamente refutadas y que se había instaurado un sistema científico moderno que tenía mucha más relevancia que el antiguo, porque el del antiguo era pretencioso y quimérico, mientras que las intenciones del moderno eran reales y prácticas… en esas circunstancias, con toda seguri- dad habría desechado el Agrippa y, teniendo la imaginación ya tan excitada, probablemente me habría aplicado a una teoría más racional de la química que ha dado como resultado los descubrimientos modernos. Es posible in- cluso que mis ideas nunca hubieran recibido el impulso fatal que me condu- jo a la ruina. Pero aquella mirada displicente que mi padre había lanzado al libro en ningún caso me aseguraba que supiera siquiera de qué trataba, así que continué leyendo aquel volumen con la mayor avidez. Cuando regresé a casa, mi primera ocupación fue procurarme todas las obras de ese autor y, después, las de Paracelso y las de Alberto Magno. Leí y estudié con deleite las locas fantasías de esos autores; me parecían tesoros que conocían muy pocos aparte de mí; y aunque a menudo deseé comunicar a mi padre aquellos conocimientos secretos, sin embargo, su firme desapro- bación de Agrippa, mi autor favorito, siempre me retuvo. De todos modos, le descubrí mi secreto a Elizabeth, bajo la estricta promesa de guardar se- creto, pero no pareció muy interesada en la materia, así que continué mis estudios solo. Puede resultar un poco extraño que en el siglo XVIII apareciera un discí- pulo de Alberto Magno; pero yo no pertenecía a una familia de científicos ni había asistido a ninguna clase en Ginebra. Así pues, la realidad no entur- biaba mis sueños y me entregué con toda la pasión a la búsqueda de la pie- dra filosofal y el elixir de la vida. Y esto último acaparaba toda mi atención; la riqueza era para mí un asunto menor, ¡pero qué fama alcanzaría mi des- cubrimiento si yo pudiera eliminar la enfermedad de la condición humana y conseguir que el hombre fuera invulnerable a cualquier cosa excepto a una muerte violenta! Esas no eran mis únicas ensoñaciones; invocar la aparición de fantasmas y demonios era una sugerencia constante de mis escritores favoritos, y yo ansiaba poder hacerlo inmediatamente; y si mis encantamientos nunca re- sultaban exitosos, yo atribuía los fracasos más a mi inexperiencia y a mis errores que a la falta de inteligencia o a la incompetencia de mis maestros. Los fenómenos naturales que tienen lugar todos los días delante de nues- tros ojos no me pasaban desapercibidos. La destilación, de la cual mis auto- res favoritos eran absolutamente ignorantes, me causaba asombro, pero con lo que me quedé maravillado fue con algunos experimentos con una bomba de aire que llevaba a cabo un caballero al que solíamos visitar. La ignorancia de mis filósofos en estas y muchas otras disciplinas sirvie- ron para desacreditarlos a mis ojos… pero no podía apartarlos a un lado de- finitivamente antes de que algún otro sistema ocupara su lugar en mi mente. Cuando tenía alrededor de catorce años, estábamos en nuestra casa cerca de Belrive y fuimos testigos de una violenta y terrible tormenta. Había baja- do desde el Jura y los truenos estallaban unos tras otros con un aterrador es- truendo en los cuatro puntos cardinales del cielo. Mientras duró la tormenta, yo permanecí observando su desarrollo con curiosidad y asombro. Cuando estaba allí, en la puerta, de repente, observé un rayo de fuego que se levan- taba desde un viejo y precioso roble que se encontraba a unas veinte yardas de nuestra casa; y en cuanto aquella luz resplandeciente se desvaneció, pude ver que el roble había desaparecido, y no quedaba nada allí, salvo un tocón abrasado. A la mañana siguiente, cuando fuimos a verlo, nos encontramos el árbol increíblemente carbonizado; no se había rajado por el impacto, sino que había quedado reducido por completo a astillas de madera. Nunca vi una cosa tan destrozada."),
  new BookElement(booksX+220, 10, "Moby Dick Cap1", "Llamadme Ismael. Hace unos años —no importa cuánto hace exactamente—, teniendo poco o ningún dinero en el bolsillo, y nada en particular que me interesara en tierra, pensé que me iría a navegar un poco por ahí, para ver la parte acuática del mundo. Es un modo que tengo de echar fuera la melancolía y arreglar la circulación. Cada vez que me sorprendo poniendo una boca triste; cada vez que en mi alma hay un noviembre húmedo y lloviznoso; cada vez que me encuentro parándome sin querer ante las tiendas de ataúdes; y, especialmente, cada vez que la hipocondría me domina de tal modo que hace falta un recio principio moral para impedirme salir a la calle con toda deliberación a derribar metódicamente el sombrero a los transeúntes, entonces, entiendo que es más que hora de hacerme a la mar tan pronto como pueda. Es mi sustitutivo de la pistola y la bala. Con floreo filosófico, Catón se arroja sobre su espada; yo, calladamente, me meto en el barco. No hay nada sorprendente en esto. Aunque no lo sepan, casi todos los hombres, en una o en otra ocasión, abrigan sentimientos muy parecidos a los míos respecto al océano. Ahí tenéis la ciudad insular de los Manhattos, ceñida en torno por los muelles como las islas indias por los arrecifes de coral: el comercio la rodea con su resaca. A derecha y a izquierda, las calles os llevan al agua. Su extremo inferior es la Batería, donde esa noble mole es bañada por olas y refrescada por brisas que pocas horas antes no habían llegado a avistar tierra. Mirad allí las turbas de contempladores del agua. Pasead en torno a la ciudad en las primeras horas de una soñadora tarde de día sabático. Id desde Corlears Hook a Coenties Slip, y desde allí, hacia el norte, por Whitehall. ¿Qué veis? Apostados como silenciosos centinelas alrededor de toda la ciudad, hay millares y millares de seres mortales absortos en ensueños oceánicos. Unos apoyados contra las empalizadas; otros sentados en las cabezas de los atracaderos; otros mirando por encima de las amuradas de barcos arribados de la China; algunos, en lo alto de los aparejos, como esforzándose por obtener una visión aún mejor hacia la mar. Pero ésos son todos ellos hombres de tierra; los días de entre semana, encerrados entre tablas y yeso, atados a los mostradores, clavados a los bancos, sujetos a los escritorios. Entonces ¿cómo es eso? ¿Dónde están los campos verdes? ¿Qué hacen éstos aquí? Pero ¡mirad! Ahí vienen más multitudes, andando derechas al agua, y al parecer dispuestas a zambullirse. ¡Qué extraño! Nada les satisface sino el límite más extremo de la tierra firme; no les basta vagabundear al umbroso socaire de aquellos tinglados. No. Deben acercarse al agua tanto como les sea posible sin caerse dentro. Y ahí se quedan: millas seguidas de ellos, leguas. De tierra adentro todos, llegan de avenidas y callejas, de calles y paseos; del norte, este, sur y oeste. Pero ahí se unen todos. Decidme, ¿les atrae hacia aquí el poder magnético de las agujas de las brújulas de todos estos barcos? Una vez más. Digamos que estáis en el campo; en alguna alta tierra con lagos. Tomad casi cualquier sendero que os plazca, y apuesto diez contra uno a que os lleva por un valle abajo, y os deja junto a un remanso de la corriente. Hay magia en ello. Que el más distraído de los hombres esté sumergido en sus más profundos ensueños: poned de pie a ese hombre, haced que mueva las piernas, e infaliblemente os llevará al agua, si hay agua en toda la región. En caso de que alguna vez tengáis sed en el gran desierto americano, probad este experimento, si vuestra caravana está provista por casualidad de un cultivador de la metafísica. Sí, como todos saben, la meditación y el agua están emparejadas para siempre. Pero aquí hay un artista. Desea pintaros el trozo de paisaje más soñador, más sombrío, más callado, más encantador de todo el valle del Saco. ¿Cuál es el principal elemento que emplea? Ahí están sus árboles cada cual con su tronco hueco, como si hubiera dentro un ermitaño y un crucifijo; ahí duerme su pradera, y allí duermen sus ganados; y de aquella casita se eleva un humo soñoliento. Hundiéndose en lejanos bosques, serpentean un revuelto sendero, hasta alcanzar estribaciones sobrepuestas de montañas que se bañan en el azul que las envuelve.")
 };
 
 keyBook = getRandomBook();
 message = getRandomMessage();
 encodedMessage = keyBook.cipher(message);
 println(keyBook.title);
 
 postit = new NoteElement(booksX, 150, "Mensaje cifrado:\n" + encodedMessage);
 openBook = new OpenBookElement(booksX + postit.w + 10, 150);
 ///////////

  FondoM = loadImage("./src/img/fondo_principal.png");
  Fondo = loadImage("./src/img/who_is_the_impostor.png");
  stIcons[0] = loadImage("./src/img/logo1.png");
  stIcons[1] = loadImage("./src/img/cuadrito_feliz_boton.png");
  stIcons[2] = loadImage("./src/img/book.png");
  stIcons[3] = loadImage("./src/img/lock.png");
  
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
  Icons[11] = loadImage("./src/img/among_us_red.png");
  Icons[12] = loadImage("./src/img/among_us_terracota.png");
  
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
  IconsHover[11] = loadImage("./src/img/among_us_red_hover.png");
  IconsHover[12] = loadImage("./src/img/among_us_terracota_hover.png");

  
  Icons2[0] = loadImage("./src/img/cuadrito_feliz.png");
  Icons2[1] = loadImage("./src/img/cuadrito_serio.png");
  Icons2[2] = loadImage("./src/img/cuadrito_enojado.png");
  screen = stScreen;
  //screen = 2;
  menuGrid = new Grid(1, 4, width * 0.27, height * 0.5, width*0.1, width*0.1, stIcons, width*0.01);
  grid = new Grid(4, 3, width*0.15, height * 0.28, width * 0.22, height*0.11, Icons, width*0.01, IconsHover);
  grid2 = new Grid(5, 5, width*0.3, height * 0.2, width*.08, 
  Icons2);
  score = new ScoreManager("Daniel");
  time = new Time();
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
    grid.mouseHover();
    
    if(grid.button() != 0){
      selected = grid.button();
    }
    break;
  case 2:
    background(120);
    grid2.display();
    if(time.getSeconds() <= 30 && grid2.isRed() == false){
      score.display(50, 50, time.getSeconds());
      grid2.change(300, time.getMillis(), 1);  
      grid2.mouseCollision(score);
      grid2.mouseHover();
      grid2.stateHandle(1500, time.getMillis(), 1);
      time.setFinalTime(time.getSeconds());
    }else{
          screen = score.displayEnd2(width*0.2, height*0.6, time, grid2);
    }
    break;
  case 3:
  if(inputIsVisible == false){
     answer = new AnswerElement(booksX, 300, encodedMessage);
    inputIsVisible = true;
    startTime3 = millis();
  }
    background(114, 80, 16);
    boolean overAnyClickable = false;
  for (BookElement book : books) {
    book.draw();
    if (book.isMouseOver()) {
      overAnyClickable = true;
    }
  }
  
  if (bookOpened) {
    openBook.draw(activeBook);
    if (openBook.prevPage.isMouseOver() && openBook.pageIndex > 0 ||
    openBook.nextPage.isMouseOver() && openBook.pageIndex+2 < openBook.book.pages.length) {
      overAnyClickable = true;
    }
  }

  if (overAnyClickable) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
  
  postit.draw();
  answer.draw();
  time3 = millis()-startTime3;
  if(time3 >= 3000){
    cp5.getController("input").remove();
    screen = stScreen;
    inputIsVisible = false;
  }
    break;
  }
}
