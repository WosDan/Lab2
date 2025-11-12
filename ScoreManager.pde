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
    rect(x, y, 200, 120);
    noFill();
    fill(0);
    textSize(32);
    textAlign(LEFT, TOP);
    text("Player: " + currentUser, x, y+10);
    text("Points: " + currentPoints, x, y + 50);
    text("Time: " + time, x, y + 90);
    noFill();
  }
}  
