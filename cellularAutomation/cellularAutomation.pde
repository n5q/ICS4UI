// CONSTANTS
int n = 50;
int padding = 0;
int fps = 100;
float percentFish = 0.5;
float plasticChance = 0.0;
float microplasticChance = 0.75;

//DO NOT MODIFY
int numFish = round(n*(n-1)*percentFish);
int counter = 0;
float cellSize;
int[][] cells; 
int[][] next;
int[][] clean;

///////////////////////////////////////////////////////////
// BOOL ISGREEN[], ISGREENNEXT[], ISPINK[], ISPINKNEXT[] //
///////////////////////////////////////////////////////////

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
	size(900,900);
	cellSize = (width-2*padding)/n;
	cells = new int[n][n];
	next = new int[n][n];
	clean = new int[n][n];
	frameRate(fps);
	init();
}


void draw()
{  
	background(0,0,0);
	for(int i = 0; i < n; i++) {
		float y = padding + i*cellSize;

		for (int j = 0; j < n; j++) {
			float x = padding + j*cellSize;

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
	nextGen();
}


void init()
{	
	for (int row = 0; row < n; row++) {
		for (int col = 0; col < n; col++) {
			if (col == n-1)
				cells[row][col] = L;
			else
				cells[row][col] = W;
		}		
	}
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			clean[i][j] = cells[i][j];	
		}
	}

	while (numFish > 0) {
		int row = round(random(0,n-1));
		int col = round(random(0,n-2));
		if (cells[row][col] == W)
			cells[row][col] = F0;
			numFish--;
	}
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			next[i][j] = cells[i][j];	
		}
	}
}


void moveHuman()
{
	if (counter == 0) {
		next[n-1][n-1] = H;
		counter++;
	}
	else if (counter == n) {
		next[0][n-1] = L;
		counter = 0;
	}
	else {
		for (int row = 0; row < n; row++) {
			if (cells[row][n-1] == H) {
				// println(row,n);
				next[row][n-1] = L;
				next[row-1][n-1] = H;
				counter++;
			}
		}
	}
}

void spawnPlastic()
{
	for (int row = 0; row < n; row++) {
		if (next[row][n-1] == H) {
			int drop = round(random(0,100));
			int type = round(random(0,100));

			if ((microplasticChance*100) >= type) { type = MP; }
			else { type = LP; }

			if ((plasticChance*100) >= drop && next[row][n-2] == W) {
				next[row][n-2] = type;
			}
		}
	}
}

void movePlastic()
{
	for (int row = 0; row < n; row++) {
		for (int col = 0; col < n; ++col) {
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
					catch (ArrayIndexOutOfBoundsException e) {println(row,col); loop--;}
				} 
			}
		}
	}
}

void moveFish()
{
	for (int row = 0; row < n; row++) {
		for (int col = 0; col < n; ++col) {

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
					catch (ArrayIndexOutOfBoundsException e) {println(row,col); loop--;}
				}
			}
		}
	}
}




void updateCells()
{
	int a = 0;
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			cells[i][j] = next[i][j];
			if (cells[i][j] == F0) a++;
			next[i][j] = clean[i][j];
		}
	}
	println(a);
}

void nextGen()
{
	moveHuman();
	movePlastic();
	moveFish();
	spawnPlastic();
	updateCells();
	println();
}
