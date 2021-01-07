// SOCIAL MEDIA SIMULATOR
// NASIF QADRI ICS4UI

void setup()
{
	Site twitter = new Site("twitter");
	String[] names = loadStrings("names.txt");
	String[] sentences = loadStrings("sentences.txt");

	while (true) {
		int a = 0;
		int b = 0;
		if (round(random(10)) == 0) {
			if (round(random(2)) < 2) {
				User u = new User(names[round(random(names.length-1))], twitter);
				twitter.users.add(u);
				delay(1000);
				println();
			}
			else {
				for (User u: twitter.users) {
					if (!u.loggedIn) {
						println(u.name, "has logged in");
						u.loggedIn = true;
						delay(1000);
						println();
					}
				}
			}
		}

		else {
			for (User u: twitter.users) {
				if (u.loggedIn) {
					int n = round(random(15));
					try {
						a = round(random(u.following.size()-1));
						b = round(random(u.following.get(a).posts.size()-1));
					}
					catch (IndexOutOfBoundsException e) {
						a = 0;
						b = 0;
					}
					if (n < 2) {
						u.post(sentences[round(random(sentences.length-1))]);
						delay(1000);
						println();
					}
					else if (n == 2) {
						int i = round(random(twitter.users.size()-1));
						if (twitter.users.get(i) != u) {
							u.follow(twitter.users.get(i));
							delay(1000);
							println();
						}
					}
					else if (n == 3) {
						u.loggedIn = false;
						println(u.name, "has logged out");
						delay(1000);
						println();
					}
					else if (a+b != 0) {
						try {
							if (n == 4 || n == 5 || n == 6) {
								u.like(u.following.get(a).posts.get(b));
								u.following.get(a).posts.get(b).display();
								delay(1000);
								println();
							}
							else if (n == 7 || n == 8 || n == 9) {
								u.dislike(u.following.get(a).posts.get(b));
								u.following.get(a).posts.get(b).display();
								delay(1000);
								println();
							}
							else if (n == 10 || n == 11 || n == 12) {
								println(u.name, "has replied to a post by", u.following.get(a).name);
								u.following.get(a).posts.get(b).reply(u, sentences[round(random(sentences.length-1))]);
								delay(1000);
								println();
							}		
							else if (n == 13) {
								u.unfollow(u.following.get(a));
								delay(1000);
								println();
							}
							else if (n == 14 || n == 15) {
								u.repost(u.following.get(a).posts.get(b));
								delay(1000);
								println();
							}
						}
						catch (IndexOutOfBoundsException e) {}
					}
				}
			}
 		}
		
	}



}
