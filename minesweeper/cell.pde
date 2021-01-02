class Cell
{
	boolean mine;
	boolean hidden;
	boolean marked;
	int neighbours;

	Cell()
	{
		this.mine = false;
		this.hidden = true;
		this.marked = false;
		this.neighbours = 0;
	}

	Cell(boolean m)
	{
		this.mine = true;
		this.hidden = true;
		this.marked = false;
		this.neighbours = 0;		
	}
	
}