class Complex
{
	float realPart;
	float imaginaryPart;

	Complex(float r, float i)
	{
		this.realPart = r;
		this.imaginaryPart = i;
	}

	Complex add(Complex z)
	{
		float real = this.realPart + z.realPart;
		float imaginary = this.imaginaryPart + z.imaginaryPart;
		return new Complex(real, imaginary);
	}

	Complex multiply(Complex z)
	{
		float r1 = this.realPart;
		float i1 = this.imaginaryPart;
		float r2 = z.realPart;
		float i2 = z.imaginaryPart;
		float real = r1*r2 - i1*i2;
		float imaginary = r1*r2 + i1*i2;
		return new Complex(real, imaginary);
	}

	float abs()
	{
		float abs = sqrt(this.realPart*this.realPart + this.imaginaryPart*this.imaginaryPart);
		return abs;
	}

	void display()
	{
		String str;

		if (this.realPart == 0 && this.imaginaryPart == 0) {
			str = "0";
		}
		else if (this.realPart == 0) {
			str = str(this.imaginaryPart) + "i";
		}
		else if (this.imaginaryPart == 0) {
			str = str(this.realPart);
		}
		else if (this.imaginaryPart == 1) {
			str = str(this.realPart) + " + i ";
		} 
		else if (this.imaginaryPart == -1) {
			str = str(this.realPart) + " - i ";
		} 
		else if (this.imaginaryPart < 0) {
			str = str(this.realPart) + " - " + str(this.imaginaryPart * -1) + "i";
		}
		else {
			str = str(this.realPart) + " + " + str(this.imaginaryPart) + "i";
		}
		println(str);
	}

}

void setup() {
	Complex z = new Complex(4, 1);
	Complex w = new Complex(2, 2);
	Complex i = new Complex(0, 1);

	Complex p = z.multiply(w);
	p.display();
  
	// z.display();    //Should print "6+8i" to the screen
	// w.display();   //Should print "-2.5-7.9i"  ("-2.5+-7.9i" is okay for today, but eventually 
 //                           //improve the code so that it prints the nicer way)
	// i.display();    //Should print just "i"  
 //                       //"0+1i" is okay for today, but improve your code eventually)
  
	// float absZ = z.abs();
	// float absI = i.abs();
	
	// println( absZ );   //Should print 10.0
	// println( absI );    //Should print 1.0
  
	// Complex zPlusW = z.multiply( w );
	// println(zPlusW.imaginaryPart);
	// zPlusW.display();    //Should print "3.5+0.1i"
  
	// Complex wPlusI = w.multiply( i );
	// wPlusI.display();    //Does it print the right thing?
}
