import peasy.*;

PeasyCam cam;


//sus jos dr st fata spate
color[] colors ={
#333333 , #ffff33 ,
#3366ff , #66ff66 ,
#ff0000 , #ff751a
};

Move[] allMoves = new Move[]{
new Move (0, 1, 0, 1),
new Move (0, 1, 0,-1),
new Move (0, -1, 0, 1),
new Move (0, -1, 0, -1),

new Move(1, 0, 0, 1),
new Move (1, 0, 0, -1),
new Move(-1,0, 0, 1),
new Move (-1, 0, 0, -1),

new Move (0,0 , 1, 1),
new Move (0, 0, 1, -1),
new Move (0, 0, -1, 1),
new Move (0, 0, -1,-1)
};

int dim = 3;
Box[] cube = new Box[dim*dim*dim];

Move move= allMoves[4];

void setup(){
  size(600,600,P3D);
  //fullScreen(P3D);
  cam = new PeasyCam(this, 400);
  int index=0;
  for(int x=-1;x<=1;x++) {
    for(int y=-1;y<=1;y++){
      for(int z=-1;z<=1;z++){
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x,y,z);
        cube[index] = new Box(matrix,x,y,z);
        index++;
      }
    }
  }
  cube[2].c=color(255,0,0);
  cube[0].c=color(0,0,255);
  
  //move=new Move(0,1 ,0,1);
 

}
int index=0;

void turnZ(int index, int dir){
  for(int i=0;i<cube.length;i++){
  Box qb=cube[i];
  if(qb.z==index){
  
    PMatrix2D matrix= new PMatrix2D();
    matrix.rotate(dir*HALF_PI);
    matrix.translate(qb.x,qb.y);
    qb.turnFacesZ(dir);
    qb.update(round(matrix.m02),round(matrix.m12),round(qb.z));
  }
 }
}

void turnX(int index,int dir){
  for(int i=0;i<cube.length;i++){
  Box qb=cube[i];
  if(qb.x==index){
    PMatrix2D matrix= new PMatrix2D();
    matrix.rotate(dir*HALF_PI);
    matrix.translate(qb.y,qb.z);
     qb.turnFacesX(dir);
    qb.update(round(qb.x),round(matrix.m02),round(matrix.m12));
    
  }
 }
}

void turnY(int index,int dir){
  for(int i=0;i<cube.length;i++){
  Box qb=cube[i];
  if(qb.y==index){
  
    PMatrix2D matrix= new PMatrix2D();
    matrix.rotate(dir*HALF_PI);
    matrix.translate(qb.x,qb.z);
     qb.turnFacesY(dir);
    qb.update(round(matrix.m02),round(qb.y),round(matrix.m12));
  }
 }
}

void keyPressed(){
switch(key){
  case 'w':
     //turnZ(-1,-1);
     move=allMoves[11];
     allMoves[11].start();
     break;
  case 'e':
     //turnZ(1,-1);
     move=allMoves[9];
     allMoves[9].start();
     break;
  case 'W':
     //turnZ(-1,1);
     move=allMoves[10];
     allMoves[10].start();
     break;
  case 'E':
     //turnZ(1,1);
     move=allMoves[8];
     allMoves[8].start();
     break;
     
     
     case 's':
     //turnY(-1,-1);
     move=allMoves[3];
     allMoves[3].start();
     break;
     case 'd':
     //turnY(1,-1);
     move=allMoves[1];
     allMoves[1].start();
     break;
    case 'S':
     //turnY(-1,1);
     move=allMoves[2];
     allMoves[2].start();
     break;
    case 'D':
     //turnY(1,1);
     move=allMoves[0];
     allMoves[0].start();
     break;
     
     
     case 'x':
     //turnX(-1,-1);
     move=allMoves[7];
     allMoves[7].start();
     break;
    case 'c':
    move=allMoves[5];
     allMoves[5].start();
     break;
    case 'X':
     //turnX(-1,1);
     move=allMoves[6];
     allMoves[6].start();
     break;
    case 'C':
     move=allMoves[4];
     allMoves[4].start();
     break;
     
     
  
}
if(key==' ')
 move.start();
}

void draw(){
  background(#cccccc);
  scale(70);
  for(int i=0;i<cube.length;i++){
    push();
    if(abs(cube[i].z)>0&&cube[i].z==move.z){
      rotateZ(move.angle);
    }
    else if(abs(cube[i].x)>0&&cube[i].x==move.x){
      rotateX(move.angle);
    }
    else if(abs(cube[i].y)>0&&cube[i].y==move.y){
      rotateY(-move.angle);
    }
        cube[i].show();
        pop();
      }
  move.update();
  
}
