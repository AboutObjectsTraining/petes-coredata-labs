//
//  Stuff.h
//  Experiments
//
//  Created by Peter Victoratos on 2/3/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#define FOO_BAR "Hello World!"

#ifdef __LP64__ //if we have LP64, typedef float, otherwise, typedef double
typedef double Percentage;
#else
typedef float Percentage;
#endif

Percentage calculateDiscount(float price, float discountAmount);
