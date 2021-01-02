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
		this.date = str(day()) + "/" + str(month()) + "/" + str(year());
		this.likedBy = new ArrayList<User>();
		this.repostedBy = new ArrayList<User>();

	}

	Post(String c, User a, Post reply;)
	{
		if (reply) {
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
			this.parent = reply;
			this.parent.nReplies++;
			this.parent.replies.add(this);
		}

	}

	void display()
	{
		println("***********************************");
		println("Post by:", this.author.name);
		println("♥", this.likes, " ↩", this.nReplies, " 🔁", this.reposts);
		println("__________________________");
		println(this.contents);
		println("***********************************");
	}

	void reply(User u, String c)
	{
		println(u.name, "has posted: ", c);
		Post p = new Post(c, u, this);
		u.posts.add(p);
		u.nPosts++;
	}
}