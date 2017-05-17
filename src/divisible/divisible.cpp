//
// Created by Konstantin Gredeskoul on 5/14/17.
//

#include "divisible.h"

int Divisible::modulo(const int number)
{
    if (denominator_== 0) throw new DivisionByZero();
    return (number % denominator_);
}
