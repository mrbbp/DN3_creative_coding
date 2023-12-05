/*
  par écb pour DNMADe langages visuels - déc. 2023
  
  compose un motif type Truchet
  
  'S' pour sauvegarder une image "final_x.pdf"
  
*/

int compteur;
// modifier le nombre dans les accolades si plus de motifs
PShape[] truchet = new PShape[4];
int nbr = 20;
float xWidth;
// motif qui se repète (numero du motif) - modifier le motif
int[] motif = {3, 0, 0, 1, 2};
int numI =0;

void setup() {
  size(600, 600);
  xWidth = width/nbr;
  frameRate(4);
  for (int n=0; n<truchet.length; n++) {
    // charge les motifs dans la table
    truchet[n] = loadShape("../medias/triangle_"+n+".svg");
  }
}

void draw() {
  background(200);
  //shapeMode(CENTER);
  for (float y=0; y<height; y+= xWidth) {
    for (float x=0; x<width; x+= xWidth) {
      shape(truchet[motif[(compteur%motif.length)]], x, y, xWidth, xWidth);
      compteur++;
    }
    //compteur = 0;
    // faire varier la valeur
    compteur+=1;
  }
  compteur = 0;
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    // change le nom du pdf
    String chaine = "final_"+numI+".pdf";
    println("sauvegarde", chaine);
    numI++;
  }
}
