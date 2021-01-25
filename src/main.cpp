#include <division.h>
#include <iostream>

using namespace std;

static const char *const HEADER = "\nDivider © 2018 Monkey Claps Inc.\n\n";
static const char *const USAGE = "Usage:\n\tdivider <numerator> <denominator>\n\nDescription:\n\tComputes the result of a fractional division,\n\tand reports both the result and the remainder.\n";

int main(int argc, const char *argv[]) {
  Fraction f;

  cout << HEADER;

  // ensure the correct number of parameters are used.
  if (argc < 3) {
    cout << USAGE;
    return 1;
  }

  f.numerator = atoll(argv[1]);
  f.denominator = atoll(argv[2]);

  Division d = Division(f);
  try {
    DivisionResult r = d.divide();

    cout << "Division : " << f.numerator << " / " << f.denominator << " = " << r.division << "\n";
    cout << "Remainder: " << f.numerator << " % " << f.denominator << " = " << r.remainder << "\n";
  } catch (DivisionByZero) {
    cout << "Can not divide by zero, Homer. Sober up!\n";
  }
  return 0;
}
