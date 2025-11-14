class ScoreManager{
  private int currentPoints;
  private String currentUser;
  
   ScoreManager(String user) {
    this.currentUser = user;
    this.currentPoints = 0;
  }

  public void addPoints(int points) {
    currentPoints += points;
  }

  public void subtractPoints(int points) {
    currentPoints = max(0, currentPoints - points);
  }

  public void resetPoints() {
    currentPoints = 0;
  }

  public int getPoints() {
    return currentPoints;
  }

  public void setUser(String user) {
    currentUser = user;
  }

  public String getUser() {
    return currentUser;
  }

  public void display(float x, float y, float time) {
    fill(160);
    rect(width*0.02, height*0.04, width * 0.2, height * 0.15);
    noFill();
    fill(0);
    textSize(32);
    textAlign(LEFT, TOP);
    text("Points: " + currentPoints, x, y + 20);
    text("Time: " + time, x, y + 60);
    noFill();
  }
  
  public int displayEnd2(float x, float y, Time time, Grid grid) {
    fill(50, 168, 82, 240);
    rect(x, y, width * 0.6, height * 0.3, 50);
    fill(10, 74, 28, 256);
    rect(x + width * 0.2, y + height * 0.24, width * 0.2, height * 0.1, 50);
    noFill();
    fill(0);
    if(grid.redPercentage() <= 20.0){
      textSize(128);
      text("¡Protegiste la red!", width * 0.2, height * 0.04);
    }else{
      textSize(128);
      text("¡Comprometiste la red!", width * 0.1, height * 0.04);
    }
    textSize(32);
    textAlign(LEFT, TOP);
    text("Cerrar", x + width * 0.27, y+height * 0.27);
    //text("Player: " + currentUser, x + width0.25, y + height 0.05);
    text("Points: " + currentPoints, x + width * 0.255, y + height * 0.09);
    text("Time: " + Math.round(time.getFinalTime()), x + width * 0.255, y + height * 0.17);
    noFill();

    if(
     mouseX >= (x + width * 0.2) &&
    mouseX <= (x + width * 0.2 + width * 0.2) &&
    mouseY >= (y + height * 0.24) &&
    mouseY <= (y + height * 0.24 + height * 0.1) &&
    mousePressed){
      return 0;
    }
    return 2;
  }
}  
