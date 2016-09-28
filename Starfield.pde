Particle[] stars = new Particle[250];
void setup() {
	ellipseMode(CENTER);
	noStroke();
	size(800, 800);
	for(int i = 2; i < stars.length; i++) stars[i] = new NormalParticle();
	stars[0] = new JumboParticle();
	stars[1] = new JumboParticle();
}
void draw() {
	background(0, 0, 10);
	for(int i = 0; i < stars.length; i++) {
		stars[i].move();
		stars[i].show();
	}
}
class NormalParticle implements Particle {
	public double dist, rotation, speed, acceleration, size, sizeAccel;
	NormalParticle() {
		this.dist = Math.random()*566;
		this.rotation = Math.random()*360;
		this.speed = Math.random()+.5;
		this.acceleration = 1.05;
		this.sizeAccel = 1.03;
		this.size = 1;
	}
	void move() {
		this.dist+=this.speed;
		this.speed *= this.acceleration;
		this.size *= this.sizeAccel;
		if(this.dist > 566) {
			this.reset();
		}
	}
	void show() {
		fill(255, 255, 210);
		pushMatrix();
		translate(width/2, height/2);
		rotate(radians((float)(rotation)));
		ellipse(0, (float)(dist), (float)(this.size), (float)(this.size));
		popMatrix();
	}
	void reset() {
		this.dist = Math.random()*500 + 25;
		this.speed = Math.random()+.5;
		this.rotation = Math.random()*360;
		this.size = 1;
	}
}
interface Particle {
	public void move();
	public void show();
}
class OddballParticle implements Particle {
	void move() {

	}
	void show() {

	}
}
class JumboParticle extends NormalParticle {
	JumboParticle() {
		this.sizeAccel = 1.06;
	}
	void move() {
		super.move();
	}
}
