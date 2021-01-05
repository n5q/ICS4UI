void setup()
{
	Site twitter = new Site("twitter");
	String[] names = loadStrings("names.txt");
	String[] sentences = loadStrings("sentences.txt");

	while (true) {
		int a = 0;
		int b = 0;
		if (round(random(5)) == 0) {
			if (round(random(2)) == 0) {
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
					int n = round(random(8));
					try {
						a = round(random(u.following.size()-1));
						b = round(random(u.following.get(a).posts.size()-1));
						println('t');
					}
					catch (IndexOutOfBoundsException e) {
						a = 0;
						b = 0;
						println('f');
					}
					if (n <= 2) {
						u.post(sentences[round(random(sentences.length-1))]);
						delay(1000);
						println();
					}
					else if (n == 3) {
						int i = round(random(twitter.users.size()-1));
						if (twitter.users.get(i) != u) {
							u.follow(twitter.users.get(i));
							delay(1000);
							println();
						}
					}
					else if (n == 4) {
						u.loggedIn = false;
						println(u.name, "has logged out");
						delay(1000);
						println();
					}
					else if (a+b != 0) {
						if (n == 5 || n == 6 || n == 7) {
							u.like(u.following.get(a).posts.get(b));
							u.following.get(a).posts.get(b).display();
							delay(1000);
							println();
						}
						else if (n == 8 || n == 9) {
							u.dislike(u.following.get(a).posts.get(b));
							u.following.get(a).posts.get(b).display();
							delay(1000);
							println();
						}
						else if (n == 10) {
							u.following.get(a).posts.get(b).reply(u, sentences[round(random(sentences.length-1))]);
							delay(1000);
							println();
						}		


					}
				}
			}
 		}
		
	}



}