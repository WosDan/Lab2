class Element {
  int x,y,w,h;
  Element (int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void draw(){};
  public void onClick(){};
  
  public boolean isMouseOver() {
    if (mouseX >= this.x && mouseX <= this.x+this.w && mouseY >= this.y && mouseY <= this.y+this.h) {
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
    super(x, y, 100, 120, "book_purple.png");
    this.title = title;
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
            encoded += String.valueOf(i+1) + "-" + String.valueOf(j+1) + " ";
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
        return new String[]{};
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
    textSize(16);
    image(img, this.x, this.y, this.w, this.h);
    text(this.title, this.x+10, this.y+30, this.w - 30, this.h - 60);
  }
}

class NoteElement extends ImageElement {
  String encoded;
  NoteElement(int x, int y, String encoded) {
    super(x, y, 180, 120, "note.png");
    this.encoded = encoded;
  }
  
  public void draw() {
     textSize(16);
     fill(0);
     image(img, this.x, this.y, this.w, this.h);
     text(this.encoded, this.x+10, this.y+10, this.w - 20, this.h - 60);
  }
}

class AnswerElement extends NoteElement {
  String[]decodedWords;
  int decodedIndex = 0;
  AnswerElement(int x, int y, String encodedMessage) {
    super(x, y, "Notas:");
    
    cp5.addTextfield("input")
    .setPosition(this.x+10, this.y+30)
    .setSize(this.w-30, 30)
    .setAutoClear(false)
    .setFont(createFont("Arial", 12))
    .setColor(color(0))
    .setColorBackground(color(196, 181, 121))
    .setColorForeground(color(155, 142, 97))
    .setColorActive(color(155, 142, 97))
    .setLabel("");
    
    decodedWords = new String[encodedMessage.split(" ").length];
    for (int i = 0; i < decodedWords.length; i++) {
      decodedWords[i] = "";
    }
  }
    
  void draw() {
     textSize(16);
     fill(0);
     image(img, this.x, this.y, this.w, this.h);
     text(this.encoded, this.x+10, this.y+10, this.w - 20, this.h - 60);
     text(String.join("\n", this.decodedWords), this.x+10, this.y+70, this.w - 20, this.h - 60);
  }
}

class OpenBookElement extends ImageElement {
  int pageIndex = 0;
  
  boolean overAnyButton = false;
  OpenBookButton nextPage;
  OpenBookButton prevPage;
  
  BookElement book;

  OpenBookElement(int x, int y) {
    super(x, y, 500, 300, "book_open.png");
    
    nextPage = new OpenBookButton(this.x + this.w - 43, this.y + this.h-21, this);
    prevPage = new OpenBookButton(this.x + 11, this.y + this.h-21, this);
  }
  
  public void draw(BookElement book) {
    this.book = book;
    
    image(img, this.x, this.y, this.w, this.h);
    textSize(24); 
    fill(0,0,0);
    
    text(book.pages[this.pageIndex], this.x+50, this.y+10, 180, 300);
    if (this.pageIndex+1 < book.pages.length) {
      text(book.pages[this.pageIndex+1], this.x+260, this.y+10, 180, 300);
    }
    
    if (this.pageIndex > 0) {
      prevPage.draw();
    }
    
    if (this.pageIndex+2 < book.pages.length) {
      nextPage.draw();
    }
  }
}

class OpenBookButton extends Element {
  OpenBookElement parent;
  OpenBookButton(int x, int y, OpenBookElement parent) {
    super(x, y, 30, 20);
    this.parent = parent;
  }
  
  public void draw() {
    fill(255, 223, 211);
    rect(this.x, this.y , this.w, this.h);
  }
  
  public void trigger(int mode) {
    if (mode == -1) {
      this.parent.pageIndex -= 2;
    } else {
      this.parent.pageIndex += 2;
    }
  }
}
