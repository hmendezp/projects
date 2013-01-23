#import "Fraction.h"
#import <stdio.h>
#import <math.h>

@implementation Fraction
@synthesize numerator, denominator;
- (void) print
{
  printf ("%i/%i \n", numerator, denominator);
}
- (void) setTo: (int) n over: (int) d
{
	numerator = n;
	denominator = d;
}
- (double) convertToNum
{
	if (denominator != 0)
		return (double) numerator / denominator;
	else
		return NAN;
}

// add a Fraction to the receiver and reduce the result
-(Fraction *) add: (Fraction *) f
{
	// To add two fractions:
	// a/b + c/d = ((a*d) + (b*c)) / (b * d)
	// result will store the result of the addition
	Fraction *result = [[Fraction alloc] init];
	result.numerator = numerator * f.denominator +
	denominator * f.numerator;
	result.denominator = denominator * f.denominator;
	[result reduce];
	return result;
}

- (void) reduce
{
	int u = numerator;
	int v = denominator;
	int temp;
	while (v != 0) {
		temp = u % v;
		u = v;
		v = temp;
	}
	numerator /= u;
	denominator /= u;
}
@end
