// meshPath
// based on Dan Shiffman's "SimpleSpring" example included with toxiclibs physics library
// Matthew Epler, 2013

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
ArrayList<Particle> particles;

void setup()
{
  size( 1000, 400 );
}

void draw()
{
  background( 220 );
}
