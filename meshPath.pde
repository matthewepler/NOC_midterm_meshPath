// meshPath
// based on Dan Shiffman's "SimpleSpring" example included with toxiclibs physics library
// Matthew Epler, 2013

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
ArrayList<Particle> particles;

float stringRadius = 100;

void setup()
{
  size( 1000, 400 );
  
  physics = new VerletPhysics2D();
  physics.addBehavior( new GravityBehavior( new Vec2D( 0.15, 0 ) ) );
  
  particles = new ArrayList();
  
  Vec2D center = new Vec2D( width/2, height/2 );
  Vec2D extent = new Vec2D( width/2, height/2 );
  
  physics.setWorldBounds( Rect.fromCenterExtent( center, extent ) );
  
  noiseDetail( 1, 0.99 );
  float xoff = 0.0;
  for( int i = 0; i < width; i+=25 )
  {
    Particle p = new Particle( i, height/2 + noise( xoff ) * 150 );
    particles.add( p ); 
    physics.addParticle( p );
    xoff += 3;
  }
  
  for( int i = 0; i < particles.size() - 1; i++ )
  {
    Particle thisParticle = particles.get( i );
    for( int j = 0; j < particles.size() - 1; j++ )
    {
      if( i != j)
     {
       Particle thatParticle = particles.get( j );
       if( dist( thisParticle.x, thisParticle.y, thatParticle.x, thatParticle.y ) < stringRadius ) 
       {
         VerletSpring2D spring = new VerletSpring2D( thisParticle, thatParticle, 80, 0.01 ); 
         physics.addSpring( spring );
       }
     }
    }
  }
}

void draw()
{
  background( 220 );
  
  Particle lastParticle  = particles.get( particles.size() - 1 );
  lastParticle.display();
  
  for( int i = 0; i < particles.size() - 1; i++ )
  {
    Particle thisParticle = particles.get( i );
    for( int j = 0; j < particles.size() - 1; j++ )
    {
      if( i != j )
      {
        Particle thatParticle = particles.get( j );
        if( dist( thisParticle.x, thisParticle.y, thatParticle.x, thatParticle.y ) < stringRadius ) 
        {
          line( thisParticle.x, thisParticle.y, thatParticle.x, thatParticle.y );
        }
      }
      
    }
    thisParticle.display();
  }    
}
