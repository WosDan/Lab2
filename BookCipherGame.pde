class Juego3 {
  int booksX = 35;
  BookElement keyBook;
  String message;
  String encodedMessage;

  BookElement[] books;
  BookElement activeBook;
  OpenBookElement openBook;
  boolean bookOpened = false;
  boolean inputIsVisible = false;
  int StartTime = 0;
  int time;

  NoteElement directions;
  NoteElement postit;
  AnswerElement answer;
  ImageElement gameEnd;

  String[] mensajes = new String[] {
    "en la noche a las 8:35 en viena",
    "la noche estrellada de Van Gogh",
    "La clave es las 8:35",
    "1 más 2 es 3",
    "Moby dick era una ballena"
  };

  Juego3() {
    books = new BookElement[] {
      new BookElement(booksX, 10, "Dracula Cap1", "Bistritz, 3 de mayo. Salí de Münich a las 8:35 de la noche del primero de mayo, llegué a Viena a la mañana siguiente, temprano; debí haber llegado a las seis cuarenta y seis; el tren llevaba una hora de retraso. Budapest parece un lugar maravilloso, a juzgar por lo poco que pude ver de ella desde el tren y por la pequeña caminata que di por sus calles. Temí alejarme mucho de la estación, ya que, como habíamos llegado tarde, saldríamos lo más cerca posible de la hora fijada. La impresión que tuve fue que estábamos saliendo del oeste y entrando al este. Por el más occidental de los espléndidos puentes sobre el Danubio, que aquí es de gran anchura y profundidad, llegamos a los lugares en otro tiempo sujetos al dominio de los turcos. Salimos con bastante buen tiempo, y era noche cerrada cuando llegamos a Klausenburg, donde pasé la noche en el hotel Royale. En la comida, o mejor dicho, en la cena, comí pollo preparado con pimentón rojo, que estaba muy sabroso, pero que me dio mucha sed. (Recordar obtener la receta para Mina). Le pregunté al camarero y me dijo que se llamaba \"paprika hendl\", y que, como era un plato nacional, me sería muy fácil obtenerlo en cualquier lugar de los Cárpatos. Descubrí que mis escasos conocimientos del alemán me servían allí de mucho; de hecho, no sé cómo me las habría arreglado sin ellos. Como dispuse de algún tiempo libre cuando estuve en Londres, visité el British Museum y estudié los libros y mapas de la biblioteca que se referían a Transilvania; se me había ocurrido que un previo conocimiento del país siempre sería de utilidad e importancia para tratar con un noble de la región. Descubrí que el distrito que él me había mencionado se encontraba en el extremo oriental del país, justamente en la frontera de tres estados: Transilvania, Moldavia y Bucovina, en el centro de los montes Cárpatos; una de las partes más salvajes y menos conocidas de Europa. No pude descubrir ningún mapa ni obra que arrojara luz sobre la exacta localización del castillo de Drácula, pues no hay mapas en este país que se puedan comparar en exactitud con los nuestros; pero descubrí que Bistritz, el pueblo de posta mencionado por el conde Drácula, era un lugar bastante conocido. Voy a incluir aquí algunas de mis notas, pues pueden refrescarme la memoria cuando le relate mis viajes a Mina. En la población de Transilvania hay cuatro nacionalidades distintas: sajones en el sur, y mezclados con ellos los valacos, que son descendientes de los dacios; magiares en el oeste, y escequelios en el este y el norte. Voy entre estos últimos, que aseguran ser descendientes de Atila y los hunos. Esto puede ser cierto, puesto que cuando los magiares conquistaron el país, en el siglo XI, encontraron a los hunos, que ya se habían establecido en él. Leo que todas las supersticiones conocidas en el mundo están reunidas en la herradura de los Cárpatos, como si fuese el centro de alguna especie de remolino imaginativo; si es así, mi estancia puede ser muy interesante. (Recordar que debo preguntarle al conde acerca de esas supersticiones). No dormí bien, aunque mi cama era suficientemente cómoda, pues tuve toda clase de extraños sueños. Durante toda la noche un perro aulló bajo mi ventana, lo cual puede haber tenido que ver algo con ello; o puede haber sido también el pimentón, puesto que tuve que beberme toda el agua de mi garrafón, y todavía me quedé sediento. Ya de madrugada me dormí, pero fui despertado por unos golpes insistentes en mi puerta, por lo que supongo que en esos momentos estaba durmiendo profundamente. Comí más pimentón en el desayuno, una especie de potaje hecho de harina de maíz que dicen era \"mamaliga\", y berenjena rellena con picadillo, un excelente plato al cual llaman \"impletata\" (recordar obtener también la receta de esto). Me apresuré a desayunarme, ya que el tren salía un poco después de las ocho, o, mejor dicho, debió haber salido, pues después de correr a la estación a las siete y media tuve que aguardar sentado en el vagón durante más de una hora antes de que nos pusiéramos en movimiento. Me parece que cuanto más al este se vaya, menos puntuales son los trenes. ¿Cómo serán en China? Pareció que durante todo el día vagábamos a través de un país que estaba lleno de toda clase de bellezas. A veces vimos pueblecitos o castillos en la cúspide de empinadas colinas, tales como se ven en los antiguos misales; algunas veces corrimos a la par de ríos y arroyuelos, que por el amplio y pedregoso margen a cada lado de ellos, parecían estar sujetos a grandes inundaciones. Se necesita gran cantidad de agua, con una corriente muy fuerte, para poder limpiar la orilla exterior de un río. En todas las estaciones había grupos de gente, algunas veces multitudes, y con toda clase de atuendos."),
      new BookElement(booksX + 220, 10, "Frankenstein Cap2", "Los acontecimientos que influyen decisivamente en nuestros destinos a menudo tienen su origen en sucesos triviales. La filosofía natural es el genio que ha ordenado mi destino. Así pues, en este resumen de mis primeros años, deseo explicar aquellos hechos que me condujeron a sentir una espe- cial predilección por la ciencia. Cuando tenía once años, fuimos todos de excursión a los baños que hay cerca de Thonon. Las inclemencias del tiem- po nos obligaron a quedarnos todo un día encerrados en la posada. En aque- lla casa, por casualidad, encontré un volumen con las obras de Cornelio Agrippa. Lo abrí sin mucho interés; la teoría que intentaba demostrar y los maravillosos hechos que relataba pronto cambiaron aquella apatía en entu- siasmo. Una nueva luz se derramó sobre mi entendimiento; y, dando saltos de alegría, comuniqué aquel descubrimiento a mi padre. No puedo dejar de señalar aquí cuántas veces los maestros tienen ocasión de dirigir los gustos de sus alumnos hacia conocimientos útiles y cuántas veces lo desaprove- chan inconscientemente. Mi padre observó sin mucho interés la cubierta del libro y dijo: —¡Ah… Cornelio Agrippa! Mi querido Víctor, no pierdas el tiempo en estas cosas; no son más que tonterías inútiles. Si en vez de esta advertencia, o incluso esa exclamación, mi padre se hu- biera tomado la molestia de explicarme que las teorías de Agrippa ya ha- bían quedado completamente refutadas y que se había instaurado un sistema científico moderno que tenía mucha más relevancia que el antiguo, porque el del antiguo era pretencioso y quimérico, mientras que las intenciones del moderno eran reales y prácticas… en esas circunstancias, con toda seguri- dad habría desechado el Agrippa y, teniendo la imaginación ya tan excitada, probablemente me habría aplicado a una teoría más racional de la química que ha dado como resultado los descubrimientos modernos. Es posible in- cluso que mis ideas nunca hubieran recibido el impulso fatal que me condu- jo a la ruina. Pero aquella mirada displicente que mi padre había lanzado al libro en ningún caso me aseguraba que supiera siquiera de qué trataba, así que continué leyendo aquel volumen con la mayor avidez. Cuando regresé a casa, mi primera ocupación fue procurarme todas las obras de ese autor y, después, las de Paracelso y las de Alberto Magno. Leí y estudié con deleite las locas fantasías de esos autores; me parecían tesoros que conocían muy pocos aparte de mí; y aunque a menudo deseé comunicar a mi padre aquellos conocimientos secretos, sin embargo, su firme desapro- bación de Agrippa, mi autor favorito, siempre me retuvo. De todos modos, le descubrí mi secreto a Elizabeth, bajo la estricta promesa de guardar se- creto, pero no pareció muy interesada en la materia, así que continué mis estudios solo. Puede resultar un poco extraño que en el siglo XVIII apareciera un discí- pulo de Alberto Magno; pero yo no pertenecía a una familia de científicos ni había asistido a ninguna clase en Ginebra. Así pues, la realidad no entur- biaba mis sueños y me entregué con toda la pasión a la búsqueda de la pie- dra filosofal y el elixir de la vida. Y esto último acaparaba toda mi atención; la riqueza era para mí un asunto menor, ¡pero qué fama alcanzaría mi des- cubrimiento si yo pudiera eliminar la enfermedad de la condición humana y conseguir que el hombre fuera invulnerable a cualquier cosa excepto a una muerte violenta! Esas no eran mis únicas ensoñaciones; invocar la aparición de fantasmas y demonios era una sugerencia constante de mis escritores favoritos, y yo ansiaba poder hacerlo inmediatamente; y si mis encantamientos nunca re- sultaban exitosos, yo atribuía los fracasos más a mi inexperiencia y a mis errores que a la falta de inteligencia o a la incompetencia de mis maestros. Los fenómenos naturales que tienen lugar todos los días delante de nues- tros ojos no me pasaban desapercibidos. La destilación, de la cual mis auto- res favoritos eran absolutamente ignorantes, me causaba asombro, pero con lo que me quedé maravillado fue con algunos experimentos con una bomba de aire que llevaba a cabo un caballero al que solíamos visitar. La ignorancia de mis filósofos en estas y muchas otras disciplinas sirvie- ron para desacreditarlos a mis ojos… pero no podía apartarlos a un lado de- finitivamente antes de que algún otro sistema ocupara su lugar en mi mente. Cuando tenía alrededor de catorce años, estábamos en nuestra casa cerca de Belrive y fuimos testigos de una violenta y terrible tormenta. Había baja- do desde el Jura y los truenos estallaban unos tras otros con un aterrador es- truendo en los cuatro puntos cardinales del cielo. Mientras duró la tormenta, yo permanecí observando su desarrollo con curiosidad y asombro. Cuando estaba allí, en la puerta, de repente, observé un rayo de fuego que se levan- taba desde un viejo y precioso roble que se encontraba a unas veinte yardas de nuestra casa; y en cuanto aquella luz resplandeciente se desvaneció, pude ver que el roble había desaparecido, y no quedaba nada allí, salvo un tocón abrasado. A la mañana siguiente, cuando fuimos a verlo, nos encontramos el árbol increíblemente carbonizado; no se había rajado por el impacto, sino que había quedado reducido por completo a astillas de madera. Nunca vi una cosa tan destrozada."),
      new BookElement(booksX + 440, 10, "Moby Dick Cap1", "Llamadme Ismael. Hace unos años —no importa cuánto hace exactamente—, teniendo poco o ningún dinero en el bolsillo, y nada en particular que me interesara en tierra, pensé que me iría a navegar un poco por ahí, para ver la parte acuática del mundo. Es un modo que tengo de echar fuera la melancolía y arreglar la circulación. Cada vez que me sorprendo poniendo una boca triste; cada vez que en mi alma hay un noviembre húmedo y lloviznoso; cada vez que me encuentro parándome sin querer ante las tiendas de ataúdes; y, especialmente, cada vez que la hipocondría me domina de tal modo que hace falta un recio principio moral para impedirme salir a la calle con toda deliberación a derribar metódicamente el sombrero a los transeúntes, entonces, entiendo que es más que hora de hacerme a la mar tan pronto como pueda. Es mi sustitutivo de la pistola y la bala. Con floreo filosófico, Catón se arroja sobre su espada; yo, calladamente, me meto en el barco. No hay nada sorprendente en esto. Aunque no lo sepan, casi todos los hombres, en una o en otra ocasión, abrigan sentimientos muy parecidos a los míos respecto al océano. Ahí tenéis la ciudad insular de los Manhattos, ceñida en torno por los muelles como las islas indias por los arrecifes de coral: el comercio la rodea con su resaca. A derecha y a izquierda, las calles os llevan al agua. Su extremo inferior es la Batería, donde esa noble mole es bañada por olas y refrescada por brisas que pocas horas antes no habían llegado a avistar tierra. Mirad allí las turbas de contempladores del agua. Pasead en torno a la ciudad en las primeras horas de una soñadora tarde de día sabático. Id desde Corlears Hook a Coenties Slip, y desde allí, hacia el norte, por Whitehall. ¿Qué veis? Apostados como silenciosos centinelas alrededor de toda la ciudad, hay millares y millares de seres mortales absortos en ensueños oceánicos. Unos apoyados contra las empalizadas; otros sentados en las cabezas de los atracaderos; otros mirando por encima de las amuradas de barcos arribados de la China; algunos, en lo alto de los aparejos, como esforzándose por obtener una visión aún mejor hacia la mar. Pero ésos son todos ellos hombres de tierra; los días de entre semana, encerrados entre tablas y yeso, atados a los mostradores, clavados a los bancos, sujetos a los escritorios. Entonces ¿cómo es eso? ¿Dónde están los campos verdes? ¿Qué hacen éstos aquí? Pero ¡mirad! Ahí vienen más multitudes, andando derechas al agua, y al parecer dispuestas a zambullirse. ¡Qué extraño! Nada les satisface sino el límite más extremo de la tierra firme; no les basta vagabundear al umbroso socaire de aquellos tinglados. No. Deben acercarse al agua tanto como les sea posible sin caerse dentro. Y ahí se quedan: millas seguidas de ellos, leguas. De tierra adentro todos, llegan de avenidas y callejas, de calles y paseos; del norte, este, sur y oeste. Pero ahí se unen todos. Decidme, ¿les atrae hacia aquí el poder magnético de las agujas de las brújulas de todos estos barcos? Una vez más. Digamos que estáis en el campo; en alguna alta tierra con lagos. Tomad casi cualquier sendero que os plazca, y apuesto diez contra uno a que os lleva por un valle abajo, y os deja junto a un remanso de la corriente. Hay magia en ello. Que el más distraído de los hombres esté sumergido en sus más profundos ensueños: poned de pie a ese hombre, haced que mueva las piernas, e infaliblemente os llevará al agua, si hay agua en toda la región. En caso de que alguna vez tengáis sed en el gran desierto americano, probad este experimento, si vuestra caravana está provista por casualidad de un cultivador de la metafísica. Sí, como todos saben, la meditación y el agua están emparejadas para siempre. Pero aquí hay un artista. Desea pintaros el trozo de paisaje más soñador, más sombrío, más callado, más encantador de todo el valle del Saco. ¿Cuál es el principal elemento que emplea? Ahí están sus árboles cada cual con su tronco hueco, como si hubiera dentro un ermitaño y un crucifijo; ahí duerme su pradera, y allí duermen sus ganados; y de aquella casita se eleva un humo soñoliento. Hundiéndose en lejanos bosques, serpentean un revuelto sendero, hasta alcanzar estribaciones sobrepuestas de montañas que se bañan en el azul que las envuelve.")
    };

    keyBook = getRandomBook();
    message = getRandomMessage();
    encodedMessage = keyBook.cipher(message);

    directions = new NoteElement(books[2].w + books[2].x + 10, keyBook.y, "Decifra el mensaje cifrado de la forma [pagina]-[# palabra] utilizando uno de los libros.");
    postit = new NoteElement(booksX, keyBook.y + keyBook.h + 10, "Mensaje cifrado:\n" + encodedMessage);
    openBook = new OpenBookElement(booksX + postit.w + 10, postit.y);
    answer = new AnswerElement(booksX, postit.h + postit.y + 10, encodedMessage);
    gameEnd = new ImageElement(0, 0 , 1500, 732, "game_end.png");
  }

  void draw() {
    boolean overAnyClickable = false;
      
    background(114, 80, 16);

    if (inputIsVisible == false && !answer.isFinished) {
      answer.createInputField();
      inputIsVisible = true;
    }
    
    for (BookElement book: books) {
      book.draw();
      if (book.isMouseOver()) {
        overAnyClickable = true;
      }
    }

    if (bookOpened) {
      openBook.draw(activeBook);
      if (openBook.prevPage.isMouseOver() && openBook.pageIndex > 0 ||
        openBook.nextPage.isMouseOver() && openBook.pageIndex + 2 < openBook.book.pages.length) {
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
    directions.draw();
    
    if (answer.isFinished) {
      gameEnd.draw();
      if (inputIsVisible == true) {
        cp5.getController("input").remove();
        inputIsVisible = false;
        if(StartTime == 0){
          StartTime = millis();
        }
        
        if(millis()-StartTime >= 3000){
          screen = 0;
        }  
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
        String c = keyBook.cipher(inpt) + " -> " + inpt;
        if (answer.decodedWords[i] != null && answer.decodedWords[i].equals(c)) {
            alreadyDecoded = true;
            break;
        }
    }

    if (inMessage && notInEncoded && !alreadyDecoded) {
      println(keyBook.cipher(inpt) + " -> " + inpt);
      answer.decodedWords[answer.decodedIndex] = keyBook.cipher(inpt) + " -> " + inpt;
      answer.decodedIndex++;
    }
  }

  void mouseClicked() {
    for (BookElement book: books) {
      if (book.isMouseOver() && book != activeBook) {
        bookOpened = true;
        activeBook = book;
        openBook.pageIndex = 0;
      }
    }

    if (openBook.prevPage.isMouseOver() && openBook.pageIndex > 0) {
      openBook.prevPage.trigger(-1);
    } else if (openBook.nextPage.isMouseOver() && openBook.pageIndex + 2 < openBook.book.pages.length) {
      openBook.prevPage.trigger(1);
    }
  }
}

class Element {
  int x, y, w, h;
  Element(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  public void draw() {};
  public void onClick() {};

  public boolean isMouseOver() {
    if (mouseX >= this.x && mouseX <= this.x + this.w && mouseY >= this.y && mouseY <= this.y + this.h) {
      return true;
    }

    return false;
  }
}

class ImageElement extends Element {
  PImage img;

  ImageElement(int x, int y, int w, int h, String imgpath) {
    super(x, y, w, h);
    this.img = loadImage(imgpath);
  }

  public void draw() {
    image(img, this.x, this.y, this.w, this.h);
  }
}

class BookElement extends ImageElement {
  String title;
  String[] pages;

  BookElement(int x, int y, String title, String text) {
    super(x, y, 200, 240, "book_purple.png");
    this.title = title;
    this.pages = this.splitIntoPages(text, 20);
  }

  public String cipher(String text) {
    String encoded = "";

    for (String termino: text.split(" ")) {
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
    fill(225);
    textSize(32);
    image(img, this.x, this.y, this.w, this.h);
    text(this.title, this.x + 20, this.y + 60, this.w - 30, this.h - 60);
  }
}

class NoteElement extends ImageElement {
  String encoded;
  NoteElement(int x, int y, String encoded) {
    super(x, y, 360, 240, "note.png");
    this.encoded = encoded;
  }

  public void draw() {
    textSize(32);
    fill(0);
    image(img, this.x, this.y, this.w, this.h);
    text(this.encoded, this.x + 10, this.y + 10, this.w - 40, this.h - 20);
  }
}

class AnswerElement extends NoteElement {
  String[] decodedWords;
  int decodedIndex = 0;
  int uniqueWords = 0;
  Boolean isFinished = false;
  AnswerElement(int x, int y, String encodedMessage) {
    super(x, y, "Notas:");

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
      .setPosition(this.x + 10, this.y + 42)
      .setSize(this.w - 60, 32)
      .setAutoClear(false)
      .setFont(createFont("Arial", 32))
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
    
    textSize(32);
    fill(0);
    image(img, this.x, this.y, this.w, this.h + (decodedWords.length * 15));
    text(this.encoded, this.x + 10, this.y + 10, this.w - 20, this.h - 20);
    text(String.join("\n", this.decodedWords), this.x + 10, this.y + 90, this.w - 20, this.h-10);
  }
}

class OpenBookElement extends ImageElement {
  int pageIndex = 0;

  boolean overAnyButton = false;
  OpenBookButton nextPage;
  OpenBookButton prevPage;

  BookElement book;

  OpenBookElement(int x, int y) {
    super(x, y, 1000, 600, "book_open.png");

    nextPage = new OpenBookButton(this.x + this.w - 90 , this.y, this);
    prevPage = new OpenBookButton(this.x, this.y, this);
  }

  public void draw(BookElement book) {
    this.book = book;

    image(img, this.x, this.y, this.w, this.h);
    textSize(48);
    fill(0, 0, 0);

    text(book.pages[this.pageIndex], this.x + 90, this.y + 10, 390, 600);
    if (this.pageIndex + 1 < book.pages.length) {
      text(book.pages[this.pageIndex + 1], this.x + (this.w / 2) + 10, this.y + 10, 390, 600);
    }

    if (this.pageIndex > 0) {
      prevPage.draw();
    }

    if (this.pageIndex + 2 < book.pages.length) {
      nextPage.draw();
    }
  }
}

class OpenBookButton extends Element {
  OpenBookElement parent;
  OpenBookButton(int x, int y, OpenBookElement parent) {
    super(x, y, 90, parent.h);
    this.parent = parent;
  }

  public void draw() {
    fill(255, 223, 211);
    //rect(this.x, this.y, this.w, this.parent.h);
  }

  public void trigger(int mode) {
    if (mode == -1) {
      this.parent.pageIndex -= 2;
    } else {
      this.parent.pageIndex += 2;
    }
  }
}
