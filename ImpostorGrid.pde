class ImpostorGrid {
  private Impostor[] impostores;
  private float [] posX;
  private float [] posY;
  private int cols, total;
  private float cellW, cellH, x, y;
  private boolean activeDialog = false;
  private int checked;
  private int error;

  ImpostorGrid(int cols, int total, float cellW, float cellH,
    float x, float y,
    PImage[] sprites, PImage[] spritesHover,
    String[] nombres, String[] textos, int[] ids, boolean[] impostor) {
    this.cols = cols;
    this.cellW = cellW;
    this.cellH = cellH;
    this.x = x;
    this.y = y;
    this.total = total;
    
    ids = shuffle(ids);
    int ct = 0;
    impostores = new Impostor[total];
    
    this.posX = new float[total];
    this.posY = new float[total];
    
    for (int i=0; i < total; i++) {
      float px = x + (i % cols) * (cellW + 40);
      float py = y + (i / cols) * (cellH + 40);
      this.posX[i] = px;
      this.posY[i] = py;
    }
    
    for(int i = 0; i < total; i++){
      impostores[i] = new Impostor(posX[i], posY[i], cellW, cellH, impostor[ids[i]],sprites[i], spritesHover[i], nombres[ids[i]], textos[ids[i]], this);          
    }   
  }

  public int[] shuffle(int[] array) {
    for (int i = array.length - 1; i > 0; i--) {
      int j = int(random(i+1));
      int temp = array[i];
      array[i] = array[j];
      array[j] = temp;
    }
    return array;
  }
  
  public void display(){
    for(int i = 0; i < total; i++){
      impostores[i].display();
    }
  }
  
  public void displayDialog(){
    for(int i = 0; i < total; i++){
      if(activeDialog == false){
        impostores[i].mouseButton();
      }   
      
      if(activeDialog == true){
        if(impostores[i].activeD){
          impostores[i].displayDialog();
        }
      }
    }
  }
  
  public void mouseHover(){
    for(int i = 0; i < total; i++){
      impostores[i].mouseHover();      
    }
  }
  
  public void count(){
    checked = 0;
    error = 0;
    for(int i = 0; i < total; i++){
      if(impostores[i].counted){
         checked += 1; 
      }
      if(impostores[i].error){
         error += 1;
      }
    }
  }
  
  public void finishGame(){
    if(checked == total){
      rectMode(CENTER);
      if((total-error)*100 >= 70){
          fill(37, 168, 13);
          rect(width*0.5, height * 0.5, width*0.6, height * 0.4);
      }else if((total-error)*100 < 70) {
          fill(168, 13, 13);
          rect(width*0.5, height * 0.5, width*0.6, height * 0.4);
      }
      rectMode(CORNER);
    }
  }
}
