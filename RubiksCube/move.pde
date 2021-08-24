// Class dedicated to moving the faces
class Move {
  // variables
  float angle = 0;
  int x = 0;
  int y = 0;
  int z = 0;
  int dir;
  boolean animating = false;
  boolean finished = false;
  
  // move function which takes x,y,z coords and direction
  Move(int x, int y, int z, int dir) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.dir = dir;
  }
  
  // copies a move, this is used for the reversal
  Move copy() {
    return new Move(x,y,z,dir);
  }
  
  // this is used for the reversal
  void reverse() {
    dir *= -1;
  }
  
  // starting a turn
  void start() {
    animating = true;
    finished = false;
    this.angle = 0;
  }
  
  // finished
  boolean finished() {
    return finished;
  }
  
  // update function
  void update() {
    // if animating, that means we're turning so change the angle
    if (animating) {
      angle += dir * speed;
    // if angle > 90 deg, stop since that represents one full turn
    if (abs(angle) > HALF_PI) {
      angle = 0;
      animating = false;
      finished = true;
      if (abs(z) > 0) {
        turnZ(z, dir);
      } else if (abs(x) > 0) {
        turnX(x, dir);
      } else if (abs(y) > 0) {
        turnY(y, dir);
      }
    }
  }
}
}
