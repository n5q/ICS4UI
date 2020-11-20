
void setup(){
	String rad = "2pi/3";
	size(500,500);
	background(0);

	fill(255);
	PFont f = createFont("Arial", 24);
	textFont(f);
	text(convert(rad, true),  150, height/4);
	drawArc(float(convert(rad, false)));
}


String convert(String rad, boolean full){
	String deg;
	float num;
	float den;
	String rads;
	String degs;
	String result;
	int p = rad.indexOf('p');
	int d = rad.indexOf("/");

	if (p==0){
		num = 1;
		// rads = "π";
	}
	else{
		num = float(rad.substring(0,p));
		// rads = str(num) + "π";
	}


	if(d==-1){
		den = 1;
	}
	else{
		den = float(rad.substring(d+1));
	}

	deg = str(180 * num/den)+"";

	result = clean(str(num), true) + "π/" + clean(str(den), true) + " radians = " + clean(deg, false) + "◦";

	if(full){
		return(result);
	}
	else{
		return(deg);
	}
}

String clean(String n, boolean cut1){

	if (float(n) == int(n)){
		n = str(int(n));
	}

	if (cut1){
		if (n.equals("1")){
			n = "";
		}
	}
	return n;
}

void drawArc(float degs){
	fill(0,255,0);
	arc(250,300,100,100,radians(-degs),radians(0));
	noFill();
	stroke(255);
	circle(250,300,100);
}