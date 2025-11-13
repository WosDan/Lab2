class FrameG2 extends Frame{  
  private int impostor;
  private PImage spritesHover[];
  FrameG2(float x, float y, float fWidth, float fHeight, int impostor, PImage sprites[], PImage[] spritesHover){
    super(x,y, fWidth, 0,sprites);
    this.fHeight = fHeight;
    this.impostor = impostor;
    this.spritesHover = spritesHover;
  }
  
  @Override      
  public void display(){
    if(impostor == 1) {image(sprites[0], x, y, fWidth, fHeight);}
    if(impostor == 2) {image(sprites[1], x, y, fWidth, fHeight);}
    if(impostor == 3) {image(sprites[2], x, y, fWidth, fHeight);}
    if(impostor == 4) {image(sprites[3], x, y, fWidth, fHeight);}
    if(impostor == 5) {image(sprites[4], x, y, fWidth, fHeight);}
    if(impostor == 6) {image(sprites[5], x, y, fWidth, fHeight);}
    if(impostor == 7) {image(sprites[6], x, y, fWidth, fHeight);}
    if(impostor == 8) {image(sprites[7], x, y, fWidth, fHeight);}
    if(impostor == 9) {image(sprites[8], x, y, fWidth, fHeight);}
    if(impostor == 10) {image(sprites[9], x, y, fWidth, fHeight);}
    if(impostor == 11) {image(sprites[10], x, y, fWidth, fHeight);}
    if(impostor == 12) {image(sprites[11], x, y, fWidth, fHeight);}
    noFill();
  }
  
  @Override
  public int button(){
    if(mouseX > x && mouseX < x + fWidth &&
       mouseY > y && mouseY < y + fHeight &&
       mousePressed){
       return this.impostor;
    }
    return 0;
  }
  
  public void mouseHover() {
    if(mouseX > x && mouseX < x + fWidth &&
       mouseY > y && mouseY < y + fHeight
       ){  
      if(impostor == 1) {image(spritesHover[0], x, y, fWidth, fHeight);}
      if(impostor == 2) {image(spritesHover[1], x, y, fWidth, fHeight);}
      if(impostor == 3) {image(spritesHover[2], x, y, fWidth, fHeight);}
      if(impostor == 4) {image(spritesHover[3], x, y, fWidth, fHeight);}
      if(impostor == 5) {image(spritesHover[4], x, y, fWidth, fHeight);}
      if(impostor == 6) {image(spritesHover[5], x, y, fWidth, fHeight);}
      if(impostor == 7) {image(spritesHover[6], x, y, fWidth, fHeight);}
      if(impostor == 8) {image(spritesHover[7], x, y, fWidth, fHeight);}
      if(impostor == 9) {image(spritesHover[8], x, y, fWidth, fHeight);}
      if(impostor == 10) {image(spritesHover[9], x, y, fWidth, fHeight);}
      if(impostor == 11) {image(spritesHover[10], x, y, fWidth, fHeight);
      if(impostor == 12) {image(spritesHover[11], x, y, fWidth, fHeight);}
    }
      
       noFill();
    }
  }
}
