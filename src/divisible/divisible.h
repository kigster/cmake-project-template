//
// Created by Konstantin Gredeskoul on 5/14/17.
//

#ifndef CMAKE_TUTORIAL_DIVISIBLE_H
#define CMAKE_TUTORIAL_DIVISIBLE_H

#include <iostream>
#include <exception>

using namespace std;

class Divisible {
public:
    Divisible(const int denominator) { this->denominator_ = denominator; }
    ~Divisible() {};
    int modulo(const int number);
protected:
    int denominator_;
};

class DivisionByZero : public exception {
    virtual const char *what() const throw() {
        return "Can not divide by zero!";
    }
};

#endif //CMAKE_TUTORIAL_DIVISIBLE_H
