import g4p_controls.*;

// DECLARE GLOBAL VARIABLES
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
	// INITIAL STARTING POSITIONS (OVERRIDED BY SLIDER VALUES LATER)
	da_yStart = height-50;
	cg_yStart = 50;
	// CREATE ROBOT OBJECTS
	cg = new Robot(cgPosSlider.getValueI(), cg_yStart, "CG");
	da = new Robot(daPosSlider.getValueI(), da_yStart, "DA");	
	clean();
	image(robot, cg.x, cg.y);
	image(robot, da.x, da.y);
	// START OUT PAUSED
	playing = false;
	PFont font = createFont("Arial", 20);
	textFont(font);
}

void draw()
{
	// MAIN LOOP
	if (playing) {
		// REMOVE OLD ROBOTS AND TEXT, REDRAW WITH UPDATED POSITIONS AND VALUES
		clean();
		// DRAW ROBOTS
		image(robot, cg.x, cg.y);
		image(robot, da.x, da.y);
		// MOVE ROBOTS (FOR NEXT FRAME)
		cg.move();
		da.move();
		// DRAW TEXT
		drawText();
		// ONLY DRAW LINES IF BOX IS CHECKED
		if (lines.isSelected()) {
			drawLines();
		}
	}

	// RESET POSITIONS
	else {
		clean();
		image(robot, cg.x, cg.y);
		image(robot, da.x, da.y);
		drawText();		
	}
}

void drawText()
{
	fill(0);
	// DRAW TEXT WITH EACH ROBOT'S TOTAL DISTANCE TRAVELED
	text("Distance Traveled: " + str(cg.distanceTraveled) + "px", 25, 35);
	text("Distance Traveled: " + str(da.distanceTraveled) + "px", 25, height-25);
}

void pause()
{
	// PAUSE
	if (playing) {
		reset();
		playing = false;
		startButton.setText("START");
	}

	// UNPAUSE
	else {
		reset();
		playing = true;
		startButton.setText("RESET");
	}

	redraw();
}

void reset()
{
	// RESET POSITIONS AND VALUES OF BOTH ROBOTS
	cg.reset();
	da.reset();
}

void clean()
{
	// REDRAW BACKGROUND, CLEAR ROBOTS
	background(60,175,75);
	stroke(50,150,200);
	fill(50,150,200);
	rect(0,(height/2) - 60, width, 120);
	fill(100,50,50);
	stroke(100,50,50);
	rect(bridgePos, (height/2) - 100, 100, 200);
	stroke(200,100,100);
	// BRIDGE LINES
	line(bridgePos, (height/2) - 80, bridgePos+100, (height/2) - 80);
	line(bridgePos, (height/2) - 60, bridgePos+100, (height/2) - 60);
	line(bridgePos, (height/2) - 40, bridgePos+100, (height/2) - 40);
	line(bridgePos, (height/2) - 20, bridgePos+100, (height/2) - 20);
	line(bridgePos, (height/2), bridgePos+100, (height/2));
	line(bridgePos, (height/2) + 20, bridgePos+100, (height/2) + 20);
	line(bridgePos, (height/2) + 40, bridgePos+100, (height/2) + 40);
	line(bridgePos, (height/2) + 60, bridgePos+100, (height/2) + 60);
	line(bridgePos, (height/2) + 80, bridgePos+100, (height/2) + 80);
	stroke(255,0,0);
}

void drawLines()
{

	// DRAW LINES FOR BOTH ROBOTS
	// CONSTANT GROWTH
	for (int i = 0; i < cg.lines[0].size(); i++) {
		line(
			 cg.lines[0].get(i),
			 cg.lines[1].get(i),
			 cg.lines[2].get(i),
			 cg.lines[3].get(i)
			);
	}
	// DOUBLING ALGORITHM
	for (int i = 0; i < da.lines[0].size(); i++) {
		line(
			 da.lines[0].get(i),
			 da.lines[1].get(i),
			 da.lines[2].get(i),
			 da.lines[3].get(i)
			);
	}
}

