

// CONSTANTS
final int n = 50;
final int padding = 0;
final int fps = 2;
final float percentFish = 0.05;

//DO NOT MODIFY
int numFish = round(n*(n-1)*percentFish);

float cellSize;
char[][] cells; 
char[][] next;


void setup()
{
	size(1000,1000);
	cellSize = (width-2*padding)/n;
	cells = new char[n][n];
	next = new char[n][n];
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

			if (cells[i][j] == 'W') 
	        	fill(75,75,255);

	        else if (cells[i][j] == 'F')
	        	fill(255,120,150);

			else
	        	fill(210,180,140);  
      rect(x, y, cellSize, cellSize);
    }
  }
  // nextGen();
}


void init()
{	
	for (int row = 0; row < n; row++) {
		for (int col = 0; col < n; col++) {
			if (col == n-1)
				cells[row][col] = 'L';
			else
				cells[row][col] = 'W';
		}		
	}

	while (numFish > 0) {
		int row = round(random(0,n-1));
		int col = round(random(0,n-2));
		println(row,col);
		if (cells[row][col] == 'W')
			cells[row][col] = 'F';
			numFish--;
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
// 				else
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

