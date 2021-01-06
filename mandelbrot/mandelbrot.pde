float aMax = 1;
float aMin = -2;

float bMax = 1.5;
float bMin = -1.5;
float w = 1000;
float h = 1000;

float slopea = (aMax-aMin)/w;
float intercepta = aMin;
float slopeb = (bMin-bMax)/h;
float interceptb = bMax;

void setup()
{
	size(1000, 1000);
	background(0);
	fill(255);
	stroke(255);
	noLoop();

}

void draw()
{

	for (float x = 0; x <= 1000; x+=1) {
		float a = get_a(x);
		for (float y = 0; y <= 1000; y+=1) {
			float bi = get_bi(y);

			Complex c = new Complex(a, bi);
			Complex z = c;
			int n = 0;

			while (z.abs() < 2 && n < 200) {
				z = z.squared().add(c);
				n++;
			}

			if (n == 200) {
				point(x,y);
			}
		}
	}
}

float get_a(float x)
{
	return slopea*x + intercepta;
}

float get_bi(float y)
{
	return slopeb*y + interceptb;
}


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
		float imaginary = r1*i2 + r2*i1;
		return new Complex(real, imaginary);
	}

	Complex squared()
	{
		return this.multiply(this);
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