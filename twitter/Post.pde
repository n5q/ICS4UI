class Post
{
	String contents;
	User author;
	int likes;
	int dislikes;
	int reposts;
	int score;
	int nReplies;
	String timestamp;
	String date;
	ArrayList<User> likedBy;
	ArrayList<User> repostedBy;
	ArrayList<Post> replies;
	Post parent;
	boolean isReply;

	Post(String c, User a)
	{
		this.contents = c;
		this.author = a;
		this.likes = 0;
		this.dislikes = 0;
		this.reposts = 0;
		this.score = 0;
		this.timestamp = str(hour()) + ":" + str(minute()) + ":" + str(second());
		this.date = str(month()) + "/" + str(day()) + "/" + str(year());
		this.likedBy = new ArrayList<User>();
		this.repostedBy = new ArrayList<User>();
		this.replies = new ArrayList<Post>();

	}

	Post(String c, User a, Post reply)
	{
		this.contents = c;
		this.author = a;
		this.likes = 0;
		this.dislikes = 0;
		this.reposts = 0;
		this.score = 0;
		this.timestamp = str(hour()) + ":" + str(minute()) + ":" + str(second());
		this.date = str(month()) + "/" + str(day()) + "/" + str(year());
		this.likedBy = new ArrayList<User>();
		this.repostedBy = new ArrayList<User>();
		this.replies = new ArrayList<Post>();
		this.parent = reply;
		this.parent.nReplies++;
		this.parent.replies.add(this);

	}

	void display()
	{
		println("***********************************");
		println("Post by:", this.author.name);
		println(this.contents);
		println("♥", this.score, " ↩", this.nReplies, " 🔁", this.reposts);
		println("Posted on", this.date, "at", this.timestamp);
		println("***********************************");


		for (Post p: this.replies) {
			println("-----------------------------------");
			println("Reply by:", p.author.name);
			println(p.contents);
			println("♥", p.score, " ↩", p.nReplies, " 🔁", p.reposts);	
			println("Replied on", this.date, "at", this.timestamp);
		}
	}

	void reply(User u, String c)
	{
		println(u.name, "has posted: ", c);
		Post p = new Post(c, u, this);
		u.posts.add(p);
		u.nPosts++;
		this.display();
	}
}
