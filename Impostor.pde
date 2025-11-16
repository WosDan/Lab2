class Impostor{  
  private float x;
  private float y;
  private float fWidth;
  private float fHeight;
  private boolean impostor;
  private String name;
  private String texto;
  private PImage sprite;
  private PImage spriteHover;
  private boolean expelled = false;
  public boolean error = false;
  public boolean counted = false;
  public boolean activeD = true;
  private EjectionAnimation animation;
  public boolean activeExp = false;
  private ImpostorGrid grid; 

  Impostor(float x, float y, float fWidth, float fHeight,
           boolean impostor, PImage sprite, PImage spriteHover,
           String name, String texto, ImpostorGrid grid){
    this.x = x;
    this.y = y;
    this.fWidth = fWidth;
    this.fHeight = fHeight;
    this.fHeight = fHeight;
    this.impostor = impostor;
    this.name = name;
    this.texto = texto;
    this.sprite = sprite;
    this.spriteHover = spriteHover;
    this.grid = grid;
    this.animation = new EjectionAnimation(loadImage("./src/img/ejection_skeld.png"), this.sprite, name);
  }
  
  public void display(){
    image(expelled ? spriteHover : sprite, x, y, fWidth, fHeight);
    textFont(amongUsFont);
    textSize(28);
    float tx = x + fWidth*0.33;
    float ty = y + fHeight*0.25 + 5;
    
    fill(0);
    text(name, tx-1, ty-1);
    text(name, tx+1, ty-1);
    text(name, tx-1, ty+1);
    text(name, tx+1, ty+1);

    fill(expelled ? 165 : 255);
    text(name, tx, ty);
    noFill();    
  }
  
  public void mouseHover(){
    if(!grid.activeDialog && !grid.activeExp && !expelled && mouseX > x && mouseX < x + fWidth &&
       mouseY > y && mouseY < y + fHeight){
      image(spriteHover, x, y, fWidth, fHeight);
      textFont(amongUsFont);
      textSize(28);
      float tx = x + fWidth*0.33;
      float ty = y + fHeight*0.25 + 5;
      fill(0);
      text(name, tx-1, ty-1);
      text(name, tx+1, ty-1);
      text(name, tx-1, ty+1);
      text(name, tx+1, ty+1);
      
      fill(165);
      text(name, tx, ty);
      noFill();
    }
  }
  
  public void mouseButton(){
    if(!grid.activeDialog && !grid.activeExp && !expelled && mouseX > this.x && mouseX < this.x + fWidth &&
       mouseY > y && mouseY < this.y + this.fHeight && mousePressed){
      this.grid.activeDialog = true;
      this.activeD = true;
      
      for(Impostor imp : grid.impostores){
        if(imp != this) imp.activeD = false;
      }
    }
  }

  public void displayDialog(){
    if(grid.activeDialog){
      pushStyle();
      fill(0, 180);
      rect(0, 0, width, height);

      fill(255);
      rect(width*0.3, height*0.2, width*0.4, height*0.6);
      textFont(amongUsFont);
      noFill();
      textSize(24);
      fill(0);
      text(this.texto, width*0.33, height*0.22, width*0.4, height*0.6);
      fill(255);
      textAlign(CENTER, TOP);
      text(this.name, width/2, height-140);


      // Botón Cerrar
      fill(166);
      rect(width/2 - 45, height - 100, 100, 30);
      fill(255);
      text("Cerrar", width/2, height - 95);
      
      // Botón Aprobar (verde)
      fill(0,200,0);
      rect(width/2 - 150, height - 60, width*0.094, 40);
      fill(255);
      text("Aprobar", width/2 - 83, height - 50);

      // Botón Expulsar (rojo)
      fill(200,0,0);
      rect(width/2 + 20, height - 60, width*0.094, 40);
      fill(255);
      text("Expulsar", width/2 + 85, height - 50);

      if(mousePressed &&
         mouseX > width/2 - 45 && mouseX < width/2 - 45 + 100 &&
         mouseY > height - 100 && mouseY < height - 70){
         this.activeD = false;
         this.grid.activeDialog = false;
         grid.count();  
      }
      
      // Colisión Aprobar
      if(mousePressed &&
         mouseX > width/2 - 150 && mouseX < width/2 - 150 + width*0.094 &&
         mouseY > height - 60 && mouseY < height - 20){
         counted = true;
         activeD = false;
         grid.activeDialog = false;
         if(impostor == true){
           this.error = true;
         }else{
           this.error = false;
         }
         grid.count();
      }
      
      // Colisión Expulsar
      if(mousePressed &&
         mouseX > width/2 + 20 && mouseX < width/2 + 20 + width*0.094 &&
         mouseY > height - 60 && mouseY < height - 20){
         this.counted = true;
         this.expelled = true;
         this.activeD = false;
         grid.activeDialog = false;
         if(impostor == false){
           this.error = true;
         }else{
           this.error = false;
         }
         this.activeExp = true;
         this.grid.activeExp = true;
         this.grid.count();         
      }
      popStyle();
    }

  }
  public void displayAnimation(){
    if(this.activeExp){
      animation.display();
      if(animation.getTime().getMillis() >= animation.getTime().getFinalTime()){
       this.activeExp = false;
       this.grid.activeExp = false;
      }
    }
  }
}
