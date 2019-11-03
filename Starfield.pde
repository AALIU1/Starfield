field[]star;
int arrive=0;
int s=0;
void setup(){
  size(2000,1000);
  star=new field[100];
  for(int i=0;i<star.length;i++){
    star[i]=new field();
  }
}
void draw(){
  background(0,0,200);
  for(int i=1; i<star.length; i++){
    star[i].move();
    star[i].show();
  }
  if(keyPressed && arrive==0){
    arrive=1;
    star[0].a=(float)Math.random()*255;
    star[0].b=(float)Math.random()*255;
    star[0].c=(float)Math.random()*255;
  }
  if(arrive==0){
  ellipse(100,100,100,100);
  }
  if(arrive>=300){
    s=1;
  }
  star[0].odd();
}
class field{
  double x,y,speed,angle;
  float size,ca,cb,pa,pb,psize,ss,cx,cy,cz,a,b,c;
  field(){
    speed=Math.random()*10+10;
    angle=Math.random()*10+1;
    size=0.1;
    ca=(float)(Math.random()*20+231);
    cb=(float)(Math.random()*100+151);
    pa=(float)Math.random()*50+975;
    pb=(float)Math.random()*50+475;
    psize=0;
    ss=2;
    cx=(float)Math.random()*255;
    cy=(float)Math.random()*255;
    cz=(float)Math.random()*255;
    a=(float)Math.random()*255;
    b=(float)Math.random()*255;
    c=(float)Math.random()*255;
  }
  void move(){
    if(speed>6){
      speed-=0.1;
    }
    if((x>=1000 || x<=-1000 || y<=-500 || y>=500) && arrive>0 && arrive<300){
      x=Math.random()*4-2;
      y=Math.random()*4-2;
      speed=Math.random()*10+10;
      angle=Math.random()*10+1;
      size=0.1;
      ca=(float)(Math.random()*20+231);
      cb=(float)(Math.random()*100+151);
      arrive+=1;
      star[0].cx-=5;
      star[0].cy-=5;
      star[0].cz-=5;
      if(star[0].psize>=10 && arrive<250){
        star[0].psize-=5;
      }
      if(star[0].psize<10){
        star[0].psize=0;
      }
    }
    if(arrive>0){
      x+=Math.cos(angle)*speed;
      y+=Math.sin(angle)*speed/2;
      size+=0.2;
    }
  }
  void show(){
    push();
    translate(1000,500);
    fill(255,255,255);
    ellipse((float)x,(float)y,size,size);
    pop();
  }
  void odd(){
    if(arrive>250 && ss>0){
      psize+=8*ss;
      ss-=0.025;
      cx=a;
      cy=b;
      cz=c;
    }
    if(ss<=0){
      arrive=0;
      s=0;
      ss=2;
    }
    fill(cx,cy,cz);
    ellipse(pa,pb,psize,psize);
  }
}
