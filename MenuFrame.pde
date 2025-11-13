class MenuFrame extends Frame{  
  private int game;
  MenuFrame(float x, float y, float fWidth, float fHeight, int game, PImage sprites[]){
    super(x,y, fWidth, 0,sprites);
    this.fHeight = fHeight;
    this.game = game;
  }
  
  @Override      
  public void display(){
    if(game == 1) {image(sprites[0], x, y, fWidth, fHeight);}
    if(game == 2) {image(sprites[1], x, y, fWidth, fHeight);}
    if(game == 3) {image(sprites[0], x, y, fWidth, fHeight);}
    if(game == 4) {image(sprites[0], x, y, fWidth, fHeight);}
    noFill();
  }
  
  @Override
  public int button(){
    if(mouseX > x && mouseX < x + fWidth &&
       mouseY > y && mouseY < y + fHeight &&
       mousePressed){
       return this.game;
    }
    return 0;
  }
  
  public void mouseHover() {
    if(mouseX > x && mouseX < x + fWidth &&
       mouseY > y && mouseY < y + fHeight
       ){
       fill(0, 0, 0, 50);
       rect(x, y, fWidth, fHeight, 25);
       
       noFill();
    }
  }
}
