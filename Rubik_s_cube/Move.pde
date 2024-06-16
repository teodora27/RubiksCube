class Move{
  float angle=0;
  int x=0;
  int y=0;
  int z=0;
  int dir;
  boolean animatie = false;
  boolean finished = false;
  Move(int x, int y, int z, int dir){
    this.x=x;
    this.y=y;
    this.z=z;
    this.dir=dir;
  }
  
  void start(){
   animatie=true; 
  }
  boolean finished(){
    return finished;
  }
  void update(){
    if(animatie){
       angle+=dir*0.1;
       if(abs(angle)>HALF_PI){
         angle=0;
      
       if(abs(z)>0){
         turnZ(z,dir);
       }else if(abs(x)>0){
         turnX(x,dir);
       }else if(abs(y)>0){
         turnY(y,dir);
       }
        animatie=false;
     }
  }
  }
}
