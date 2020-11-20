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

public class radiansToDegrees extends PApplet {


public void setup(){
	String rad = "2pi/3";
	
	background(0);

	fill(255);
	PFont f = createFont("Arial", 24);
	textFont(f);
	text(convert(rad, true),  150, height/4);
	drawArc(PApplet.parseFloat(convert(rad, false)));
}


public String convert(String rad, boolean full){
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
		num = PApplet.parseFloat(rad.substring(0,p));
		// rads = str(num) + "π";
	}


	if(d==-1){
		den = 1;
	}
	else{
		den = PApplet.parseFloat(rad.substring(d+1));
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

public String clean(String n, boolean cut1){

	if (PApplet.parseFloat(n) == PApplet.parseInt(n)){
		n = str(PApplet.parseInt(n));
	}

	if (cut1){
		if (n.equals("1")){
			n = "";
		}
	}
	return n;
}

public void drawArc(float degs){
	fill(0,255,0);
	arc(250,300,100,100,radians(-degs),radians(0));
	noFill();
	stroke(255);
	circle(250,300,100);
}
  public void settings() { 	size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "radiansToDegrees" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
