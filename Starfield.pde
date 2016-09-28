Particle[] stars = new Particle[300];
void setup() {
	ellipseMode(CENTER);
	noStroke();
	size(800, 800);
	for(int i = 4; i < stars.length; i++) stars[i] = new NormalParticle();
	stars[0] = new JumboParticle();
	stars[1] = new JumboParticle();
	stars[2] = new OddballParticle();
	stars[3] = new OddballParticle();
}
void draw() {
	background(0, 0, 25);
	for(int i = 0; i < stars.length; i++) {
		stars[i].move();
		stars[i].show();
	}
}

interface Particle {
	public void move();
	public void show();
}

class NormalParticle implements Particle {
	public double dist, rotation, speed, acceleration, size, sizeAccel;
	public color tint;
	NormalParticle() {
		this.dist = Math.random()*500 + 25;
		this.rotation = Math.random()*360;
		this.speed = Math.random()+.5;
		this.acceleration = 1.05;
		this.sizeAccel = 1.03;
		this.size = 1;
		this.tint = color(255, 255, (int)(Math.random()*50+175));
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
		fill(this.tint);
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
		this.tint = color(255, 255, (int)(Math.random()*50+175));
	}
}

class OddballParticle extends NormalParticle {
	OddballParticle() {
	}
	void move() {
		super.move();
		this.rotation += 5;
	}
}

class JumboParticle extends NormalParticle {
	JumboParticle() {
		this.sizeAccel = 1.06;
		this.dist = Math.random()*25+25;
	}
	void move() {
		super.move();
		// this.size += .5;
	}
	void reset() {
		super.reset();
		this.dist = Math.random()*100+25;
	}
}
