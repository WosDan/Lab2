boolean JUEGO3_DEBUG = false;

class Juego3 {
  BookElement[] books;
  BookElement keyBook;
  OpenBookElement openBook;
  NoteElement directions;
  NoteElement postit;
  AnswerElement answer;
  FinishScreen gameEnd;

  String message;
  String encodedMessage;
  Juego3Time time;

  String[] mensajes = new String[] {
    "En la noche a las 8:35 en Viena",
    "La noche estrellada de Van Gogh",
    "La clave es las 8:35",
    "Uno mas dos es tres",
    "Moby Dick era una ballena",
    "Nunca pense estar aqui",
    "No es seguro ahi afuera",
    "El sol brilla en el cielo",
    "La casa esta cerca del rio",
    "El nino juega con la pelota",
    "La mujer lee un libro en la mesa",
    "El perro corre por el jardin",
    "La noche es oscura y tranquila",
    "El hombre camina por la calle",
    "La comida esta en la cocina",
    "El agua cae sobre la tierra",
    "La puerta se abre lentamente",
    "El viento sopla entre los arboles",
    "La luna ilumina el camino",
    "El gato duerme en la silla",
    "La flor crece en el jardin",
    "El tren pasa por la estacion",
    "La montana esta cubierta de nieve",
    "El reloj marca la hora exacta",
    "La ventana deja entrar la luz",
    "El mar golpea contra las rocas",
    "La campana suena en la iglesia",
    "El hombre tiene un libro de guerra",
    "El tiempo es importante para el estudio",
    "La guerra afecta al estado y al pueblo",
    "El agua del rio es clara",
    "El padre del hombre tiene conocimiento",
    "El lugar tiene luz para el estudio",
    "El general tiene fuerza para la guerra",
    "La ciudad del hombre tiene trabajo",
    "El sistema del estado es importante",
    "El estado tiene guerra con su pueblo",
    "El estudio del libro tiene resultado",
    "La teoria del autor es sobre la naturaleza",
    "El viaje del hombre requiere tiempo",
    "La mente del hombre es importante",
    "El tren del hombre sale de la ciudad",
    "La cena del hotel es para el hombre",
    "El pueblo del estado tiene ayuda",
    "El ejercito tiene fuerza para guerra",
    "El libro del autor es sobre guerra",
    "El agua del rio es para el hombre",
    "El general del ejercito tiene orden",
    "La luz del dia es para la casa",
    "El conocimiento del hombre crece",
    "La fuerza del agua es importante",
    "El principio del estudio es claro",
    "La noche es tiempo de estudio",
    "El trabajo del hombre es importante",
    "El mundo del hombre tiene sistema",
    "El tiempo de guerra es importante",
    "El libro sobre la naturaleza del hombre"
  };

