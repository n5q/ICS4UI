class Post
{
	String contents;
	User author;
	int likes;
	int dislikes;
	int reposts;
	int score;
	String timestamp;
	String date;
	ArrayList<User> likedBy;
	ArrayList<User> repostedBy;

	Post(String c, User a)
	{
		this.contents = c;
		this.author = a;
		this.likes = 0;
		this.dislikes = 0;
		this.reposts = 0;
		this.score = 0;
		this.timestamp = str(hour()) + ":" + str(minute()) + ":" + str(second());
		this.date = str(day()) + "/" + str(month()) + "/" + str(year());
		this.likedBy = new ArrayList<User>();
		this.repostedBy = new ArrayList<User>();
	}

}