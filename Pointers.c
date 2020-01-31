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
    
    Person *person1 = AllocPerson();
    printf("First Name: %s\n Last Name: %s\n Age: %d\n", person1->firstName, person1->lastName, person1->age);
    
}

void RunPointers02(void)
{
    PRINT_FUNCTION_NAME;
    
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
