class User
{
	String name;
	int nFollowers;
	int nFollowing;
	int nPosts;
	Site site;
	ArrayList<Post> posts;
	ArrayList<Post> likedPosts;
	ArrayList<User> following;
	ArrayList<User> followers;
	ArrayList<Message> inbox;

	User(String u, String n, Site s)
	{
		this.name = n;
		this.nFollowers = 0;
		this.nFollowing = 0;
		this.nPosts = 0;
		this.score = 0;
		this.posts = new ArrayList<Post>();
		this.likedPosts = new ArrayList<Post>();
		this.following = new ArrayList<User>();
		this.followers = new ArrayList<User>();
		this.inbox = new ArrayList<Message>();
		this.site = s;
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
		for (User u: p.likedBy) {
			u.likedPosts.remove(p);
		}
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
		p.author.score++;
	}

	void dislike(Post p)
	{
		println(this.name, "has disliked", p.contents, "by", p.author.name);
		this.likedPosts.add(p);
		p.score--;
		p.author.score--;
		if (p.score < -5) {
			println(p.author.name, "was ashamed of the dislikes on their post", p.contents, "so they deleted it");\
			p.author.delPost(p);
		}

		if (p.author.score < -10) {
			println(p.author.name, "could not live with the fact that nobody likes their posts, so they deleted their account");
			p.author.site.delUser(p.author);
		}

	}

	void repost(Post p)
	{
		println(this.name, "has reposted: ", p.contents, "by", p.author);
		Post o = new Post(p.contents, this);
		p.reposts++;
		p.repostedBy.add(this);
	}

	void message(User u, String s)
	{
		println(this.name, "has sent a message to", u.name);
		Message m = new Message(this, u, s);
	}

	void reply(Post p, String c)
	{
		p.reply(this, c);
	}


}