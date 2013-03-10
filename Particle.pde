class Particle extends VerletParticle2D {

  float r;
  float lifespan = 0;
  float alpha = 0;
  
  Particle( float x, float y ) 
  {
    super( x, y );
    r = 25;
    physics.addParticle( this );
    physics.addBehavior( new AttractionBehavior( this, r, -0.25 ) );
  }

  void display() 
  {
    fill( 46, 216, 255, alpha );
    ellipse( x, y, 16, 16 );

    if( lifespan > 150 )
    {
     alpha -= 1; 
    } else {
     alpha += 0.51;
    }
    
    lifespan += 1; 
  }
  
  boolean isDead()
  {
    if( lifespan > 250 )
    {
      return true;
    } else {
      return false; 
    }
  }
}
