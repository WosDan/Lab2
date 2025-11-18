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
    textSize(128);
    fill(0);
    textAlign(CENTER);
    //rect(width *0.8705, height*0.035, width*0.11, width*0.04);
    //text("Player: " + currentUser, x + width0.25, y + height 0.05);
    text("Points: " + currentPoints,width*0.5, height * 0.5);
    text("Time: " + Math.round(time.getFinalTime()), width * 0.5, height * 0.7);
    noFill();
    textAlign(CORNER);
    popStyle();
    if(
     mouseX >= (width *0.8705) &&
    mouseX <= (width *0.8705 + width*0.11) &&
    mouseY >= (height*0.035) &&
    mouseY <= (height*0.035 + width*0.04) &&
    mouseJustReleased){
      return 0;
    }
    return 2;
  }
}  
