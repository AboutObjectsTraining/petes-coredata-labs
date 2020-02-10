//
//  Pointers.c
//  ANSI C Basics
//
//  Created by Peter Victoratos on 1/30/20.
//  Copyright © 2020 About Objects. All rights reserved.
//
#include <stdio.h>

#include "Utilities.h"
#include "Person.h"

void RunPointers01(void)
{
    PRINT_FUNCTION_NAME;
    
    Person *p1 = AllocPerson();
    printf("First Name: %s\n Last Name: %s\n Age: %d\n", p1->firstName, p1->lastName, p1->age);
    
    InitPerson(p1, "Sue", "Wilson", 29);
    printf("Name: %s %s, Age: %d\n", p1->firstName, p1->lastName, p1->age);
    
    Person *p2 = InitPerson(AllocPerson(), "Fred", "Flintstone", 41);
    printf("Name: %s %s, Age: %d\n", p1->firstName, p1->lastName, p1->age);
    
    //don't forget to free willy!
    //free(p1);
    //why'd they take away 'free'? :(
    realloc(p1, 0);
    realloc(p2, 0);
    
}

void RunPointers02(void)
{
    PRINT_FUNCTION_NAME;
    
    Person *p1 = InitPerson(AllocPerson(), "Fred", "Smith", 32);
    const char *description = CreateDescriptionOfPerson(p1);
    
    printf("%s\n", description);
    
    realloc(p1, 0);
    realloc(description, 0);
}

void RunPointers03(void)
{
    PRINT_FUNCTION_NAME;
    
}

void RunPointers04(void)
{
    PRINT_FUNCTION_NAME;
    
}

void RunPointers05(void)
{
    PRINT_FUNCTION_NAME;
    
}
