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
		println(this.name, "has posted: ", c);
		Post p = new Post(c, this);
		this.posts.add(p);
		this.nPosts++;
	}

	void delPost(Post p)
	{
		println(this.name, "Has deleted a post:", p.contents);
		this.posts.remove(p);
		this.nPosts--;
	}

	void follow(User u)
	{
		println(this.name, "has followed", u.name);
		this.following.add(u);
		this.nFollowing++;
		u.followers.add(this);
		u.nFollowers++;
	}

	void unfollow(User u)
	{
		println(this.name, "has unfollowed", u.name);
		this.following.remove(u);
		this.nFollowing--;
		u.followers.remove(this);
		u.nFollowers--;		
	}

	void like(Post p)
	{
		println(this.name, "has liked", p.contents, "by", p.author.name);
		this.likedPosts.add(p);
		p.likedBy.add(this);
		p.likes++;
		p.score++;
	}
	
}