#include <division.h>

int main(int argc, const char *argv[]) {
  Fraction f;

  std::cout << "\nDivider © 2018 Monkey Claps Inc.\n\n";

  // ensure the correct number of parameters are used.
  if (argc < 3) {
    std::cout << "Usage:\n\tdivider <numerator> <denominator>\n";
    std::cout << "\nDescription:\n\tComputes the result of a fractional division,\n\tand reports both the result and the remainder.\n";
    return 1;
  }

  f.numerator = atoll(argv[1]);
  f.denominator = atoll(argv[2]);

  Division d = Division(f);
  DivisionResult r = d.divide();

  std::cout << "Division : " << f.numerator << " / " << f.denominator << " = " << r.division << "\n";
  std::cout << "Remainder: " << f.numerator << " % " << f.denominator << " = " << r.remainder << "\n";

  return 0;
}
