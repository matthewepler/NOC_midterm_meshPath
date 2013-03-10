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
  
  physics = new VerletPhysics2D();
  physics.addBehavior( new GravityBehavior( new Vec2D( 0.15, 0 ) ) );
  
  particles = new ArrayList();
  
  Vec2D center = new Vec2D( width/2, height/2 );
  Vec2D extent = new Vec2D( width/2, height/2 );
  
  physics.setWorldBounds( Rect.fromCenterExtent( center, extent ) );
  
  for( int i = 0; i < width; i+=25 )
  {
    Particle p = new Particle( i, random( height/2 - 50, height/2 + 50 ) );
    particles.add( p ); 
    physics.addParticle( p );
  }
  
  for( int i = particles.size() - 2; i >= 0; i-- )
  {
    Particle thisParticle = particles.get( i );
    Particle nextParticle = particles.get( i + 1 );
    VerletSpring2D spring = new VerletSpring2D( thisParticle, nextParticle, 80, 0.01 ); 
    physics.addSpring( spring );
  }
  VerletSpring2D spring = new VerletSpring2D( particles.get( 0 ), particles.get( particles.size() - 1 ), 80, 0.01 );
  physics.addSpring( spring );
}

void draw()
{
  background( 220 );
  
  Particle firstParticle = particles.get( 0 );
  Particle lastParticle  = particles.get( particles.size() - 1 );
  lastParticle.display();
  
  for( int i = particles.size() - 2; i >= 0; i-- )
  {
    Particle thisParticle = particles.get( i );
    Particle nextParticle = particles.get( i + 1 );
    line( thisParticle.x, thisParticle.y, nextParticle.x, nextParticle.y );
    thisParticle.display();
  }    
}