  Juego3() {
    books = new BookElement[4];
    books[0] = new BookElement(30, 10, "Dracula Cap1", "Bistritz, 3 de mayo. Salí de Münich a las 8:35 de la noche del primero de mayo, llegué a Viena a la mañana siguiente, temprano; debí haber llegado a las seis cuarenta y seis; el tren llevaba una hora de retraso. Budapest parece un lugar maravilloso, a juzgar por lo poco que pude ver de ella desde el tren y por la pequeña caminata que di por sus calles. Temí alejarme mucho de la estación, ya que, como habíamos llegado tarde, saldríamos lo más cerca posible de la hora fijada. La impresión que tuve fue que estábamos saliendo del oeste y entrando al este. Por el más occidental de los espléndidos puentes sobre el Danubio, que aquí es de gran anchura y profundidad, llegamos a los lugares en otro tiempo sujetos al dominio de los turcos. Salimos con bastante buen tiempo, y era noche cerrada cuando llegamos a Klausenburg, donde pasé la noche en el hotel Royale. En la comida, o mejor dicho, en la cena, comí pollo preparado con pimentón rojo, que estaba muy sabroso, pero que me dio mucha sed. (Recordar obtener la receta para Mina). Le pregunté al camarero y me dijo que se llamaba \"paprika hendl\", y que, como era un plato nacional, me sería muy fácil obtenerlo en cualquier lugar de los Cárpatos. Descubrí que mis escasos conocimientos del alemán me servían allí de mucho; de hecho, no sé cómo me las habría arreglado sin ellos. Como dispuse de algún tiempo libre cuando estuve en Londres, visité el British Museum y estudié los libros y mapas de la biblioteca que se referían a Transilvania; se me había ocurrido que un previo conocimiento del país siempre sería de utilidad e importancia para tratar con un noble de la región. Descubrí que el distrito que él me había mencionado se encontraba en el extremo oriental del país, justamente en la frontera de tres estados: Transilvania, Moldavia y Bucovina, en el centro de los montes Cárpatos; una de las partes más salvajes y menos conocidas de Europa. No pude descubrir ningún mapa ni obra que arrojara luz sobre la exacta localización del castillo de Drácula, pues no hay mapas en este país que se puedan comparar en exactitud con los nuestros; pero descubrí que Bistritz, el pueblo de posta mencionado por el conde Drácula, era un lugar bastante conocido. Voy a incluir aquí algunas de mis notas, pues pueden refrescarme la memoria cuando le relate mis viajes a Mina. En la población de Transilvania hay cuatro nacionalidades distintas: sajones en el sur, y mezclados con ellos los valacos, que son descendientes de los dacios; magiares en el oeste, y escequelios en el este y el norte. Voy entre estos últimos, que aseguran ser descendientes de Atila y los hunos. Esto puede ser cierto, puesto que cuando los magiares conquistaron el país, en el siglo XI, encontraron a los hunos, que ya se habían establecido en él. Leo que todas las supersticiones conocidas en el mundo están reunidas en la herradura de los Cárpatos, como si fuese el centro de alguna especie de remolino imaginativo; si es así, mi estancia puede ser muy interesante. (Recordar que debo preguntarle al conde acerca de esas supersticiones). No dormí bien, aunque mi cama era suficientemente cómoda, pues tuve toda clase de extraños sueños. Durante toda la noche un perro aulló bajo mi ventana, lo cual puede haber tenido que ver algo con ello; o puede haber sido también el pimentón, puesto que tuve que beberme toda el agua de mi garrafón, y todavía me quedé sediento. Ya de madrugada me dormí, pero fui despertado por unos golpes insistentes en mi puerta, por lo que supongo que en esos momentos estaba durmiendo profundamente. Comí más pimentón en el desayuno, una especie de potaje hecho de harina de maíz que dicen era \"mamaliga\", y berenjena rellena con picadillo, un excelente plato al cual llaman \"impletata\" (recordar obtener también la receta de esto). Me apresuré a desayunarme, ya que el tren salía un poco después de las ocho, o, mejor dicho, debió haber salido, pues después de correr a la estación a las siete y media tuve que aguardar sentado en el vagón durante más de una hora antes de que nos pusiéramos en movimiento. Me parece que cuanto más al este se vaya, menos puntuales son los trenes. ¿Cómo serán en China? Pareció que durante todo el día vagábamos a través de un país que estaba lleno de toda clase de bellezas. A veces vimos pueblecitos o castillos en la cúspide de empinadas colinas, tales como se ven en los antiguos misales; algunas veces corrimos a la par de ríos y arroyuelos, que por el amplio y pedregoso margen a cada lado de ellos, parecían estar sujetos a grandes inundaciones. Se necesita gran cantidad de agua, con una corriente muy fuerte, para poder limpiar la orilla exterior de un río. En todas las estaciones había grupos de gente, algunas veces multitudes, y con toda clase de atuendos.");
    books[1] = new BookElement(books[0].x + books[0].w + 10, 10, "Frankenstein Cap2", "Los acontecimientos que influyen decisivamente en nuestros destinos a menudo tienen su origen en sucesos triviales. La filosofia natural es el genio que ha ordenado mi destino. Asi pues, en este resumen de mis primeros anos, deseo explicar aquellos hechos que me condujeron a sentir una espe- cial predileccion por la ciencia. Cuando tenia once anos, fuimos todos de excursion a los banos que hay cerca de Thonon. Las inclemencias del tiem- po nos obligaron a quedarnos todo un dia encerrados en la posada. En aque- lla casa, por casualidad, encontre un volumen con las obras de Cornelio Agrippa. Lo abri sin mucho interes; la teoria que intentaba demostrar y los maravillosos hechos que relataba pronto cambiaron aquella apatia en entu- siasmo. Una nueva luz se derramo sobre mi entendimiento; y, dando saltos de alegria, comunique aquel descubrimiento a mi padre. No puedo dejar de senalar aqui cuantas veces los maestros tienen ocasion de dirigir los gustos de sus alumnos hacia conocimientos utiles y cuantas veces lo desaprove- chan inconscientemente. Mi padre observo sin mucho interes la cubierta del libro y dijo: —¡Ah… Cornelio Agrippa! Mi querido Victor, no pierdas el tiempo en estas cosas; no son mas que tonterias inutiles. Si en vez de esta advertencia, o incluso esa exclamacion, mi padre se hu- biera tomado la molestia de explicarme que las teorias de Agrippa ya ha- bian quedado completamente refutadas y que se habia instaurado un sistema cientifico moderno que tenia mucha mas relevancia que el antiguo, porque el del antiguo era pretencioso y quimerico, mientras que las intenciones del moderno eran reales y practicas… en esas circunstancias, con toda seguri- dad habria desechado el Agrippa y, teniendo la imaginacion ya tan excitada, probablemente me habria aplicado a una teoria mas racional de la quimica que ha dado como resultado los descubrimientos modernos. Es posible in- cluso que mis ideas nunca hubieran recibido el impulso fatal que me condu- jo a la ruina. Pero aquella mirada displicente que mi padre habia lanzado al libro en ningun caso me aseguraba que supiera siquiera de que trataba, asi que continue leyendo aquel volumen con la mayor avidez. Cuando regrese a casa, mi primera ocupacion fue procurarme todas las obras de ese autor y, despues, las de Paracelso y las de Alberto Magno. Lei y estudie con deleite las locas fantasias de esos autores; me parecian tesoros que conocian muy pocos aparte de mi; y aunque a menudo desee comunicar a mi padre aquellos conocimientos secretos, sin embargo, su firme desapro- bacion de Agrippa, mi autor favorito, siempre me retuvo. De todos modos, le descubri mi secreto a Elizabeth, bajo la estricta promesa de guardar se- creto, pero no parecio muy interesada en la materia, asi que continue mis estudios solo. Puede resultar un poco extrano que en el siglo XVIII apareciera un disci- pulo de Alberto Magno; pero yo no pertenecia a una familia de cientificos ni habia asistido a ninguna clase en Ginebra. Asi pues, la realidad no entur- biaba mis suenos y me entregue con toda la pasion a la busqueda de la pie- dra filosofal y el elixir de la vida. Y esto ultimo acaparaba toda mi atencion; la riqueza era para mi un asunto menor, ¡pero que fama alcanzaria mi des- cubrimiento si yo pudiera eliminar la enfermedad de la condicion humana y conseguir que el hombre fuera invulnerable a cualquier cosa excepto a una muerte violenta! Esas no eran mis unicas ensonaciones; invocar la aparicion de fantasmas y demonios era una sugerencia constante de mis escritores favoritos, y yo ansiaba poder hacerlo inmediatamente; y si mis encantamientos nunca re- sultaban exitosos, yo atribuia los fracasos mas a mi inexperiencia y a mis errores que a la falta de inteligencia o a la incompetencia de mis maestros. Los fenomenos naturales que tienen lugar todos los dias delante de nues- tros ojos no me pasaban desapercibidos. La destilacion, de la cual mis auto- res favoritos eran absolutamente ignorantes, me causaba asombro, pero con lo que me quede maravillado fue con algunos experimentos con una bomba de aire que llevaba a cabo un caballero al que soliamos visitar. La ignorancia de mis filosofos en estas y muchas otras disciplinas sirvie- ron para desacreditarlos a mis ojos… pero no podia apartarlos a un lado de- finitivamente antes de que algun otro sistema ocupara su lugar en mi mente. Cuando tenia alrededor de catorce anos, estabamos en nuestra casa cerca de Belrive y fuimos testigos de una violenta y terrible tormenta. Habia baja- do desde el Jura y los truenos estallaban unos tras otros con un aterrador es- truendo en los cuatro puntos cardinales del cielo. Mientras duro la tormenta, yo permaneci observando su desarrollo con curiosidad y asombro. Cuando estaba alli, en la puerta, de repente, observe un rayo de fuego que se levan- taba desde un viejo y precioso roble que se encontraba a unas veinte yardas de nuestra casa; y en cuanto aquella luz resplandeciente se desvanecio, pude ver que el roble habia desaparecido, y no quedaba nada alli, salvo un tocon abrasado. A la manana siguiente, cuando fuimos a verlo, nos encontramos el arbol increiblemente carbonizado; no se habia rajado por el impacto, sino que habia quedado reducido por completo a astillas de madera. Nunca vi una cosa tan destrozada.");
    books[2] = new BookElement(books[1].x + books[1].w + 10, 10, "Moby Dick Cap1", "Llamadme Ismael. Hace unos anos —no importa cuanto hace exactamente—, teniendo poco o ningun dinero en el bolsillo, y nada en particular que me interesara en tierra, pense que me iria a navegar un poco por ahi, para ver la parte acuatica del mundo. Es un modo que tengo de echar fuera la melancolia y arreglar la circulacion. Cada vez que me sorprendo poniendo una boca triste; cada vez que en mi alma hay un noviembre humedo y lloviznoso; cada vez que me encuentro parandome sin querer ante las tiendas de ataudes; y, especialmente, cada vez que la hipocondria me domina de tal modo que hace falta un recio principio moral para impedirme salir a la calle con toda deliberacion a derribar metodicamente el sombrero a los transeuntes, entonces, entiendo que es mas que hora de hacerme a la mar tan pronto como pueda. Es mi sustitutivo de la pistola y la bala. Con floreo filosofico, Caton se arroja sobre su espada; yo, calladamente, me meto en el barco. No hay nada sorprendente en esto. Aunque no lo sepan, casi todos los hombres, en una o en otra ocasion, abrigan sentimientos muy parecidos a los mios respecto al oceano. Ahi teneis la ciudad insular de los Manhattos, cenida en torno por los muelles como las islas indias por los arrecifes de coral: el comercio la rodea con su resaca. A derecha y a izquierda, las calles os llevan al agua. Su extremo inferior es la Bateria, donde esa noble mole es banada por olas y refrescada por brisas que pocas horas antes no habian llegado a avistar tierra. Mirad alli las turbas de contempladores del agua. Pasead en torno a la ciudad en las primeras horas de una sonadora tarde de dia sabatico. Id desde Corlears Hook a Coenties Slip, y desde alli, hacia el norte, por Whitehall. ¿Que veis? Apostados como silenciosos centinelas alrededor de toda la ciudad, hay millares y millares de seres mortales absortos en ensuenos oceanicos. Unos apoyados contra las empalizadas; otros sentados en las cabezas de los atracaderos; otros mirando por encima de las amuradas de barcos arribados de la China; algunos, en lo alto de los aparejos, como esforzandose por obtener una vision aun mejor hacia la mar. Pero esos son todos ellos hombres de tierra; los dias de entre semana, encerrados entre tablas y yeso, atados a los mostradores, clavados a los bancos, sujetos a los escritorios. Entonces ¿como es eso? ¿Donde estan los campos verdes? ¿Que hacen estos aqui? Pero ¡mirad! Ahi vienen mas multitudes, andando derechas al agua, y al parecer dispuestas a zambullirse. ¡Que extrano! Nada les satisface sino el limite mas extremo de la tierra firme; no les basta vagabundear al umbroso socaire de aquellos tinglados. No. Deben acercarse al agua tanto como les sea posible sin caerse dentro. Y ahi se quedan: millas seguidas de ellos, leguas. De tierra adentro todos, llegan de avenidas y callejas, de calles y paseos; del norte, este, sur y oeste. Pero ahi se unen todos. Decidme, ¿les atrae hacia aqui el poder magnetico de las agujas de las brujulas de todos estos barcos? Una vez mas. Digamos que estais en el campo; en alguna alta tierra con lagos. Tomad casi cualquier sendero que os plazca, y apuesto diez contra uno a que os lleva por un valle abajo, y os deja junto a un remanso de la corriente. Hay magia en ello. Que el mas distraido de los hombres este sumergido en sus mas profundos ensuenos: poned de pie a ese hombre, haced que mueva las piernas, e infaliblemente os llevara al agua, si hay agua en toda la region. En caso de que alguna vez tengais sed en el gran desierto americano, probad este experimento, si vuestra caravana esta provista por casualidad de un cultivador de la metafisica. Si, como todos saben, la meditacion y el agua estan emparejadas para siempre. Pero aqui hay un artista. Desea pintaros el trozo de paisaje mas sonador, mas sombrio, mas callado, mas encantador de todo el valle del Saco. ¿Cual es el principal elemento que emplea? Ahi estan sus arboles cada cual con su tronco hueco, como si hubiera dentro un ermitano y un crucifijo; ahi duerme su pradera, y alli duermen sus ganados; y de aquella casita se eleva un humo sonoliento. Hundiendose en lejanos bosques, serpentean un revuelto sendero, hasta alcanzar estribaciones sobrepuestas de montanas que se banan en el azul que las envuelve.");
    books[3] = new BookElement(books[2].x + books[2].w + 10, 10, "El arte de la guerra Cap1", "Sun Tzu dice: la guerra es de vital importancia para el Estado; es el dominio de la vida o de la muerte, el camino hacia la supervivencia o la perdida del Imperio: es forzoso manejarla bien. No reflexionar seriamente sobre todo lo que le concierne es dar prueba de una culpable indiferencia en lo que respecta a la conservacion o perdida de lo que nos es mas querido; y ello no debe ocurrir entre nosotros. Hay que valorarla en terminos de cinco factores fundamentales, y hacer comparaciones entre diversas condiciones de los bandos rivales, con vistas a determinar el resultado de la guerra. El primero de estos factores es la doctrina; el segundo, el tiempo; el tercero, el terreno; el cuarto, el mando; y el quinto, la disciplina. La doctrina significa aquello que hace que el pueblo este en armonia con su gobernante, de modo que le siga donde sea, sin temer por sus vidas ni a correr cualquier peligro. El tiempo significa el Ying y el Yang, la noche y el dia, el frio y el calor, dias despejados o lluviosos, y el cambio de las estaciones. El terreno implica las distancias, y hace referencia a donde es facil o dificil desplazarse, y si es campo abierto o lugares estrechos, y esto influencia las posibilidades de supervivencia. El mando ha de tener como cualidades: sabiduria, sinceridad, benevolencia, coraje y disciplina. Por ultimo, la disciplina ha de ser comprendida como la organizacion del ejercito, las graduaciones y rangos entre los oficiales, la regulacion de las rutas de suministros, y la provision de material militar al ejercito. Estos cinco factores fundamentales han de ser conocidos por cada general. Aquel que los domina, vence; aquel que no, sale derrotado. Por lo tanto, al trazar los planes, han de compararse los siguiente siete factores, valorando cada uno con el mayor cuidado: ¿Que dirigente es mas sabio y capaz? ¿Que comandante posee el mayor talento? ¿Que ejercito obtiene ventajas de la naturaleza y el terreno? ¿En que ejercito se observan mejor las regulaciones y las instrucciones? ¿Que tropas son mas fuertes? ¿Que ejercito tiene oficiales y tropas mejor entrenadas? ¿Que ejercito administra recompensas y castigos de forma mas justa? Mediante el estudio de estos siete factores, sere capaz de adivinar cual de los dos bandos saldra victorioso y cual sera derrotado. El general que siga mi consejo, es seguro que vencera. Ese general ha de ser mantenido al mando. Aquel que ignore mi consejo, ciertamente sera derrotado. Ese debe ser destituido. Tras prestar atencion a mi consejo y planes, el general debe crear una situacion que contribuya a su cumplimiento. Por situacion quiero decir que debe tomar en consideracion la situacion del campo, y actuar de acuerdo con lo que le es ventajoso. El arte de la guerra se basa en el engano. Por lo tanto, cuando es capaz de atacar, ha de aparentar incapacidad; cuando las tropas se mueven, aparentar inactividad. Si esta cerca del enemigo, ha de hacerle creer que esta lejos; si esta lejos, aparentar que se esta cerca. Poner cebos para atraer al enemigo. Golpear al enemigo cuando esta desordenado. Prepararse contra el cuando esta seguro en todas partes. Evitarle durante un tiempo cuando es mas fuerte. Si tu oponente tiene un temperamento colerico, intenta irritarle. Si es arrogante, trata de fomentar su egoismo. Si las tropas enemigas se hallan bien preparadas tras una reorganizacion, intenta desordenarlas. Si estan unidas, siembra la disension entre sus filas. Ataca al enemigo cuando no esta preparado, y aparece cuando no te espera. Estas son las claves de la victoria para el estratega. Ahora, si las estimaciones realizadas antes de la batalla indican victoria, es porque los calculos cuidadosamente realizados muestran que tus condiciones son mas favorables que las condiciones del enemigo; si indican derrota, es porque muestran que las condiciones favorables para la batalla son menores. Con una evaluacion cuidadosa, uno puede vencer; sin ella, no puede. Muchas menos oportunidades de victoria tendra aquel que no realiza calculos en absoluto. Gracias a este metodo, se puede examinar la situacion, y el resultado aparece claramente.");

    start();
  }

