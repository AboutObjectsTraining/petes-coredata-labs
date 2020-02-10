//
//  Geometry.m
//  ExperimentsTests
//
//  Created by Peter Victoratos on 2/3/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Geometry.h"

CDXSize newSize(double width, double height){
    //initializes the struct 
    CDXSize size = { width, height };
    return size;
}

CDXSize offset(CDXSize size, double dx, double dy){
    size.width += dx;
    size.height += dy;
    return size;
}

void show(CDXSize size) {
    NSLog(@"width: %.2f, height: %.2f", size.width, size.height);
}
