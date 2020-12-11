// CONSTANTS
int n = 25;
int padding = 0;
int fps = 2;
float percentFish = 0.05;

//DO NOT MODIFY
int numFish = round(n*(n-1)*percentFish);
int counter = 0;
float cellSize;
int[][] cells; 
int[][] next;


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

			else if (cells[i][j] == L)
	        	fill(210,180,140);

	        else if (cells[i][j] == H)
	        	fill(0);
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

	while (numFish > 0) {
		int row = round(random(0,n-1));
		int col = round(random(0,n-2));
		println(row,col);
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


void nextGen()
{

//	HUMAN MOVEMENT
	if (counter == 0) {
		next[n-1][n-1] = H;
		counter++;
	}
	else if (counter == 25) {
		next[0][n-1] = L;
		counter = 0;
	}
	else {
		for (int row = 0; row < n; row++) {
			if (cells[row][n-1] == H) {
				next[row][n-1] = L;
				next[row-1][n-1] = H;
				counter++;
			}
		}
	}

//	FISH MOVEMENT
//	
// RANDOM NUMBER REPRESENTS THE DIRECTION THAT THE FISH WILL MOVE
//

	// for (int row = 0; row < n; row++) {
	// 	for (int col = 0; col < n; ++col) {
	// 		if (cells[i][j] = F0 || cells[i][j] = F1 || cells[i][j] = F2) {
	// 			dx = round(random(-1,1));
	// 			dy = round(random(-1,1);

	// 		}
	// 	}
	// }
	

//	UPDATE CELLS[][] WITH NEXT[][]
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			cells[i][j] = next[i][j];
		}
	}
}


// void nextGen()
// {
// 	for (int row = 0; row < n; row++) {
// 		for (int col = 0; col < n; col++) {
// 			int neighbours = livingNeighbors(row, col);

// 			if (cells[row][col])
// 				if (neighbours == 2 || neighbours == 3)
// 					next[row][col] = true;
// 				elseneighbours
// 					next[row][col] = false;
// 			else
// 				if (neighbours == 3)
// 					next[row][col] = true;
// 				else
// 					next[row][col] = false;
// 		}
// 	}

// 	for (int i = 0; i < n; i++) {
// 		for (int j = 0; j < n; j++) {
// 			cells[i][j] = next[i][j];
// 		}
// 	}
// }

// int livingNeighbors(int i, int j)
// {
// 	int count = 0;
// 	for (int a = -1; a < 2; a++) {
// 		for (int b = -1; b < 2; b++) {
// 				try {
// 					if (cells[i + a][j + b] && (a!=0 || b!=0))
// 						count++;
// 				}
// 				catch (ArrayIndexOutOfBoundsException e){}
// 		}
// 	}
// 	return count;
// }

