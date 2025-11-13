class Frame{
  protected float x;
  protected float y;
  protected float fWidth;
  protected float fHeight;
  protected int state;
  protected int lastChange;
  protected PImage sprites[];
  
  public Frame(float x, float y, float size, int state, PImage sprites[]){
    this.x = x;
    this.y = y;
    this.fWidth = size;
    this.fHeight = size;
    this.state = state;
    this.sprites = sprites;
  }
  
  public int getState(){
    return this.state;
  }
  
  public void setState(int state){
    this.state = state;
    if(state == 1) {
      lastChange = millis();
    }
  }
  
  public void display(){
    if(state == 0) {image(sprites[0], x, y, fWidth, fHeight);}
    if(state == 1) {image(sprites[1], x, y, fWidth, fHeight);}
    if(state == 2) {image(sprites[2], x, y, fWidth, fHeight);}
    //if(state == 0) { fill(0, 0, 0, 0); };
    //if(state == 1) { fill(240, 212, 110, 70); };
    //if(state == 2) { fill(199, 60, 36, 70); };
    noFill();
  }
  
  public int button(){
    return 0;
  }
  
  public void mouseHover() {
    if(mouseX > x && mouseX < x + fWidth &&
       mouseY > y && mouseY < y + fHeight
       ){
       fill(0, 0, 0, 50);
       rect(x, y, fWidth, fHeight);
       noFill();
    }
  }
  
  public void mouseCollision(ScoreManager score){
    if(mouseX > x && mouseX < x + fWidth &&
       mouseY > y && mouseY < y + fHeight &&
       mousePressed && state == 1){
       state = 0;
       score.addPoints(1);
    }
  }
  
  public void corruption(int changeInterval, int now, float gameSpeed){
    if(state == 1){
      if((now - lastChange)*gameSpeed >= changeInterval){
        state = 2;  
        lastChange = now;
      }  
    }
  }
}
