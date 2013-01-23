#import "Fraction.h"
#import <stdio.h>
#import <Foundation/Foundation.h>

int main(void)
{
  Fraction *Frac1 = [Fraction new];
	Fraction *Frac2 = [Fraction new];
	
	Fraction *resultFraction;
	
	[Frac1 setTo:3 over:4];
	[Frac2 setTo:1 over:10];
	
	[Frac1 print];
	printf(" + \n");
	[Frac2 print];
	printf(" = \n");
	resultFraction = [Frac1 add:Frac2];

	[resultFraction print];
	
	return 0;
}
