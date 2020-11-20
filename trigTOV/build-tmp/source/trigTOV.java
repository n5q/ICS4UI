import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class trigTOV extends PApplet {

public void setup(){
	String input = "pi/3"; 
	float x = PApplet.parseFloat(getNumerator(input)) * PI / PApplet.parseFloat(getDenominator(input));
	
	background(0);
	PFont f = createFont("Arial", 24);
	textFont(f);
	int y = 300;
	fill(255,255,255);
	stroke(255);
	line(width/1.65f,250,width/4,250);
	text("θ", width/4, 225);
	fill(0,255,0);
	text("sinθ", width/3, 225);
	fill(255,0,0);
	text("cosθ",630,225);
	for (int i=0; x<(2*PI); i+=PApplet.parseInt(getNumerator(input))){
		x = i * PI / PApplet.parseInt(getDenominator(input));
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


public String cleanInput(String input){


	int numerator = PApplet.parseInt(getNumerator(input));
	int denominator = PApplet.parseInt(getDenominator(input));
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

public int gcd(int a, int b){
	int c = a % b;
	if (c == 0){
		return b;
	}
	else{
		return gcd(b,c);
	}
}


public String getNumerator(String input){ 
	int p = input.indexOf("p");
	if (p==0){
		return "1";
		}
	else{
		return (input.substring(0,p));
	}
}



public String getDenominator(String input){
	int d = input.indexOf("/");

	if(d==-1){
		return "1";
	}
	else{
		return (input.substring(d+1));
	}
}



public void printTable(String input, float x){

	println(input + "			" + str(sin(x)) + "			" + str(cos(x)));
}

public float roundAny(float n, int d) {
	n = n*pow(10,d);
	n = round(n);
	n = n*pow(10,(-d));
	int lastN = PApplet.parseInt(str(n).substring(str(n).length()-1));
	
	return n;
}
  public void settings() { 	size(1366,768); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "trigTOV" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
