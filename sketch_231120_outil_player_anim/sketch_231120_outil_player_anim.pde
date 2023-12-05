/*
  par écb pour DNMADe langages visuels - nov 2023
  
  charge 4 images dans une table, resize à la taille de l'anim
  et les affiche une par une
  
*/

int nbrI = 4;
PImage[] motifs = new PImage[nbrI];
int compteur = 0;

void setup() {
  pixelDensity(2);
  size(600,600);
  // charge les fichiers dans la table
  for (int i=0;i<nbrI;i++) {
    motifs[i] = loadImage("../medias/lmotif-"+nf(i,4)+".png");
    motifs[i].resize(width,0);
  }
}

void draw() {
  background(220);
  image(motifs[compteur%nbrI],0,0,width,height);
  compteur++;
}
