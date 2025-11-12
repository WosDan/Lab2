class Time {
  private int startMillis;
  private float finalTime;

  Time() {
    startMillis = millis();
  }

  public void reset() {
    startMillis = millis();
  }

  public int getMillis() {
    return millis() - startMillis;
  }

  public float getSeconds() {
    return (millis() - startMillis) / 1000.0;
  }
  
  public float getFinalTime(){
    return finalTime;
  }
  
  public void setFinalTime(float finalTime){
    this.finalTime = finalTime;
  }
}
