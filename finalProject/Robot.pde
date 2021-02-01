class Robot
{
	// DEFINE VARIABLES
	float x,y;
	float initX, initY;
	float lastX, lastY;
	String algorithm;
	float distanceTraveled;
	int step;
	char direction;
	float counter;
	int term;
	boolean crossing;
	FloatList[] lines;

	Robot(int initX, int initY, String algo)
	{
		// INITIAL STARTING POSITIONS
		this.x = initX;
		this.y = initY;
		this.initX = initX;
		this.initY = initY;
		this.lastX = initX;
		this.lastY = initY;
		this.algorithm = algo;
		// TOTAL DISTANCE TRAVELED
		this.distanceTraveled = 0;
		this.direction = 'L';
		this.counter = 0;
		this.term = 0;
		this.crossing = false;

		// LINES IS AN ARRAY OF 4 FLOATLISTS, X1,Y1,X2,AND Y2
		// ITEMS WITH THE SAME INDEX ARE PART OF THE SAME LINE
		this.lines = new FloatList[4];
		for (int i = 0; i <= 3; i++) {
			this.lines[i] = new FloatList();
		}
	}

	void move()
	{
		float dx;

		// BRIDGE HAS NOT BEEN FOUND YET
		if (this.x >= bridgePos+75) {
			// MOVE $SPEED NUMBER OF PIXELS BEFORE CALCULATING NEXT TERM
			if (this.counter <= 0) {
				this.counter = this.nextTerm();

				// MOVE UP IF CG, DOWN IF DA AFTER EACH TERM
				if (this.algorithm == "CG") {
					this.y += 5;
				}
				else {
					this.y -= 5;
				}
				this.turn();
				this.term++;
			}
			else {

				// CHANGE X BY $SPEED PIXELS PER FRAME
				if (this.algorithm == "CG") {
					dx = cgSpeedSlider.getValueF();
				}
				else {
					dx = daSpeedSlider.getValueF();
				}

				if (this.counter - dx < 0) {
					dx = this.counter;
				}

				// IF MOVING RIGHT, ADD TO X
				if (this.direction == 'R') {
					this.x += dx;
					this.distanceTraveled += dx;
					this.counter -= dx;
				}
				// IF MOVING LEFT, SUBTRACT FROM X
				else {
					this.x -= dx;
					this.distanceTraveled += dx;
					this.counter -= dx;
				}
			}
		}

		// BRIDGE HAS BEEN FOUND
		else {

			// DRAW LINE FROM CURRENT POSITION TO THE LAST POSITION
			this.addLine();

			// ROBOT WALKS TO BRIDGE
			if (this.y > (height/2)+100) {
				this.y -= daSpeedSlider.getValueF();
			}
			else if (this.y < (height/2)-100) {
				this.y += cgSpeedSlider.getValueF();
			}
		}
	}

	float nextTerm()
	{
		// CALCULATE NEXT TERM

		// CONSTANT GROWTH
		if (this.algorithm == "CG") {
			return step*(this.term);
		}
		// DOUBLING ALGORITHM
		else if (this.algorithm == "DA") {
			return step*pow(2, this.term-1);
		}
		// REQUIRED FLOAT RETURN
		return 0;
	}

	void turn()
	{
		// TURN AROUND ROBOT
		if (this.direction == 'L') {
			this.direction = 'R';
		}
		else {
			this.direction = 'L';
		}
		// DRAW MARKER LINE
		addLine();
		// LAST X,Y BECOMES CURRENT X,Y
		this.lastX = this.x;
		this.lastY = this.y;
	}

	void reset()
	{
		// RESET VALUES TO SLIDER SETTINGS
		if (this.algorithm == "CG") {
			this.x = cgPosSlider.getValueF();
			this.lastX = cgPosSlider.getValueF();
			this.step = cgStepSlider.getValueI();
		}
		else {
			this.x = daPosSlider.getValueF();
			this.lastX = daPosSlider.getValueF();
			this.step = daStepSlider.getValueI();
		}
		this.y = this.initY;
		this.lastY = this.initY;

		// CLEAR LINES LISTS
		for (int i = 0; i <= 3; i++) {
			this.lines[i] = new FloatList();
		}

		// RESET VALUES
		this.term = 0;
		this.counter = 0;
		this.distanceTraveled = 0;
	}

	void addLine()
	{
		// ADD A NEW LINE FROM CURRENT POSITION TO LAST POSITION 
		// CONSTANT GROWTH (MOVING DOWN)
		if (this.algorithm == "CG") {
			this.lines[0].append(this.lastX);
			this.lines[1].append(this.lastY - 25);
			this.lines[2].append(this.x);
			this.lines[3].append(this.lastY - 25);
		}
		// DOUBLING ALGORITHM (MOVING UP)
		else {
			this.lines[0].append(this.lastX);
			this.lines[1].append(this.lastY + 25);
			this.lines[2].append(this.x);
			this.lines[3].append(this.lastY + 25);
		}
	}
}
