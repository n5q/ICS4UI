void setup(){
	String input = "pi/3"; 
	float x = float(getNumerator(input)) * PI / float(getDenominator(input));
	size(1366,768);
	background(0);
	PFont f = createFont("Arial", 24);
	textFont(f);
	int y = 300;
	fill(255,255,255);
	stroke(255);
	line(width/1.65,250,width/4,250);
	text("θ", width/4, 225);
	fill(0,255,0);
	text("sinθ", width/3, 225);
	fill(255,0,0);
	text("cosθ",630,225);
	for (int i=0; x<(2*PI); i+=int(getNumerator(input))){
		x = i * PI / int(getDenominator(input));
		String newStr = str(i)+"pi/"+getDenominator(input);
		fill(255);
		text(cleanInput(newStr), width/4, y);
		fill(0,255,0);

		//ACCOUNT FOR FLOATING POINT INNACURACY
		if (x%PI == 0){
			text(str(round(sin(x))), width/3, y);
		}
		else{
			text(str(sin(x)), width/3, y);
		}

		fill(255,0,0);
		text(str(cos(x)), 630, y);

		y+=50;



	

	}
}


String cleanInput(String input){


	int numerator = int(getNumerator(input));
	int denominator = int(getDenominator(input));
	int gcd = gcd(numerator,denominator);
	String num = str(numerator/gcd) + "π";
	String den = "/" + str(denominator/gcd);

	
	if(den.equals("/1")){
		den = "";
	}


	if(num.equals("1π")){
		num = "π";
	}

	if(num.equals("0π")){
		return "0";
	}
	else{
		return num + den;
	}

}

int gcd(int a, int b){
	int c = a % b;
	if (c == 0){
		return b;
	}
	else{
		return gcd(b,c);
	}
}


String getNumerator(String input){ 
	int p = input.indexOf("p");
	if (p==0){
		return "1";
		}
	else{
		return (input.substring(0,p));
	}
}



String getDenominator(String input){
	int d = input.indexOf("/");

	if(d==-1){
		return "1";
	}
	else{
		return (input.substring(d+1));
	}
}



void printTable(String input, float x){

	println(input + "			" + str(sin(x)) + "			" + str(cos(x)));
}