  void start() {
    if (!JUEGO3_DEBUG) {
      keyBook = getRandomBook();
      message = getRandomMessage();
    } else {
      keyBook = books[0];
      message = "hola como estas";
    }

    encodedMessage = keyBook.cipher(message);

    int directionsX = books[books.length-1].w + books[books.length-1].x + 10;
    int directionsY = 10;
    directions = new NoteElement(directionsX, directionsY, "Decifra el mensaje cifrado de la forma [pagina]-[# palabra] utilizando uno de los libros. \nMensaje cifrado:\n" + encodedMessage, 2);
    answer = new AnswerElement(30, 10 + keyBook.h + keyBook.y, encodedMessage);

    openBook = new OpenBookElement(30 + answer.w + 30, keyBook.h + keyBook.y - 20);
    gameEnd = new FinishScreen(message);

    time=null;
  }

  void draw() {
    boolean overAnyClickable = false;
    if (time == null) {
      time = new Juego3Time();
    }

    background(114, 80, 16);

    if (cp5.getController("input") == null && !answer.isFinished) {
      answer.createInputField();
    }

    for (BookElement book : books) {
      book.draw();
      if (book.isMouseOver()) {
        overAnyClickable = true;
      }
    }

    if (openBook.isActive) {
      openBook.draw();
      if (openBook.isOverNext() || openBook.isOverPrev()) {
        overAnyClickable = true;
      }
    }

    if (overAnyClickable) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }

