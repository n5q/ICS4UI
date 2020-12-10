import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class GameOfLife extends PApplet {

int[][] init = 
{

// SET INITIAL SEED HERE

{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

};
boolean[][] cells; 
boolean[][] next;

int n = 25;
float cellSize;
float padding = 5;
int blinksPerSecond = 2;

public void setup()
{
  
  cellSize = (width-2*padding)/n;
  cells = int2bool(init);
  next = new boolean[n][n];
  frameRate( blinksPerSecond );
  // setCellValuesRandomly();
}


public void draw()
{  
  background(0,0,0);
  for(int i = 0; i < n; i++) {
    float y = padding + i*cellSize;

    for (int j = 0; j < n; j++) {
      float x = padding + j*cellSize;

      if (cells[i][j]) 
        fill(225,225,30);
      else
        fill(255);  
      rect(x, y, cellSize, cellSize);
    }
  }
  nextGen();
  // setCellValuesRandomly();
}


public void setCellValuesRandomly()
{
  for(int i=0; i<n; i++) {
    for (int j = 0; j < n; j++) {
      int x = round(random(0,5));
      if (x == 0)
        cells[i][j] = false;
        
      else
        cells[i][j] = true;
    }
  }
}


public void nextGen()
{
	for (int row = 0; row < n; row++) {
		for (int col = 0; col < n; col++) {
			int neighbours = livingNeighbors(row, col);

			if (cells[row][col])
				if (neighbours == 2 || neighbours == 3)
					next[row][col] = true;
				else
					next[row][col] = false;
			else
				if (neighbours == 3)
					next[row][col] = true;
				else
					next[row][col] = false;
		}
	}

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			cells[i][j] = next[i][j];
		}
	}
}

public int livingNeighbors(int i, int j)
{
	int count = 0;
	for (int a = -1; a < 2; a++) {
		for (int b = -1; b < 2; b++) {
				try {
					if (cells[i + a][j + b] && (a!=0 || b!=0))
						count++;
				}
				catch (ArrayIndexOutOfBoundsException e){}
		}
	}
	return count;
}

public boolean[][] int2bool(int[][] arr) 
{
	boolean[][] converted = new boolean[n][n];
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			if (arr[i][j] == 1)
				converted[i][j] = true;
			else
				converted[i][j] = false;
		}
	}
	return converted;
}
  public void settings() {  size(800,800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GameOfLife" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
