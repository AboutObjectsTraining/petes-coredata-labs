//
//  Pointers.c
//  ANSI C Basics
//
//  Created by Peter Victoratos on 1/30/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#include <stdlib.h>
#include "Utilities.h"
#include "Person.h"
#include "Pointers.h"

void RunPointers01(void)
{
    PRINT_FUNCTION_NAME;

    Person *p1 = InitPerson(AllocPerson(), "Sue", "Wilson", 29);
    printf("Name: %s %s, Age: %d\n", p1-> firstName, p1->lastName, p1->age);
    
    Person *p2 = InitPerson(AllocPerson(), "Fred", "Flintstone", 41);
    printf("Name: %s %s, Age: %d\n", p2->firstName, p2->lastName, p2->age);
    
    free(p1);
    free(p2);
}

void RunPointers02(void)
{
    PRINT_FUNCTION_NAME;
    
    Person *p1 = InitPerson(AllocPerson(),
                            "Fred",
                            "Flintstone",
                            32);
    char *description = CreateDescriptionOfPerson(p1);
    
    printf("%s\n", description);
    printf("%p\n", &p1);
    
    free(p1);
    free(description);
    
    printf("%s\n", description);
    printf("%p\n", &p1);
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
