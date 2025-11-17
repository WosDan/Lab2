class FrameG2 extends Frame{  
  private int impostor;
  private int id;
  private String name;
  private PImage spritesHover[];
  
  FrameG2(float x, float y, float fWidth, float fHeight, int impostor, PImage sprites[], PImage[] spritesHover, int id, String name){
    super(x,y, fWidth, 0,sprites);
    this.fHeight = fHeight;
    this.impostor = impostor;
    this.name = name;
    this.spritesHover = spritesHover;
    this.id = id;
  }
  
  public void display(){
    image(sprites[impostor], x, y, fWidth, fHeight);
    noFill();
    textFont(amongUsFont);
    fill(0);
    textSize(26);
    text(name, x + fWidth/3 - 1, y + fHeight/4 + 5);
    text(name, x + fWidth/3 + 1, y + fHeight/4 + 5);
    text(name, x + fWidth/3,     y + fHeight/4 + 4);
    text(name, x + fWidth/3,     y + fHeight/4 + 6);
    fill(255);
    text(name, x + fWidth/3, y + fHeight/4 + 5);
    noFill();
  }
  
  @Override
  public int button(){
    if(mouseX > x && mouseX < x + fWidth &&
       mouseY > y && mouseY < y + fHeight &&
       mouseJustReleased){
         displayFullScreen("xD");
       return this.impostor;
    }
    return 0;
  }
  
  public void displayFullScreen(String correo){
          
  }

  
  public void mouseHover() {
    if(mouseX > x && mouseX < x + fWidth &&
       mouseY > y && mouseY < y + fHeight
       ){  
      image(spritesHover[impostor], x, y, fWidth, fHeight);
      textFont(amongUsFont);
      fill(0);
      textSize(26);
      text(name, x + fWidth/3 - 1, y + fHeight/4 + 5);
      text(name, x + fWidth/3 + 1, y + fHeight/4 + 5);
      text(name, x + fWidth/3,     y + fHeight/4 + 4);
      text(name, x + fWidth/3,     y + fHeight/4 + 6);
      fill(165);
      text(name, x + fWidth/3, y + fHeight/4 + 5);
      noFill();
    }

       noFill();
    }
}
