boolean[][] cells;
//THIS VERSION ANIMATES

int n = 69;
float cellSize;
float padding = 50;
int blinksPerSecond = 2; //used in the call to frameRate() inside setup()

void setup()
{
  size(1000,1000);
  cellSize = (width-2*padding)/n;
  cells = new boolean[n][n];
  setCellValuesRandomly();
  frameRate( blinksPerSecond );
  //NOTICE WE'VE LEFT OUT THE noLoop() COMMAND, SO draw() WILL BE CALLED REPEATEDLY. WE WANT THIS BECAUSE THIS IS AN ANIMATION, NOT JUST A SINGLE PICTURE
}
void draw()
{  
  background(255,255,0);
  // float y = height/2;
  
  for(int i = 0; i < n; i++)
  {
    float y = padding + i*cellSize;
    for (int j = 0; j < n; j++)
    {
      float x = padding + j*cellSize;
      
      if ( cells[i][j] )
        fill(255);
        
      else
        fill(0);
        
      rect(x, y, cellSize, cellSize);
    }
  }
  
  setCellValuesRandomly(); //RESETS THE CELL VALUES RANDOMLY AFTER EACH FRAME, CREATING A BLINKING EFFECT.
}


void setCellValuesRandomly()
{
  for(int i=0; i<n; i++)
  {
    for (int j = 0; j < n; j++)
    {
      int x = round(random(0,1));
      println(x);
      if (x == 0)
        cells[i][j] = false;
        
      else
        cells[i][j] = true;
    }
  }
}

 
