ArrayList<Particle> p = new ArrayList<Particle>();
boolean stroke;
boolean mP;

void setup()
{
  fullScreen(P2D);
  colorMode(HSB);
  //strokeWeight(2);
}

void draw()
{
  fill(0, 50);
  rect(-10, -10, width + 10, height + 10);

  if (mP)
  {
    if (random(1) < 0.75) p.add(new Particle(mouseX, mouseY, mouseX*255/width));

    if (mouseButton == LEFT) stroke = false;
    else if (mouseButton == RIGHT) stroke = true;
  }

  for (int i = 0; i < p.size(); i++)
  {
    PVector p1 = new PVector(p.get(i).pos.x, p.get(i).pos.y);
    PVector p2 = p1;
    PVector p3 = p2;

    for (int j = 0; j < p.size(); j++)
    {
      if (i != j)
      { 
        if (dist(p.get(i).pos.x, p.get(i).pos.y, p.get(j).pos.x, p.get(j).pos.y) < 100)
        {
          if (p2 != p1)
          {
            p3 = new PVector(p.get(j).pos.x, p.get(j).pos.y);
          } else
          {
            p2 = new PVector(p.get(j).pos.x, p.get(j).pos.y);
          }
        }
      }
    }

    float h = p.get(i).h + p.get(i).getDist()/3;

    p.get(i).update(h);

    if (p1 != p2 && p1 != p3 && p2 != p3)
    {
      if (h > 255) h = h % 255;

      if (stroke)
      {
        fill(h, 255, 255, 50);
        noStroke();
      } else
      {
        stroke(h, 255, 255, 50);
        noFill();
      }
      triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
    }

    if (dist(p.get(i).pos.x, p.get(i).pos.y, p.get(i).start.x, p.get(i).start.y) > 100) p.remove(i);
  }
}

void mousePressed()
{
  mP = true;
}

void mouseReleased()
{
  mP = false;
}