    answer.draw();
    directions.draw();

    if (answer.isFinished) {
      if (time.finishTime == 0) {
        time.finishTime = millis();
        gameEnd.time = time.getSeconds();
        cp5.getController("input").remove();

        int score = 3000 / gameEnd.time;
        ranking.agregarOActualizar(currentUser, 0, 0, score, 0);
      }

      gameEnd.draw();

      int rn = millis();
      if (rn-time.finishTime >= 5000) {
        screen = 0;
        start();
      }
    }
  }

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
    String word = inpt.toLowerCase();

    boolean inMessage = message.toLowerCase().matches(".*\\b" + word + "\\b.*");
    boolean notInEncoded = !encodedMessage.toLowerCase().matches(".*\\b" + word + "\\b.*");
    boolean alreadyDecoded = false;

    for (int i = 0; i < answer.decodedIndex; i++) {
      String c = keyBook.cipher(word) + " -> " + word;
      if (answer.decodedWords[i] != null && answer.decodedWords[i].equals(c)) {
        alreadyDecoded = true;
        break;
      }
    }

    if (inMessage && notInEncoded && !alreadyDecoded) {
      println(keyBook.cipher(word) + " -> " + word);
      answer.decodedWords[answer.decodedIndex] = keyBook.cipher(word) + " -> " + word;
      answer.decodedIndex++;
    }
  }

  void mouseClicked() {
    for (BookElement book : books) {
      if (book.isMouseOver()) {
        openBook.isActive = true;
        openBook.currentBook = book;
        openBook.pageIndex = 0;
      }
    }

    if (openBook.isOverPrev()) {
      openBook.prevPage.trigger(-1);
    } else if (openBook.isOverNext()) {
      openBook.prevPage.trigger(1);
    }
  }
}

