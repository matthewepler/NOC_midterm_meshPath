class Particle extends VerletParticle2D {

  float r;
  float lifespan = 255;
  
  Particle( float x, float y ) 
  {
    super( x, y );
    r = 25;
    physics.addParticle( this );
    physics.addBehavior( new AttractionBehavior( this, r, -1 ) );
  }

  void display() 
  {
    fill( 175, lifespan );
    stroke( 0, lifespan );
    ellipse( x, y, 16, 16 );
    
    lifespan -= 0.5;
  }
  
  boolean isDead()
  {
    if( lifespan < 0 )
    {
      return true;
    } else {
      return false; 
    }
  }
}
