class MenuFrame extends Frame{  
  private int game;
  MenuFrame(float x, float y, float size, int game, PImage sprites[]){
    super(x,y,size,0,sprites);
    this.game = game;
  }
  
  @Override      
  public void display(){
    if(game == 1) {image(sprites[0], x, y, size, size);}
    if(game == 2) {image(sprites[1], x, y, size, size);}
    if(game == 3) {image(sprites[0], x, y, size, size);}
    if(game == 4) {image(sprites[0], x, y, size, size);}
    noFill();
  }
  
  @Override
  public int button(){
    if(mouseX > x && mouseX < x + size &&
       mouseY > y && mouseY < y + size &&
       mousePressed){
       return this.game;
    }
    return 0;
  }
  
  public void mouseHover() {
    if(mouseX > x && mouseX < x + size &&
       mouseY > y && mouseY < y + size
       ){
       fill(0, 0, 0, 50);
       rect(x, y, size, size, 33);
       
       noFill();
    }
  }
}
