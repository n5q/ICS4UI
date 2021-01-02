class Message
{
	User sender;
	User reciever;
	String contents;
	String timestamp;
	String date;

	Message(User s, User r, String c)
	{
		this.sender = s;
		this.reciever = r;
		this.contents = c;
		this.timestamp = str(hour()) + ":" + str(minute()) + ":" + str(second());
		this.date = str(day()) + "/" + str(month()) + "/" + str(year());
	}
}