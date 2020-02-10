//
//  Person.h
//  ANSI C Basics
//
//  Created by Peter Victoratos on 1/30/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

struct Person {
    char *firstName;
    char *lastName;
    int age;
};
typedef struct Person Person;

Person *AllocPerson(void);
Person *InitPerson(Person *self, const char *firstName, const char *lastName, int age);
char *CreateDescriptionOfPerson(Person *self);
