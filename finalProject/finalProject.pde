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
	fill(100,50,50);
	stroke(100,50,50);
	rect(bridgePos, (height/2) - 100, 100, 200);

	stroke(255,0,0);
	drawLines();
}

void clean(boolean lines)
{
	background(60,175,75);
	stroke(50,150,200);
	fill(50,150,200);
	rect(0,(height/2) - 60, width, 120);
	fill(100,50,50);
	stroke(100,50,50);
	rect(bridgePos, (height/2) - 100, 100, 200);

	stroke(255,0,0);
	if (lines) {
		drawLines();
	}
}

void drawLines()
{
	for (int i = 0; i < cg.lines[0].size(); i++) {
		line(cg.lines[0].get(i), cg.lines[1].get(i), cg.lines[2].get(i), cg.lines[3].get(i));
	}
	for (int i = 0; i < da.lines[0].size(); i++) {
		line(da.lines[0].get(i), da.lines[1].get(i), da.lines[2].get(i), da.lines[3].get(i));
	}
}

class Robot
{
	float x,y;
	float initX, initY;
	float lastX, lastY;
	String algorithm;
	float distanceTraveled;
	int step;
	char direction;
	float counter;
	int term;
	FloatList[] lines;

	Robot(int initX, int initY, String algo)
	{
		this.x = initX;
		this.y = initY;
		this.initX = initX;
		this.initY = initY;
		this.lastX = initX;
		this.lastY = initY;
		this.algorithm = algo;
		this.distanceTraveled = 0;
		this.step = 1;
		this.direction = 'L';
		this.counter = 0;
		this.term = 0;
		this.lines = new FloatList[4];
		for (int i = 0; i <= 3; i++) {
			this.lines[i] = new FloatList();
		}
	}

	void move()
	{
		if (this.counter <= 0) {
			this.counter = this.nextTerm();
			if (this.algorithm == "CG") {
				this.y += 5;
			}
			else {
				this.y -= 5;
			}
			this.turn();
			this.term++;
		}

		else if (this.algorithm == "CG") {
			if (this.direction == 'R') {
				this.x += cgSpeedSlider.getValueF();
				this.distanceTraveled += cgSpeedSlider.getValueF();
				this.counter -= cgSpeedSlider.getValueF();
			}
			else {
				this.x -= cgSpeedSlider.getValueF();
				this.distanceTraveled += cgSpeedSlider.getValueF();
				this.counter -= cgSpeedSlider.getValueF();
			}
		}

		else {
			if (this.direction == 'R') {
				this.x += daSpeedSlider.getValueF();
				this.distanceTraveled += daSpeedSlider.getValueF();
				this.counter -= daSpeedSlider.getValueF();
			}
			else {
				this.x -= daSpeedSlider.getValueF();
				this.distanceTraveled += daSpeedSlider.getValueF();
				this.counter -= daSpeedSlider.getValueF();
			}			
		}
	}

	int nextTerm()
	{
		if (this.algorithm == "CG") {
			println(step*this.term);
			return step*(this.term);
		}
		else if (this.algorithm == "DA") {
			println(step*pow(2, this.term));
			return int(step*pow(2, this.term-1));
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

		if (this.algorithm == "CG") {
			this.lines[0].append(this.lastX);
			this.lines[1].append(this.lastY - 25);
			this.lines[2].append(this.x);
			this.lines[3].append(this.lastY - 25);
		}
		else {
			this.lines[0].append(this.lastX);
			this.lines[1].append(this.lastY + 25);
			this.lines[2].append(this.x);
			this.lines[3].append(this.lastY + 25);
		}
		this.lastX = this.x;
		this.lastY = this.y;
	}

	void reset()
	{

		if (this.algorithm == "CG") {
			this.x = cgPosSlider.getValueI();
			this.step = cgStepSlider.getValueI();
		}
		else {
			this.x = daPosSlider.getValueI();
			this.step = daStepSlider.getValueI();
		}
		this.y = this.initY;

		for (int i = 0; i <= 3; i++) {
			this.lines[i] = new FloatList();
		}
		this.term = 0;
		this.counter = 0;
		this.distanceTraveled = 0;
	}
}



