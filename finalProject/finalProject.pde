
PImage robot;
int bridgePos = 100;
int cg_xPos;
int cg_yPos;

void setup()
{
	size(1200,800);
	background(60,175,75);
	stroke(50,150,200);
	fill(50,150,200);
	rect(0,(height/2) - 60, width, 120);
	robot = loadImage("robot.png");
	imageMode(CENTER);
	cg_xPos = width/2;
	cg_yPos = height-50;
}

void draw()
{
	fill(100,50,50);
	stroke(100,50,50);
	rect(bridgePos, (height/2) - 100, 100, 200);
	image(robot, cg_xPos, cg_yPos);	
}

class Robot
{
	int x,y;
	Algorithm algorithm;
	int distanceTraveled;
	int walkingSpeed;

	Robot(int initX, int initY, Algorithm algo)
	{
		this.x = initX;
		this.y = initY;
		this.algorithm = algo;
		this.distanceTraveled = 0;
	}	
}

class Algorithm
{
	Algorithm()
	{

	}
}
