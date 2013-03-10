class Attractor extends VerletParticle2D 
{

  float r;

  Attractor ( Vec2D loc ) 
  {
    super( loc );
    r = 50;
    physics.addParticle( this );
    physics.addBehavior( new AttractionBehavior( this, width, 0.03 ) );
  }

}
