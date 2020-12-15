// MODIFY THESE
int size = 100;						// SIZE OF THE GRID (25x25 - 150x150 RECOMMENDED)
int speed = 75;						// SPEED OF THE ANIMATION (FPS)
float percentFish = 0.05;			// PERCENTAGE OF FISH IN COMPARISON TO THE CELL COUNT (DEFAULT IS 5%)
float plasticChance = 0.5;			// CHANCE OF PLASTIC TO BE DROPPED BY THE HUMAN IN EACH GENERATION (DEFAULT IS 50%)
float microplasticChance = 0.9;		// CHANCE OF EACH PLASTIC DROPPED BEING A MICROPLASTIC (DEFAULT IS 90%)
boolean borders = true;				// CELL BORDERS

//DO NOT MODIFY
int numFish = round(size*(size-1)*percentFish);
int counter = 0;
float cellSize;
int[][] cells; 
int[][] next;
int[][] clean;
int fishAlive;
int time;
int numPlastic;

final int W  = 0;	// WATER
final int L  = 1;	// LAND
final int H  = 2;	// HUMAN
final int F0 = 3;	// FISH WITH NO PLASTIC INGESTED
final int F1 = 4;	// FISH WITH 1 PLASTIC INGESTED
final int F2 = 5;	// FISH WITH 2 PLASTIC INGESTED
final int LP = 6;	// LARGE PLASTIC
final int MP = 7;	// MICROPLASTIC


void setup()
{
	size(1080,900);
	cellSize = (width-180)/float(size);
	println(cellSize);
	cells = new int[size][size];
	next = new int[size][size];
	clean = new int[size][size];
	frameRate(speed);
	if (!borders) {noStroke();}
	PFont font = createFont("Arial", 20);
	textFont(font);
	init();

}


void draw()
{  
	background(0);
	for(int i = 0; i < size; i++) {
		float y = i*cellSize;

		for (int j = 0; j < size; j++) {
			float x = j*cellSize;

			if (cells[i][j] == W) 
	        	fill(75,75,255);

	        else if (cells[i][j] == F0)
	        	fill(255,120,150);

	        else if (cells[i][j] == F1)
	        	fill(160,80,140);

	        else if (cells[i][j] == F2)
	        	fill(120,30,100);	        

			else if (cells[i][j] == L)
	        	fill(210,180,140);

	        else if (cells[i][j] == H)
	        	fill(0);

	        else if (cells[i][j] == LP)
	        	fill(255);

	        else if (cells[i][j] == MP)
	        	fill(150,150,255);

	        else
	        	fill(255);

      rect(x, y, cellSize, cellSize);
    	}
	}


	String alive = "Fish alive:  " + fishAlive;
	String t = "Generations:  " + time;
	fill(255);

	text(alive, width-160, 50);
	text(t, width-175, 100);

	nextGen();
	time++;
}


void init()
{	
	for (int row = 0; row < size; row++) {
		for (int col = 0; col < size; col++) {
			if (col == size-1)
				cells[row][col] = L;
			else
				cells[row][col] = W;
		}		
	}
	for (int i = 0; i < size; i++) {
		for (int j = 0; j < size; j++) {
			clean[i][j] = cells[i][j];	
		}
	}

	while (numFish > 0) {
		int row = round(random(0,size-1));
		int col = round(random(0,size-2));
		if (cells[row][col] == W)
			cells[row][col] = F0;
			numFish--;
	}
	for (int i = 0; i < size; i++) {
		for (int j = 0; j < size; j++) {
			next[i][j] = cells[i][j];	
		}
	}
}


void moveHuman()
{
	if (counter == 0) {
		next[size-1][size-1] = H;
		counter++;
	}
	else if (counter == size) {
		next[0][size-1] = L;
		counter = 0;
	}
	else {
		for (int row = 0; row < size; row++) {
			if (cells[row][size-1] == H) {
				// println(row,size);
				next[row][size-1] = L;
				next[row-1][size-1] = H;
				counter++;
			}
		}
	}
}

void spawnPlastic()
{
	for (int row = 0; row < size; row++) {
		if (next[row][size-1] == H) {
			int drop = round(random(0,100));
			int type = round(random(0,100));

			if ((microplasticChance*100) >= type) { type = MP; }
			else { type = LP; }

			if ((plasticChance*100) >= drop && next[row][size-2] == W) {
				next[row][size-2] = type;
			}
		}
	}
}

void movePlastic()
{
	for (int row = 0; row < size; row++) {
		for (int col = 0; col < size; ++col) {
			if (cells[row][col] == MP || cells[row][col] == LP) {
				int type = cells[row][col];
				boolean tryAgain = true;
				int loop = 20;
				while (tryAgain == true && loop > 0) {
					// println(row,col);
					int dx = round(random(-1,1));
					int dy = round(random(-1,1));
					try {
						loop--;

						if (loop < 0) {
							println(0/0);
						}

						else if ((next[row + dx][col + dy] == W )) {	
								if (dx == 0 && dy == 0) { tryAgain = true; }
								else {
									next[row + dx][col + dy] = type;
									tryAgain = false;
								}
						}	
					}
					catch (ArithmeticException e) {tryAgain = false;}
					catch (ArrayIndexOutOfBoundsException e) {tryAgain = true;}
				} 
			}
		}
	}
}

void moveFish()
{
	for (int row = 0; row < size; row++) {
		for (int col = 0; col < size; ++col) {

			if (cells[row][col] == F0 || cells[row][col] == F1 || cells[row][col] == F2) {
				int fishType = cells[row][col];
				boolean tryAgain = true;
				int loop = 20;
				while (tryAgain == true && loop > 0) {
					// println(row,col);
					int dx = round(random(-1,1));
					int dy = round(random(-1,1));
					try {
						loop--;

						if (loop < 0) {
							println(0/0);
						}

						else if (next[row + dx][col + dy] == W) {
							if (dx == 0 && dy == 0) { tryAgain = true; }
							else {
								next[row + dx][col + dy] = fishType;
								tryAgain = false;							
							}
						}
						else if (next[row + dx][col + dy] == LP || next[row + dx][col + dy] == MP) {
							if (next[row + dx][col + dy] == LP) {
								
								if (dx == 0 && dy ==0) {}
								else {
									next[row + dx][col + dy] = W;
									next[row][col] = W;
									tryAgain = false;
								}
							}
							else {
								if (dx == 0 && dy ==0) {}
								else {
									if (fishType == F0) {fishType = F1;} else
									if (fishType == F1) {fishType = F2;} else
									if (fishType == F2)	{fishType =  W;}
									next[row + dx][col + dy] = fishType;
									next[row][col] = W;
									tryAgain = false;

								}
							}
						}
					}
					catch (ArithmeticException e) {tryAgain = false;}
					catch (ArrayIndexOutOfBoundsException e) {tryAgain = true;}
				}
			}
		}
	}
}




void updateCells()
{
	int a = 0;
	for (int i = 0; i < size; i++) {
		for (int j = 0; j < size; j++) {
			cells[i][j] = next[i][j];
			if (cells[i][j] == F0) a++;
			next[i][j] = clean[i][j];

		}
	}
	fishAlive = a;
}

void nextGen()
{
	moveHuman();
	movePlastic();
	moveFish();
	spawnPlastic();
	updateCells();




}
