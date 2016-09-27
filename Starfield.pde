NormalParticle particle = new NormalParticle();
void setup() {
	ellipseMode(CENTER);
	noStroke();
	size(800, 800);
}
void draw() {
	fill(0, 0, 0, 100);
	rect(0, 0, width, height);
	particle.move();
	particle.show();
}
class NormalParticle implements Particle {
	double dist, rotation, speed, acceleration;
	NormalParticle() {
		this.dist = 0;
		this.rotation = Math.random()*360;
		this.speed = Math.random()*3+1;
		this.acceleration = 1.01;
	}
	void move() {
		this.dist+=this.speed;
		this.speed *= this.acceleration;
	}
	void show() {
		fill(255);
		pushMatrix();
		translate(width/2, height/2);
		rotate(radians((float)(rotation)));
		ellipse(0, (float)(dist), 1, 1);
		popMatrix();
	}
}
interface Particle {
	void move();
	void show();
}
class OddballParticle implements Particle {//uses an interface
	void move() {

	}
	void show() {

	}
}
class JumboParticle implements Particle {//uses inheritance
	void move() {

	}
	void show() {

	}
}
