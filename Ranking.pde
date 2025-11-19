class Ranking{
  public String[] ranking = new String[10];
  public String[] ranking2 = new String[10];
  public String[] ranking3 = new String[10];
  public String[] ranking4 = new String[10];
  public String src;

  public Table rankingCsv;
  
  Ranking(String src){
    this.src = src;
    boolean condition = (null == loadTable(src, "header"));
    this.rankingCsv = ((condition)? new Table(): loadTable(src, "header"));
    if(condition){
      rankingCsv.addColumn("name");
      rankingCsv.addColumn("1");
      rankingCsv.addColumn("2");
      rankingCsv.addColumn("3");
      rankingCsv.addColumn("4");
      
      agregarOActualizar("Salma", 100.0, 999, 999, 999);
      agregarOActualizar("Javier", 100.0, 999, 999, 999);
      agregarOActualizar("Catalina", 100.0, 999, 999, 999);
      agregarOActualizar("Daniel", 100.0, 999, 999, 999);
    }
    
    saveTable(rankingCsv, src);
  }
  
  public void agregarOActualizar(String nombre, float j1, int j2, int j3, int j4) {
    TableRow fila = buscarFila(nombre);
  
    if (fila == null) {
      fila = this.rankingCsv.addRow();
      fila.setString("name", nombre);
      fila.setFloat("1", j1);
      fila.setInt("2", j2);
      fila.setInt("3", j3);
      fila.setInt("4", j4);
    } else {
      if (j1 > fila.getFloat("1")) fila.setFloat("1", j1);
      if (j2 > fila.getInt("2")) fila.setInt("2", j2);
      if (j3 > fila.getInt("3")) fila.setInt("3", j3);
      if (j4 > fila.getInt("4")) fila.setInt("4", j4);
    }
    saveTable(rankingCsv, this.src);
  }
  
  public TableRow buscarFila(String nombre) {
    for (TableRow fila : this.rankingCsv.rows()) {
      if (fila.getString("name").equals(nombre)) return fila;
    }
    return null;
  }
  
  public String[] obtenerTop10(String columna) {
    int n = this.rankingCsv.getRowCount();
    String[] nombresTemp = new String[n];
    float[] valoresTemp = new float[n];
     
    for (int i = 0; i < n; i++) {
      TableRow fila = this.rankingCsv.getRow(i);
      nombresTemp[i] = fila.getString("name");
      if (columna.equals("1")) valoresTemp[i] = fila.getFloat(columna);
      else valoresTemp[i] = fila.getInt(columna);
    }
    
    //BubbleSort descendente
    for (int i = 0; i < n-1; i++) {
      for (int j = i+1; j < n; j++) {
        if (valoresTemp[j] > valoresTemp[i]) {
          float tempVal = valoresTemp[i];
          valoresTemp[i] = valoresTemp[j];
          valoresTemp[j] = tempVal;
          String tempNom = nombresTemp[i];
          nombresTemp[i] = nombresTemp[j];
          nombresTemp[j] = tempNom;
        }
      }
    }
  
    // Aquí se combina nombre y puntaje
    String[] top10 = new String[10];
    for (int i = 0; i < 10; i++) {
      if (i < n) top10[i] = nombresTemp[i] + "," + valoresTemp[i];
      else top10[i] = ":";
    }
    return top10;
  }
  
  public void actualizarRanking() {
    ranking = obtenerTop10("1");
    ranking2 = obtenerTop10("2");
    ranking3 = obtenerTop10("3");
    ranking4 = obtenerTop10("4");
  }
  
  public void displayTops(float startX, float startY, float colWidth, float rowHeight, float colSpacing, float rowSpacing) {
    pushStyle();
    textSize(width*0.02);
    actualizarRanking();
    String[][] tops = {ranking, ranking2, ranking3, ranking4};
    String[] titulos = {"Top Juego 1", "Top Juego 2", "Top Juego 3", "Top Juego 4"};
  
    for (int col = 0; col < tops.length; col++) {
      float x = startX + col * (colWidth + colSpacing); // posición columna + spacing
      text(titulos[col], x, startY);
  
      for (int row = 0; row < tops[col].length; row++) {
        float y = startY + (row + 1) * (rowHeight + rowSpacing); // posición fila + spacing
        String valor = tops[col][row];
        if (valor != null && valor.contains(",")) {
          String[] parts = valor.split(",");
          String nombre = parts[0].trim();
          String puntaje = parts[1].trim();
          text((row + 1) + ". " + nombre + ": " + puntaje, x, y);
        } else {
          text((row + 1) + ". :", x, y);
        }
      }
    }
    popStyle();
  }
}
