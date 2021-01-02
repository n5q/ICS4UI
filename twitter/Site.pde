class Site
{
	String name;
	ArrayList<User> users;
	ArrayList<Post> posts;

	Site(String n)
	{
		this.name = n;
	}

	void delUser(User u)
	{
		for (Post p: posts) {
			if (p.author == u) {
				p = null;
			}
			u = null;
		}
	}
}

