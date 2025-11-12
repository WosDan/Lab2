class Frame{
  protected float x;
  protected float y;
  protected float size;
  protected int state;
  protected int lastChange = 0;
  protected PImage sprites[];
  
  Frame(float x, float y, float size, int state, PImage sprites[]){
    this.x = x;
    this.y = y;
    this.size = size;
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
    if(state == 0) {image(sprites[0], x, y, size, size);}
    if(state == 1) {image(sprites[1], x, y, size, size);}
    if(state == 2) {image(sprites[2], x, y, size, size);}
    //if(state == 0) { fill(0, 0, 0, 0); };
    //if(state == 1) { fill(240, 212, 110, 70); };
    //if(state == 2) { fill(199, 60, 36, 70); };
    square(x, y, size);
    noFill();
  }
  
  public int button(){
    return 0;
  }
  
  public void mouseHover() {
    if(mouseX > x && mouseX < x + size &&
       mouseY > y && mouseY < y + size
       ){
       fill(0, 0, 0, 50);
       rect(x, y, size, size);
       noFill();
    }
  }
  
  public void mouseCollision(ScoreManager score){
    if(mouseX > x && mouseX < x + size &&
       mouseY > y && mouseY < y + size &&
       mousePressed && state == 1){
       state = 0;
       score.addPoints(1);
    }
  }
  
  public void corruption(int changeInterval){
    if(state == 1){
      if(millis()-lastChange >= changeInterval){
        state = 2;  
        lastChange = millis();
      }  
    }
  }
}
