//
// Created by Konstantin Gredeskoul on 5/14/17.
//

#include "division.h"

DivisionResult Division::divide() {
  if (fraction.denominator == 0) throw DivisionByZero();

  result = DivisionResult{fraction.numerator / fraction.denominator,
                          fraction.numerator -
                          fraction.numerator / fraction.denominator *
                          fraction.denominator};
  return result;
}
