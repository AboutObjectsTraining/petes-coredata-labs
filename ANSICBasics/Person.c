//
//  Person.c
//  ANSI C Basics
//
//  Created by Peter Victoratos on 1/30/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#include <stdlib.h>
#include <string.h>
#include "Person.h"

const char *Separator = ", ";
const char *AgeLabel = "Age: ";
const char *NotAvailaable = "N/A";

// Allocates a space in memory for a Person struct, dynamically
Person *AllocPerson(void)
{
    return calloc(1, sizeof(Person));
}

//create a deallocate function that goes to the address of p1 and clears it?

Person *InitPerson(Person *self, char *firstName, char *lastName, int age)
{
    //initializes members of self with the provided argument values
    //uses -> to access the members of self, defined in the function
    self->firstName = CopyString(firstName);
    self->lastName = CopyString(lastName);
    self->age = age;

    return self;
}

//Availaable??? What a weird spelling..
const char *FirstNameFromPerson(Person *self)
{
    if (self->firstName == NULL) {
        return NotAvailaable;
    }
    return self->firstName;
}
const char *LastNameFromPerson(Person *self)
{
    if (self->lastName == NULL) {
        return NotAvailaable;
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

