//
//  Utilities.c
//  ANSI C Basics
//
//  Created by Peter Victoratos on 1/30/20.
//  Copyright © 2020 About Objects. All rights reserved.
//
#include <string.h>
#include <stdlib.h>

#include "Utilities.h"

//alloc the size of it -- dynamically (x+1) allocate memory for a copy of the string (x)
char *CopyString(const char *string)
{
    //checking for null serves some purpose..
    //not necessary but not a bad idea 
    if (string == NULL) return NULL;
    // creates an empty pointer to a char ivar
    char *copy = NULL;
    copy = malloc(strlen(string) + 1);
    //char * strcpy(char *, const char *);
    strcpy(copy, string);
    return copy;
}
