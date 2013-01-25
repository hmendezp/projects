Fraction class in objective-c
=============================

Personal Project about Fraction Class to implementent operations on fractions.

You need GNUstep installed, and then you can compile with this command line:

gcc `gnustep-config --objc-flags` -L /GNUstep/System/Library/Libraries FractionTest.m Fraction.m -o FractionTest -lgnustep-base -lobjc

There are implemented the following operations: add, subtract, multiply and divide.

When you run the FractionTest you will get the following output:

$ FractionTest

-3/4

 +

-1/10

=

-17/20


-1/4
 -
-1/2
 =
1/4


3/4
 x
-2/3
 =
-1/2


-2/3
 /
3/4
 =
-8/9

