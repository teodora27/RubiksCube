class Box{
  PMatrix3D matrix;
  
  int x=0;
  int y=0;
  int z=0;
  color c;
  Face[]faces= new Face[6];
  
  Box(PMatrix3D m, int x, int y, int z){
    this.matrix =m;
    this.x=x;
    this.y=y;
    this.z=z;
    c=color(255);
    
    faces[0]=new Face(new PVector(0,0,-1), color(#ff751a));//spate
    faces[1]=new Face(new PVector(0,0,1), color(#ff0000 ));//fata
    faces[2]=new Face(new PVector(0,1,0), color(#ffff33));//sus
    faces[3]=new Face(new PVector(0,-1,0), color(#333333));//jos
    faces[4]=new Face(new PVector(1,0,0), color(#3366ff));//dr
    faces[5]=new Face(new PVector(-1,0,0), color(#66ff66));//st
  }
  
  void turnFacesZ(int dir){
    for(Face f: faces)
    f.turnZ(dir*HALF_PI);
  }
  
  void turnFacesY(int dir){
    for(Face f: faces)
    f.turnY(dir*HALF_PI);
  }
  
  void turnFacesX(int dir){
    for(Face f: faces)
    f.turnX(dir*HALF_PI);
  }
  
  void update(int x, int y, int z){
    matrix.reset();
    matrix.translate(x,y,z);
    this.x=x;
    this.y=y;
    this.z=z;
  }
  
  void show(){
    noFill();
    stroke(0);
    strokeWeight(0.1);
    pushMatrix();
    applyMatrix(matrix);
    box(1);
   for(Face f : faces){
     f.show();
   }
    popMatrix();
  }
}
