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
    text("Points: " + currentPoints, x, y + 20);
    text("Time: " + time, x, y + 60);
    noFill();
  }
  
  public int displayEnd2(PImage[] EndScreens, Time time, Grid grid) {
    pushStyle();
    if(grid.redPercentage() <= 20.0){
      image(EndScreens[0], 0, 0, width, height);
    }else{
      image(EndScreens[1], 0, 0, width, height);
    }
    textSize(32);
    textAlign(LEFT, TOP);
    text("Cerrar",width * 0.27, height * 0.27);
    //text("Player: " + currentUser, x + width0.25, y + height 0.05);
    text("Points: " + currentPoints,width * 0.255, height * 0.09);
    text("Time: " + Math.round(time.getFinalTime()), width * 0.255, height * 0.17);
    noFill();
    popStyle();

    if(
     mouseX >= (width * 0.2) &&
    mouseX <= (width * 0.2 + width * 0.2) &&
    mouseY >= (height * 0.24) &&
    mouseY <= (height * 0.24 + height * 0.1) &&
    mouseJustReleased){
      return 0;
    }
    return 2;
  }
}  
