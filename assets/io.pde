int x, y, r;

void setup() {
  size(screen.width/1.7, screen.height/1.7)
  x=width/2;
  y=height/2;
  r= y-40;
  background(11);
  stroke(200);
  strokeWeight(1.3);
  fill(200);
}

void draw() {
  background(11);
  bezier(x, y-r, 
    (int)map(sin(frameCount*0.05), -1, 1, x-20, x+20), (int)map(sin(frameCount*0.05), -1, 1, y-20, y+20), 
    (int)map(cos(frameCount*0.05), -1, 1, x-20, x+20), (int)map(cos(frameCount*0.05), -1, 1, y-20, y+20), 
    x, y+r);
  polygon(x, y, r, 100);
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  for (float a = 0; a < TWO_PI; a += angle) {
    float cx = x + cos(a) * radius;
    float cy = y + sin(a) * radius;
    float nx = x + cos(a+(npoints/(map(sin(frameCount*0.05), -1, 1, 3, 5)) -1)*angle) * radius;
    float ny = y + sin(a+(npoints/(map(sin(frameCount*0.05), -1, 1, 3, 5)) -1)*angle) * radius;
    line(cx,cy,nx,ny);
  }
}
