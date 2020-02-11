//
//  Person.c
//  ANSI C Basics
//
//  Created by Peter Victoratos on 1/30/20.
//  Copyright © 2020 About Objects. All rights reserved.
//
#include <stdlib.h>

#include "Utilities.h"
#include "Person.h"
#include <stdio.h>
#include <string.h>

const char *Separator = ", ";
const char *AgeLabel = "Age: ";
const char *NotAvailable = "N/A";

// Allocates a space in memory for a Person struct, dynamically
Person *AllocPerson(void)
{
    return calloc(1, sizeof(Person));
}

//create a deallocate function that goes to the address of p1 and clears it?
//better to keep it const so that future YOU doesn't mutate a literal or something else that will explode 
Person *InitPerson(Person *self,
                   const char *firstName,
                   const char *lastName,
                   int age)
{
    //initializes members of self with the provided argument values
    //uses -> to access the members of self, defined in the function
    
    //CopyString is a good idea bc the name may change?
    //you should only use the -> durign a CopyWithZone call
    self->firstName = CopyString(firstName);
    self->lastName = CopyString(lastName);
    self->age = age;

    return self;
}

const char *FirstNameFromPerson(Person *self)
{
    if (self->firstName == NULL) {
        return NotAvailable;
    }
    return self->firstName;
}

const char *LastNameFromPerson(Person *self)
{
    if (self->lastName == NULL) {
        return NotAvailable;
    }
    return self->lastName;
}

size_t DescriptionLength(Person *self)
{
    char ageString[4];
    sprintf(ageString, "%d", self->age);

    size_t length = (strlen(FirstNameFromPerson(self)) + strlen(Separator) + strlen(LastNameFromPerson(self)) + strlen(Separator) + strlen(AgeLabel) + strlen(ageString));
    
    return length;
}
                     
char *CreateDescriptionOfPerson(Person *self)
{
    size_t length = DescriptionLength(self);
    char *description = malloc(length + 1);
    
    sprintf(description, "%s%s%s%s%s%d",
        LastNameFromPerson(self), Separator,
        FirstNameFromPerson(self), Separator, AgeLabel,
        self->age);
    
    return description;
    }

