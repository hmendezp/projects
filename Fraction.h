#import <Foundation/Foundation.h>

@interface Fraction : NSObject
{
  int sign, numerator, denominator;
}
@property int sign, numerator, denominator;
- (void) print;
- (void) setTo: (int) n over: (int) d;
- (double) convertToNum;
- (Fraction *) add: (Fraction *) f;
- (Fraction *) subtract: (Fraction *) f;
- (Fraction *) multiply: (Fraction *) f;
- (Fraction *) divide: (Fraction *) f;
- (void) reduce;
@end
