class Particle
{
  PVector pos;
  float h;
  PVector start;
  PVector target;
  PVector dir;

  Particle(float x, float y, float _c)
  {
    pos = new PVector(x, y);
    start = new PVector(x, y);
    h = _c;
    target = new PVector(x + random(-100, 100), y + random(-100, 100));

    dir = new PVector(target.x, target.y);

    dir = PVector.sub(pos, target);

    dir.normalize();
    dir.mult(0.75);
  }

  void display(float h)
  {
    fill(h, 255, 255, 50);
    ellipse(pos.x, pos.y, 7, 7);
  }

  void move()
  {
    pos.add(dir);
  }

  void update(float h)
  {
    move();
    display(h);
  }

  float getDist()
  {
   return dist(start.x, start.y, pos.x, pos.y); 
  }
}