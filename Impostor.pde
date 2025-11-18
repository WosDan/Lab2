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
  private PImage amongusito;
  private boolean expelled = false;
  public boolean error = false;
  public boolean counted = false;
  public boolean activeD = true;
  private EjectionAnimation animation;
  public boolean activeExp = false;
  private ImpostorGrid grid; 
  private boolean dialogBtnPressed;
  public PImage dialog;

  Impostor(float x, float y, float fWidth, float fHeight,
           boolean impostor, PImage sprite, PImage spriteHover, PImage amongusito,
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
    this.amongusito = amongusito;
    this.grid = grid;
    this.animation = new EjectionAnimation(loadImage("./src/img/ejection_skeld.png"), this.amongusito, name);
  }
  
  public void display(){
    pushStyle();
    image(expelled ? spriteHover : sprite, x, y, fWidth, fHeight);
    textFont(amongUsFont);
    textAlign(CORNER);
    textSize(28);
    float tx = x + fWidth*0.33;
    float ty = y + fHeight*0.25 + 13;
    
    String sbs = name.substring(0, name.length() >= 10 ? 9 : name.length());
    
    fill(0);
    text(sbs, tx-1, ty-1);
    text(sbs, tx+1, ty-1);
    text(sbs, tx-1, ty+1);
    text(sbs, tx+1, ty+1);

    fill(expelled ? 165 : 255);
    text(sbs, tx, ty);
    noFill();    
    popStyle();
  }
  
  public void mouseHover(){
    if(!grid.activeDialog && !grid.activeExp && !expelled && mouseX > x && mouseX < x + fWidth &&
      mouseY > y && mouseY < y + fHeight){
      pushStyle();
      textAlign(CORNER);
      image(spriteHover, x, y, fWidth, fHeight);
      textFont(amongUsFont);
      textSize(28);
      float tx = x + fWidth*0.33;
      float ty = y + fHeight*0.25 + 13;
      fill(0);
      String sbs = name.substring(0, name.length() >= 10 ? 9 : name.length());
      text(sbs, tx-1, ty-1);
      text(sbs, tx+1, ty-1);
      text(sbs, tx-1, ty+1);
      text(sbs, tx+1, ty+1);
      
      fill(165);
      text(sbs, tx, ty);
      noFill();
      popStyle();
    }
  }
  
  public void mouseButton(){
    if(!grid.activeDialog && !grid.activeExp && !expelled && mouseX > this.x && mouseX < this.x + fWidth &&
       mouseY > y && mouseY < this.y + this.fHeight && mouseJustReleased){
      this.dialogBtnPressed = true; //permite arreglar un bug
      this.grid.activeDialog = true;
      this.activeD = true;      
      for(Impostor imp : grid.impostores){
        if(imp != this) imp.activeD = false;
      }
    }
  }

  public void displayDialog(){
    if(grid.activeDialog && !dialogBtnPressed){
      pushStyle();
      image(this.dialog, 0, 0, width, height);

      textSize(36);
      fill(0);
      text(this.texto, width*0.15, height*0.2, width*0.7, height*0.6);
      fill(255);
      textAlign(CENTER, TOP);
      //text(this.name, width/2, height-140);
      noFill();


      // Botón Cerrar
      //rect(width *0.915, height*0.0775, width*0.0575, width*0.0575);
      
      // Botón Aprobar (verde)
      //fill(0,200,0);
      //rect(width*0.1, height * 0.855, width*0.08, height * 0.115);
      //fill(255);

      // Botón Expulsar (rojo)
      //fill(200,0,0);
      //rect(width*0.235, height * 0.855, width*0.08, height * 0.115);
      
      //fill(255);
      //text("Expulsar", width/2 + 85, height - 50);

      if(mouseJustReleased &&
         mouseX > width*0.915 && mouseX < width * (0.915+0.0575) &&
         mouseY > height * 0.0775 && mouseY < height *0.0775 + width *0.0575 && !dialogBtnPressed){
         this.activeD = false;
         this.grid.activeDialog = false;
         for(Impostor imp : grid.impostores){
          if(imp != this) imp.activeD = false;
         }
         grid.count();  
      }
      
      // Colisión Aprobar
      if(mouseJustReleased &&
         mouseX > width*0.1 && mouseX < width*0.18 &&
         mouseY > height *0.855 && mouseY < height * 0.855 + height * 0.115 && grid.activeDialog){
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
      //width*0.235, height * 0.855, width*0.08, height * 0.115
      if(mouseJustReleased &&
         mouseX > width*0.235 && mouseX < width*0.315 &&
         mouseY > height*0.855 && mouseY < height * (0.855+0.115) && grid.activeDialog){
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
      textAlign(CORNER);
      noFill();
      popStyle();
    }

    if(dialogBtnPressed){
      dialogBtnPressed = false;
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
