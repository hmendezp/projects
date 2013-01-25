#import "Fraction.h"
#import <stdio.h>
#import <math.h>

@implementation Fraction
@synthesize sign, numerator, denominator;
- (void) print
{
	printf ("%i/%i \n", sign * numerator, denominator);
}
- (void) setTo: (int) n over: (int) d
{
	sign = n * d >= 0 ? 1 : -1;
	numerator = abs(n);
	denominator = abs(d);
}
- (double) convertToNum
{
	if (denominator != 0)
		return (double) numerator / denominator;
	else
		return NAN;
}

// add a Fraction to the receiver and reduce the result
- (Fraction *) add: (Fraction *) f
{
	// To add two fractions:
	// a/b + c/d = ((a*d) + (b*c)) / (b * d)
	// result will store the result of the addition
	int sign_tmp;
	Fraction *result = [[Fraction alloc] init];
	if (sign == f.sign) {
		result.numerator = numerator * f.denominator +
		denominator * f.numerator;
		result.denominator = denominator * f.denominator;
		result.sign = sign;
	} else {
	    sign_tmp = [self convertToNum] >= [f convertToNum] ? sign : f.sign;
		sign = 1; // This setting is like apply the abs() over the fraction 1
		f.sign = 1; // This setting is like apply the abs() over the fraction 2
		result = [self convertToNum] >= [f convertToNum] ? [self subtract:f] : [f subtract:self];
		result.sign = sign_tmp;
	}
	[result reduce];
	return result;
}

- (Fraction *) subtract: (Fraction *) f
{
	// To add two fractions:
	// a/b - c/d = ((a*d) - (b*c)) / (b * d)
	// result will store the result of the subtraction
	int sign_tmp;
	Fraction *result = [[Fraction alloc] init];
	if (sign == f.sign) {
		result.numerator = numerator * f.denominator -
		denominator * f.numerator;
		result.denominator = denominator * f.denominator;
		result.sign = sign *(result.numerator >= 0 ? 1 : -1);
		result.numerator = abs(result.numerator);		
	} else {
		sign_tmp = [self convertToNum] >= [f convertToNum] ? sign : f.sign;
		sign = 1;  // This setting is like apply the abs() over the fraction 1
		f.sign = 1; // This setting is like apply the abs() over the fraction 2
		result = [self add:f];  //The SUM is made with the absolute values of fraction 1 and 2
		result.sign = sign_tmp; //The sign is recuperated from the temporal variable
	}
	[result reduce];
	return result;
}

- (Fraction *) multiply: (Fraction *) f
{
	// To multiply two fractions:
	// a/b * c/d = (a*c) / (b*d)
	Fraction *result = [[Fraction alloc] init];
	result.sign = sign * f.sign;
	result.numerator = numerator * f.numerator;
	result.denominator = denominator * f.denominator;
	[result reduce];
	return result;
}

- (Fraction *) divide: (Fraction *) f
{
	// To divide two fractions:
	// (a/b) / (c/d) = (a*d) / (b*c)
	Fraction *result = [[Fraction alloc] init];
	result.sign = sign * f.sign;
	result.numerator = numerator * f.denominator;
	result.denominator = denominator * f.numerator;
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
