/*
  par écb pour DNMADe langages visuels - déc. 2023
  
  compose une grille avec un peu de bruit(aléatoire)
  
  'Click souris' regénére une nouvelle grille
  'S' pour sauvegarder une image "final_x.png"
  
*/
float largeur, hauteur;
int compteur = 0;
int numI =0;

float bruit;

void setup() {
  // pour les écrans retina
  pixelDensity(2);
  // taille de l'image
  size(1000, 1000);
  // largeur 1/15e de la largeur
  largeur = width/15;
  // hauteur 1/10e de la hauteur
  hauteur = height/10;
  // pas de contour de dessin
  noStroke();
  // ne dessine qu'une seule fois
  noLoop();
}

void draw() {
  background(255);
  /* double boucle de dessin de la grille */
  for (float y= 0; y<height; y+=hauteur+bruit) {
    for (float x= 0; x<width; x+=largeur+bruit) {
      // dessine une fois sur deux
      if (compteur%2==0) {
        fill(0);
        // commenter la line du dessous pour dessiner toutes les formes
        rect(x+bruit, y+bruit, largeur+bruit, hauteur+bruit,3);
      } else {
        //fill(255);
      }
      // générateur de bruit
      //bruit = 0;
      bruit = random(-5, 5);
      // décommenter la line du dessous pour dessiner toutes les formes
      //rect(x+bruit, y+bruit, largeur+bruit, largeur+bruit,3);
      compteur++;
    }
    compteur++;
  }
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    String chaine = "final_"+numI+".png";
    println("sauvegarde", chaine);
    numI++;
  }
}