class Juego3Time {
  int startTime = 0;
  int finishTime = 0;

  Juego3Time() {
    startTime = millis();
  }

  public int getSeconds() {
    return (finishTime - startTime) / 1000;
  }
}

class Element {
  int x, y, w, h;
  int xbounds1, ybounds1, xbounds2, ybounds2;
  Element(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    this.xbounds1 = x;
    this.xbounds2 = x + w;
    this.ybounds1 = y;
    this.ybounds2 = y + h;
  }

  public boolean isMouseOver() {
    if (mouseX >= this.xbounds1 && mouseX <= this.xbounds2 && mouseY >= this.ybounds1 && mouseY <= this.ybounds2) {
      return true;
    }

    return false;
  }
}

class ImageElementJ3 extends Element {
  PImage img;

  ImageElementJ3(int x, int y, int w, int h, String imgpath) {
    super(x, y, w, h);
    this.img = loadImage(imgpath);
  }

  public void draw() {
    image(img, this.x, this.y, this.w, this.h);
  }
}

class BookElement extends ImageElementJ3 {
  String title;
  String[] pages;
  int textX, textY, textW, textH;

  BookElement(int x, int y, String title, String text) {
    super(x, y, 160, 160, "book_purple.png");
    this.title = title;

    this.xbounds2 = this.x + this.w - 30;
    this.ybounds2 = this.y + this.h;

    this.textX = this.x + 20;
    this.textY = this.y + 20;
    this.textW = xbounds2 - xbounds1 - 50;
    this.textH = ybounds2 - ybounds1 - 60;

    this.pages = this.splitIntoPages(text, 20);
  }

