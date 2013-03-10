// meshPath
// based on Dan Shiffman's "SimpleSpring" example included with toxiclibs physics library
// Matthew Epler, 2013

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
ArrayList<Particle> particles;
Attractor attractor;
float stringRadius = 100;

void setup()
{
  size( 1000, 400 );
  
  physics = new VerletPhysics2D();
  physics.addBehavior( new GravityBehavior( new Vec2D( -0.006, 0 ) ) );
  physics.setDrag (0.01);
  
  particles = new ArrayList();
  attractor = new Attractor( new Vec2D( width, height/2 ) );
  
  Vec2D center = new Vec2D( width/2, height/2 );
  Vec2D extent = new Vec2D( width/2, height/2 );
  
  physics.setWorldBounds( Rect.fromCenterExtent( center, extent ) );
}

void draw()
{
  background( 22 );
  
  physics.update();
  attractor.x = mouseX;
  attractor.y = mouseY;
  
  if( mousePressed && frameCount % 2 == 0 )
  {
    Particle p = new Particle( mouseX + random( -stringRadius / 3, stringRadius / 3 ), mouseY + random( -stringRadius / 3, stringRadius / 3 ) );
    particles.add( p );
  }
  
  for( int i = 0; i < particles.size(); i++ )
  {
    Particle thisParticle = particles.get( i );
    for( int j = 0; j < particles.size(); j++ )
    {
      if( i != j )
      {
        Particle thatParticle = particles.get( j );
        if( dist( thisParticle.x, thisParticle.y, thatParticle.x, thatParticle.y ) < stringRadius ) 
        {
          stroke( 46, 216, 255, thisParticle.alpha );
          line( thisParticle.x, thisParticle.y, thatParticle.x, thatParticle.y );
        }
      }  
    }
  }

  for( int i = 0; i < particles.size(); i++ )
  {
   Particle p = particles.get( i );
   if( p.isDead() )
   {
     particles.remove( p );
   } else {
    p.display();
   }
  }
  
}
