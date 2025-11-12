class Grid{
  private int lastChange = 0;
  private int rows;
  private int columns;
  private float size;
  private float x;
  private float y;
  private float gap;
  private PImage sprites[];
  private Frame[][] frames;
  
  Grid(int rows, int columns, float x, float y, float size, PImage[] sprites){
    this.rows = rows;
    this.columns = columns;
    this.frames = new Frame[rows][columns];
    this.x = x;
    this.y = y;
    this.size = size;
    this.sprites = sprites;
    for(int i = 0; i < rows; i++){
      for(int j = 0; j < columns; j++){
        frames[i][j] = new Frame(x + j*size, y + i*size, size, 0, sprites);
      }
    }
  }
  
  Grid(int rows, int columns, float x, float y, float size, PImage[] sprites, float gap){
    this.rows = rows;
    this.columns = columns;
    this.frames = new Frame[rows][columns];
    this.x = x;
    this.y = y;
    this.size = size;
    this.sprites = sprites;
    this.gap = gap;
    for(int i = 0; i < rows; i++){
      for(int j = 0; j < columns; j++){
        frames[i][j] = new MenuFrame(x + j*size + j*gap, y + i*size + i*gap, size, j+i+1, sprites);
      }
    }
  }
  
  public PImage[] getSprites(){
    return this.sprites;
  }
  
  public float getSize() {
    return this.size;
  }
  
  public float getX() {
    return this.x;
  }
  
  public float getY(){
    return this.y;
  }
  
  public int getRows() {
    return this.rows;
  }
  
  public int getColumns() {
    return this.columns;
  }
  
  public boolean isEmpty() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      if (frames[i][j].getState() == 0) {
        return false;
      }
    }
  }
  return true;
  }
  
  public boolean isRed() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      if (frames[i][j].getState() != 2) {
        return false;
      }
    }
  }
  return true;
  }
  
  public void display(){
    for(int i = 0; i < rows; i++){
      for(int j = 0; j < columns; j++){
        frames[i][j].display();
      }
    }
  }
  
  public void mouseHover(){
    for(int i = 0; i < rows; i++){
       for(int j = 0; j < columns; j++){
         frames[i][j].mouseHover();
       }  
    }  
  }
  
  public void mouseCollision(ScoreManager score){
    for(int i = 0; i < rows; i++){
       for(int j = 0; j < columns; j++){
         frames[i][j].mouseCollision(score);
       }  
    }
  }
  
  public int button(){
    for(int i = 0; i < rows; i++){
       for(int j = 0; j < columns; j++){
         if(frames[i][j].button() != 0){
           return frames[i][j].button();
         }
       }  
    }  
    return 0;
  }
  
  public void change(int changeInterval){   
    if(millis()-lastChange >= changeInterval){
      randomState();
      lastChange = millis();
    }
  }
  
  public void randomState(){
    if(this.isEmpty()){
      return;
    }
    
    for(int k = 0; k < rows*columns; k++){
      int i = int(random(rows));
      int j = int(random(columns));
      
      if (frames[i][j].getState() == 0) {
      frames[i][j].setState(1);
      break;
      }
    }
  }
  
  public void stateHandle(int corruptionInterval){
     for(int i = 0; i < rows; i++){
      for(int j = 0; j < columns; j++){
        frames[i][j].corruption(corruptionInterval);
      }
    } 
  }
  
}
