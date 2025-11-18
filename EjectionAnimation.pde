class EjectionAnimation{
  private Time time;
  private float crewMateX;
  private float crewMateY;
  private PImage crew;
  private PImage background;
  private String message;
  private float lastUpdate = 0;
  private int lettersShown = 0;
  private boolean showMessage = false;
  
  //, PImage crew
  EjectionAnimation(PImage background, PImage crew, String name){
    this.background = background;
    this.crew = crew;
    this.message = name + " was ejected";
  }
  
  public Time getTime(){
    return this.time;
  }
  
  public void display(){
    if(this.time == null){
      this.time = new Time();
      this.crewMateX = 0;
      this.crewMateY = height*0.5;
      time.setFinalTime(5000);
    }
    image(background, 0, 0, width, height);
    if(time.getMillis() <= time.getFinalTime()){
      pushMatrix();
      fill(160);
      crewMateX = (time.getMillis()/1000.0)*width*0.3;
      translate(crewMateX, crewMateY);
      //rectMode(CENTER);
      imageMode(CENTER);
      rotate(2*PI*(time.getMillis()/1000.0)*0.5);
      //rect(0, 0, 80, 40);
      image(this.crew, 0, 0, 42*1.8, 60*1.8);
      imageMode(CORNER);
      //rectMode(CORNER);
      noFill();
      popMatrix();
    }
    
    if(crewMateX - width/2 >= 5){
      showMessage = true;
    }
    
    if(showMessage){
      if(time.getMillis() - lastUpdate > 100 && lettersShown < message.length()){
        lettersShown++;
        lastUpdate = time.getMillis();
      }
      fill(255);
      textAlign(CENTER, CENTER);
      textSize(32);
      text(message.substring(0, lettersShown), width/2, height*0.5);
      textAlign(CORNER);
    }
     
  }
}
