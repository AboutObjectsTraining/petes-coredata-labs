//
//  Geometry.h
//  Experiments
//
//  Created by Peter Victoratos on 2/3/20.
//  Copyright © 2020 GGOG. All rights reserved.
//

struct CDXSize {
    double width;
    double height;
};
typedef struct CDXSize CDXSize;

CDXSize newSize(double width, double height);
CDXSize offset(CDXSize existingSize, double dx, double dy);

void show(CDXSize size);