  public String cipher(String text) {
    String encoded = "";

    for (String termino : text.split(" ")) {
      Boolean found = false;
      //encoded += "\"" + termino + "\"" + "=";
      for (int i = 0; i < this.pages.length && !found; i++) {
        String contenido = this.pages[i];
        String[] palabras = contenido.split(" ");
        for (int j = 0; j < palabras.length; j++) {
          String palabra = palabras[j];
          if (palabra.toLowerCase().equals(termino.toLowerCase())) {
            encoded += String.valueOf(i + 1) + "-" + String.valueOf(j + 1) + " ";
            found = true;
            break;
          }
        }
      }

      if (!found) {
        encoded += termino + " ";
      }
    }

    return encoded;
  }

  private String[] splitIntoPages(String text, int wordsPerPage) {
    if (text == null || text.isEmpty()) {
      return new String[] {};
    }

    // Split by whitespace into words
    String[] words = text.trim().split("\\s+");
    int totalWords = words.length;

    // Calculate number of pages
    int pageCount = (int) Math.ceil((double) totalWords / wordsPerPage);
    String[] pages = new String[pageCount];

    int pageIndex = 0;
    for (int i = 0; i < totalWords; i += wordsPerPage) {
      int end = Math.min(i + wordsPerPage, totalWords);

      // Join words for this page
      StringBuilder sb = new StringBuilder();
      for (int j = i; j < end; j++) {
        sb.append(words[j]);
        if (j < end - 1) {
          sb.append(" ");
        }
      }

      pages[pageIndex++] = sb.toString();
    }

    return pages;
  }

