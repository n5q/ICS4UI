boolean[] cells;
//THIS VERSION ANIMATES

int n = 10;
float cellSize;
float padding = 50;
int blinksPerSecond = 2; //used in the call to frameRate() inside setup()

void setup()
{
  size(1000,500);
  cellSize = (width-2*padding)/n;
  cells = new boolean[n];
  setCellValuesRandomly();
  frameRate( blinksPerSecond );
  //NOTICE WE'VE LEFT OUT THE noLoop() COMMAND, SO draw() WILL BE CALLED REPEATEDLY. WE WANT THIS BECAUSE THIS IS AN ANIMATION, NOT JUST A SINGLE PICTURE
}


void draw()
{  
  background(255,255,0);
  float y = height/2;
  
  for(int i=0; i<n; i++)
  {
    float x = padding + i*cellSize;
    
    if ( cells[i] )
      fill(255);
      
    else
      fill(0);
      
    rect(x, y, cellSize, cellSize);
  }
  
  setCellValuesRandomly(); //RESETS THE CELL VALUES RANDOMLY AFTER EACH FRAME, CREATING A BLINKING EFFECT.
}


void setCellValuesRandomly()
{
  for(int i=0; i<n; i++)
  {
    int x = round(random(0,1));
    
    if (x == 0)
      cells[i] = false;
      
    else
      cells[i] = true;
  }
}

 
