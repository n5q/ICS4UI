
// MAKE ROBOTS MOVE 1 STEP A FRAME, NOT 1 TERM




PImage robot;
int bridgePos;
int cg_xStart;
int cg_yStart;
int da_xStart;
int da_yStart;
Robot cg;
Robot da;

void setup()
{
	size(1200,800);
	frameRate(2);
	robot = loadImage("robot.png");
	imageMode(CENTER);
	bridgePos = 100;
	cg_xStart = width/2;
	cg_yStart = height-50;
	da_xStart = width/2;
	da_yStart = 50;
	cg = new Robot(cg_xStart, cg_yStart, "CG");
	da = new Robot(da_xStart, da_yStart, "DA");
}

void draw()
{
	clean();
	image(robot, cg.x, cg.y);
	image(robot, da.x, da.y);
	cg.move();
	da.move();

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
	String algorithm;
	int distanceTraveled;
	int speed;
	char direction;
	int term;

	Robot(int initX, int initY, String algo)
	{
		this.x = initX;
		this.y = initY;
		this.algorithm = algo;
		this.distanceTraveled = 0;
		this.speed = 20;
		this.direction = 'L';
	}

	void move()
	{
		int next = this.nextTerm();
		if (this.direction == 'R') {
			for (int i = 0; i < next; i++) {
				this.x++;
				this.distanceTraveled++;
			}
		}
		else {
			for (int i = 0; i < next; i++) {
				this.x--;
				this.distanceTraveled++;
			}	
		}
		this.turn();
	}

	int nextTerm()
	{
		println(frameCount);
		if (this.algorithm == "CG") {
			return speed*(frameCount);
		}
		else if (this.algorithm == "DA") {
			return int(speed*pow(2, frameCount-1));
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

}