  public void draw() {
    image(this.img, this.x, this.y, this.w, this.h);


    if (JUEGO3_DEBUG) {
      fill(255, 127);
      rect(this.textX, this.textY, this.textW, this.textH);
    }

    fill(255);
    textSize(16);
    text(this.title, this.textX, this.textY, this.textW, this.textH);
  }
}

class NoteElement extends ImageElementJ3 {
  String message;
  int textX, textY, textW, textH;

  NoteElement(int x, int y, String message, int type) {
    super(x, y, (type == 1) ? 160 : (type == 2) ? 320 : 160, (type == 1) ? 160 : (type == 2) ? 160 : 320, (type == 1) ? "note.png" : (type == 2) ? "note_wide.png" : "note_tall.png");
    this.message = message;

    this.textX = this.x + 10;
    this.textY = this.y + 10;
    this.textW = xbounds2 - xbounds1 - 30;
    this.textH = ybounds2 - ybounds1 - 30;
  }

  public void draw() {
    image(this.img, this.x, this.y, this.w, this.h);

    if (JUEGO3_DEBUG) {
      fill(255, 127);
      rect(this.textX, this.textY, this.textW, this.textH);
    }

    fill(0);
    textSize(16);
    text(this.message, this.textX, this.textY, this.textW, this.textH);
  }
}

class AnswerElement extends NoteElement {
  String[] decodedWords;
  int decodedIndex = 0;
  int uniqueWords = 0;
  Boolean isFinished = false;

  int fieldX, fieldY, fieldW, fieldH;
  AnswerElement(int x, int y, String encodedMessage) {
    super(x, y, "Notas:", 3);

    this.textH = 18;
    this.fieldX = this.textX;
    this.fieldY = this.textY + this.textH;
    this.fieldW = this.textW;
    this.fieldH = this.textH;

    String[] words = encodedMessage.split(" ");
    String[] uniqueEncoded = new String[words.length];

    for (int i = 0; i < words.length; i++) {
      String word = words[i];

      if (word.matches("\\d+-\\d+")) {
        Boolean exists = false;

        for (int j = 0; j < uniqueEncoded.length; j++) {
          if (uniqueEncoded[j] != null && uniqueEncoded[j].equals(word)) {
            exists = true;
            break;
          }
        }

        if (!exists) {
          uniqueEncoded[this.uniqueWords] = word;
          this.uniqueWords++;
        }
      }
    }

    this.decodedWords = new String[this.uniqueWords];
    for (int i = 0; i < decodedWords.length; i++) {
      decodedWords[i] = "";
    }
  }

