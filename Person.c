//
//  Person.c
//  ANSI C Basics
//
//  Created by Peter Victoratos on 1/30/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#include <stdlib.h>
#include "Person.h"

// Allocates a space in memory for a Person struct, dynamically 
Person *AllocPerson(void)
{
    return calloc(1, sizeof(Person));
}

Person *InitPerson(Person *self, const char *firstName, const char *lastName, int age)
{
    //initializes members of self with the provided argument values
    //uses -> to access the members of self, defined in the function
    self->firstName = CopyString(firstName);
    self->lastName = CopyString(lastName);
    self->age = age;

    return self;
}
