class User
{
	String username;
	String name;
	int nFollowers;
	int nFollowing;
	int nPosts;
	ArrayList<Post> posts;
	ArrayList<Post> likedPosts;
	ArrayList<User> following;
	ArrayList<User> followers;
	ArrayList<Message> inbox;

	User(String u, String n)
	{
		this.username = u;
		this.name = n;
		this.nFollowers = 0;
		this.nFollowing = 0;
		this.nPosts = 0;
		this.posts = new ArrayList<Post>();
		this.likedPosts = new ArrayList<Post>();
		this.following = new ArrayList<User>();
		this.followers = new ArrayList<User>();
		this.inbox = new ArrayList<Message>();
	}

	void post(String c)
	{
		Post p = new Post(c, this);
		posts.add(p);
		nPosts++;
		println(this.name, "has posted:", c);
	}

	
}