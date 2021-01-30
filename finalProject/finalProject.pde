import g4p_controls.*;

PImage robot;
int bridgePos;
int cg_xStart;
int cg_yStart;
int da_xStart;
int da_yStart;
Robot cg;
Robot da;
boolean playing;

void setup()
{
	size(1200,800);
	frameRate(60);
	robot = loadImage("robot.png");
	imageMode(CENTER);
	createGUI();
	bridgePos = 100;
	da_xStart = width/2;
	da_yStart = height-50;
	cg_xStart = width/2;
	cg_yStart = 50;
	cg = new Robot(cg_xStart, cg_yStart, "CG");
	da = new Robot(da_xStart, da_yStart, "DA");	
	clean();
	image(robot, cg.x, cg.y);
	image(robot, da.x, da.y);
	playing = false;
}

void draw()
{
	if (playing) {
		clean();
		image(robot, cg.x, cg.y);
		image(robot, da.x, da.y);
		cg.move();
		da.move();
	}
}

void pause()
{
	if (playing) {
		cg.reset();
    	da.reset();
		playing = false;
		startButton.setText("START");
	}
	else {
		cg.reset();
		da.reset();
		playing = true;
		startButton.setText("RESET");
	}
	redraw();
}

void reset()
{
	cg.reset();
	da.reset();
}

void clean()
{
	background(60,175,75);
	stroke(50,150,200);
	fill(50,150,200);
	rect(0,(height/2) - 60, width, 120);
	imageMode(CENTER);
	fill(100,50,50);
	stroke(100,50,50);
	rect(bridgePos, (height/2) - 100, 100, 200);
}

class Robot
{
	int x,y;
	int initX, initY;
	String algorithm;
	int distanceTraveled;
	int speed;
	char direction;
	int counter;
	int term;

	Robot(int initX, int initY, String algo)
	{
		this.x = initX;
		this.y = initY;
		this.initX = initX;
		this.initY = initY;
		this.algorithm = algo;
		this.distanceTraveled = 0;
		this.speed = 1;
		this.direction = 'L';
		this.counter = 0;
		this.term = 0;
	}

	void move()
	{
		if (this.counter <= 0) {
			this.counter = this.nextTerm();
			// this.y-=10;
			this.turn();
			this.term++;
		}

		else {
			if (this.direction == 'R') {
				this.x++;
				this.distanceTraveled++;
				this.counter--;
			}
			else {
				this.x--;
				this.distanceTraveled++;
				this.counter--;
			}
		}

		// int next = this.nextTerm();
		// if (this.direction == 'R') {
		// 	for (int i = 0; i < next; i++) {
		// 		this.x++;
		// 		this.distanceTraveled++;
		// 	}
		// }
		// else {
		// 	for (int i = 0; i < next; i++) {
		// 		this.x--;
		// 		this.distanceTraveled++;
		// 	}	
		// }
		// this.turn();
	}

	int nextTerm()
	{
		if (this.algorithm == "CG") {
			println(speed*this.term);
			return speed*(this.term);
		}
		else if (this.algorithm == "DA") {
			println(speed*pow(2, this.term));
			return int(speed*pow(2, this.term-1));
		}
		return 0;
	}

	void turn()
	{
		if (this.direction == 'L') {
			this.direction = 'R';
		}
		else {
			this.direction = 'L';
		}
	}

	void reset()
	{

		if (this.algorithm == "CG") {
			this.x = cgPosSlider.getValueI();
			this.speed = cgSpeedSlider.getValueI();
		}
		else {
			this.x = daPosSlider.getValueI();
			this.speed = daSpeedSlider.getValueI();
		}
		this.y = this.initY;

		this.term = 0;
		this.counter = 0;
		this.distanceTraveled = 0;
	}

}



