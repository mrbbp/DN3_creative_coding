/*
  par écb pour DNMADe langages visuels - nov 2023
  
  charge des motifs dans une table
  compose une image au hasard à partir de ces motifs
  
  charge également un fond d'image (l'affiche)
  
  enregistre le tout dans un pdf nommé "fichier.pdf" dans le dossier du croquis
  
*/
import processing.pdf.*;

// nombre de motifs
int nbrI = 8;
// table des motifs
PShape[] motifs = new PShape[nbrI];
// fond d'affiche
PShape fond = new PShape();
// facultatif
int compteur = 0;
float largeur;
/* largeur et haiteur en px d'une affiche A0 = 7015 * 4960*/

void setup() {
  //pixelDensity(2);
  size(496,701);
  // dimension pour le motif
  largeur = ((width/9*8)/12)+.6;
  // cahrge le fond d'affiche
  fond = loadShape("../medias/texte_jpo_16.svg");
  // charge les motifs
  for (int i=0;i<nbrI;i++) {
    motifs[i] = loadShape("../medias/zdenek_"+(i+6)+".svg");
  }
  // draw ne joue qu'une seule fois
  noLoop();
}

void draw() {
  background(255);
  beginRecord(PDF, "fichier.pdf");
  shape(fond, 0,0, width, height);
  /* place du dessin :
    x : entre 1/18e et 17/18e de width
    y : entre 1/3 de height et 8/9 
  */
  for (float y=height/3; y<height/9*8; y+= largeur) {
    for (float x=width/18; x<width/18*17; x+= largeur) {
      //shape(table[compteur%nbrI],x,0,largeur,largeur);
      shape(motifs[floor(random(nbrI))],x,y,largeur+.2,largeur+.2);
    }
  }
  // fin du dessin dans le pdf
  endRecord();
}
void mouseReleased() {
  redraw();
}
