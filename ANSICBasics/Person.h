//
//  Person.h
//  ANSI C Basics
//
//  Created by Peter Victoratos on 1/30/20.
//  Copyright © 2020 About Objects. All rights reserved.
//

#ifndef Person_h
#define Person_h

typedef struct Person Person;

struct Person {
    char *firstName;
    char *lastName;
    int age;
};

Person *AllocPerson(void);
Person *InitPerson(Person *self, const char *firstName, const char *lastName, int age);
#endif /* Person_h */
