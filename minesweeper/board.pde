class Board
{
	int size;
	int padding;
	String difficulty;
	int moves;
	Cell[][] cells;
	float percentMines;
	int mines;
	// int setup;

	// Board(boolean setup)
	// {
	// 	this.setup = 0
	// }

	Board()
	{
		this.size = 9;
		this.difficulty = "easy";
		this.cells = new Cell[this.size][this.size];
		this.moves = 0;		

		if (this.difficulty == "easy") {
			this.percentMines = 0.1;
		}
		else if (this.difficulty == "medium") {
			this.percentMines = 0.2;
		}
		else if (this.difficulty == "hard") {
			this.percentMines = 0.3;
		}
		else if (this.difficulty == "impossible") {
			this.percentMines = 0.5;
		}

		this.mines = round(this.size*this.size*percentMines);
	}




	Board(int s, String d)
	{
		this.size = s;
		this.difficulty = d;
		this.cells = new Cell[this.size][this.size];
		this.moves = 0;

		if (this.difficulty == "easy") {
			this.percentMines = 0.1;
		}
		else if (this.difficulty == "medium") {
			this.percentMines = 0.2;
		}
		else if (this.difficulty == "hard") {
			this.percentMines = 0.3;
		}
		else if (this.difficulty == "impossible") {
			this.percentMines = 0.5;
		}

		this.mines = round(this.size*this.size*percentMines);

	}

	void init()
	{
		for (int row = 0; row < this.size; row++) {
			for (int col = 0; col < this.size; col++) {

			}
		}
	}
}