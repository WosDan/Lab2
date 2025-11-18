class Leaderboard {
  int[] scores = new int[5];
  int scoreIndex = 0;

  PImage entryImage;
  PImage bannerImage;

  Leaderboard(int size) {
    scores = new int[size];
    bannerImage = loadImage("leaderboard_banner.png");
    entryImage = loadImage("leaderboard_entry.png");
  }

  void agregarScore(int score) {
    scores[scoreIndex] = score;
    scoreIndex++;
    ordenarScores();
  }

  int[] obtenerMejoresN(int n) {
    int[] mejores = new int[n];
    for (int i = 0; i < mejores.length; i++) {
      mejores[i] = scores[i];
    }
    return mejores;
  }

  void ordenarScores() {
    int[] ordenados = scores.clone();

    for (int i = 1; i < scoreIndex; i++) {
      int scoreActual = ordenados[i];
      int j = i - 1;
      while (j >= 0) {
        int scoreComparado = ordenados[j];
        if (scoreComparado >= scoreActual) {
          break;
        }
        ordenados[j + 1] = ordenados[j];
        j--;
      }
      ordenados[j + 1] = scoreActual;
    }

    scores = ordenados;
  }

  void draw() {
    fill(0, 0, 0, 120);
    rect(0, 0, width, height);
    image(bannerImage, (width - 320*1.5)/2, 10, 320*1.5, 160*1.5);

    fill(0);
    textSize(32);
    text("Leaderboard", ((width - 320*1.5)/2) + 150, 210);

    int i = 0;
    for (int score : scores) {
      float ex = (width - 320*1.5)/2;
      float ey = 160*1.5 + 10 + (80*i);
      image(entryImage, ex, ey, 320*1.5, 80);
      text(score, ex + 40, ey+50);
      i++;
    }
  }
}