  void createInputField() {
    cp5.addTextfield("input")
      .setPosition(this.fieldX, this.fieldY)
      .setSize(this.fieldW, this.fieldH)
      .setAutoClear(true)
      .setFont(createFont("Arial", 16, true))
      .setColor(color(0))
      .setColorBackground(color(196, 181, 121))
      .setColorForeground(color(155, 142, 97))
      .setColorActive(color(155, 142, 97))
      .setLabel("");
  }

  void draw() {
    if (this.uniqueWords == this.decodedIndex && !this.isFinished) {
      this.isFinished = true;
    }

    image(img, this.x, this.y, this.w, this.h + (decodedWords.length * 15));

    if (JUEGO3_DEBUG) {
      fill(255, 127);
      rect(this.textX, this.textY, this.textW, this.textH);
      rect(this.textX, this.fieldY + this.fieldH, this.textW, this.textH * this.decodedIndex);
    }

    fill(0);
    textSize(16);
    text(this.message, this.textX, this.textY, this.textW, this.textH);
    text(String.join("\n", this.decodedWords), this.textX, this.fieldY + this.fieldH, this.textW, this.textH * this.decodedIndex);
  }
}

class OpenBookElement extends ImageElementJ3 {
  int pageIndex = 0;
  boolean isActive = false;
  OpenBookButton nextPage;
  OpenBookButton prevPage;
  BookElement currentBook;
  OpenBookElement(int x, int y) {
    super(x, y, 320*3, 160*3, "book_purple_wide.png");

    nextPage = new OpenBookButton(this.x + this.w - 30, this.y + 90, this);
    prevPage = new OpenBookButton(this.x, this.y + 90, this);
  }

  boolean isOverPrev() {
    if (prevPage.isMouseOver() && pageIndex > 0) {
      return true;
    } else return false;
  }

  boolean isOverNext() {
    if (nextPage.isMouseOver() && pageIndex + 2 < currentBook.pages.length) {
      return true;
    } else return false;
  }

  public void draw() {
    image(img, this.x, this.y, this.w, this.h);
    textSize(24);

    fill(0);
    text(currentBook.pages[this.pageIndex], this.x + 90, this.y + 60, 330, 270);
    text(this.pageIndex+1, this.x+90, this.y+this.h-120);

    if (pageIndex + 1 < currentBook.pages.length) {
      fill(0);
      text(currentBook.pages[pageIndex + 1], this.x + (this.w / 2) + 60, this.y + 60, 330, 270);
      text(this.pageIndex+2, this.x + this.w -90, this.y+this.h-120);
    }

    if (JUEGO3_DEBUG) {
      fill(255, 127);
      rect(this.x + 90, this.y + 60, 330, 270);
      fill(255, 127);
      rect(this.x + (this.w / 2) + 60, this.y + 60, 330, 270);
    }

    if (pageIndex > 0) {
      prevPage.draw();
    }

    if (pageIndex + 2 < currentBook.pages.length) {
      nextPage.draw();
    }
  }
}

class OpenBookButton extends Element {
  OpenBookElement parent;
  OpenBookButton(int x, int y, OpenBookElement parent) {
    super(x, y, 30, parent.h - 90);
    this.parent = parent;
  }

  public void draw() {
    if (JUEGO3_DEBUG) {
      fill(255, 127);
      rect(this.x, this.y, this.w, this.h);
    }
  }

  public void trigger(int mode) {
    if (mode == -1) {
      this.parent.pageIndex -= 2;
    } else {
      this.parent.pageIndex += 2;
    }
  }
}

class FinishScreen extends NoteElement {
  int time = 0;
  FinishScreen(String message) {
    super(0, 0, message, 2);
    this.w *= 3;
    this.h*=3;
    this.x = (width-this.w) / 2;
    this.y = (height-this.h) / 2;

    this.xbounds1 = this.x;
    this.xbounds2 = this.x + this.w;
    this.ybounds1 = this.y;
    this.ybounds2 = this.y + this.h;

    this.textX = this.x + 30;
    this.textY = this.y + 30;
    this.textW = this.xbounds2 - this.xbounds1 - 90;
    this.textH = this.ybounds2 - this.ybounds1 - 90;
  }

  void draw() {
    image(this.img, this.x, this.y, this.w, this.h);

    if (JUEGO3_DEBUG) {
      fill(255, 127);
      rect(this.textX, this.textY, this.textW, this.textH);
    }

    fill(0);
    textSize(32);
    text("Decifraste el mensaje: " + this.message + "\nDecifrado en: " + this.time + " segundos, con un puntaje de: " + 3000 / this.time, this.textX, this.textY, this.textW, this.textH);
  }
}
