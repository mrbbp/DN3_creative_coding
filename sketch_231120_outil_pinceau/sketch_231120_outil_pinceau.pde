/*
  par écb pour DNMADe langages visuels - nov 2023
  
  charge x images (pinceaux) dans une table, resize au 10eme de la taille de l'anim 
  il suffit d'appuyer sur le bouton de la souris pour dessiner avec le pinceau/image
  dans un PGraphics (qui s'affiche et est enregistré sans le pinceau)
  
  une seconde ligne permet de dessiner sur une grille (écrat fixe entre les traces)
  
  'N' pour changer d'image/pinceau
  'S' pour sauvegarder une image "final_x.png"
  
  historique :
    v4 : utilisation d'un PGraphics pour enregistrer et dessiner dans 

*/
Boolean click = false;
int nbrI = 2;
PImage[] pinceaux = new PImage[nbrI];
PGraphics out;
int numI = 0;

int numeroDuPinceau = 0;
int largeurPinceau;

void setup() {
  pixelDensity(2);
  size(600,600);
  largeurPinceau =  width/20;
  out = createGraphics(width, height);
  for (int i=0;i<nbrI;i++) {
    pinceaux[i] = loadImage("image_"+i+".png");
    pinceaux[i].resize(largeurPinceau*2,0);
  }
  
}

void draw() {
  background(220);
  image(pinceaux[numeroDuPinceau], mouseX,mouseY,largeurPinceau,largeurPinceau);
  out.beginDraw();
  if (mousePressed) {
    out.image(pinceaux[numeroDuPinceau%nbrI], mouseX,mouseY,largeurPinceau,largeurPinceau);
    // ici dessine sur une grille (avec un ecart fixe entre chaque motif)
    //out.image(pinceaux[numeroDuPinceau%nbrI],int(mouseX/largeurPinceau)*largeurPinceau,int(mouseY/largeurPinceau)*largeurPinceau);
  }
  out.endDraw();
  image(out,0,0,width,height);
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    String chaine = "final_"+numI+".png";
    println("sauvegarde",chaine);
    out.save(chaine);
    numI++;
  }
  if (key == 'n' || key == 'N') {
    numeroDuPinceau++;
    if (numeroDuPinceau>= pinceaux.length) {
      numeroDuPinceau = 0;
    }
  }
}
