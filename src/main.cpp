#include "divisible.h"

int main(int argc, const char *argv[]) {
    int denominator = 2;
    int number;

    // ensure the correct number of parameters are used.
    if (argc == 1) {
        std::cout << "Usage: divis number [ denominator ]\n";
        std::cout << "Computes module of number to denominator.\n";
        return 1;
    }

    if (argc > 1)
        number = atoi(argv[1]);

    if (argc > 2)
        denominator = atoi(argv[2]);

    Divisible divisible = Divisible(denominator);

    std::cout << "Number " << number << " modulo " << denominator << " is = " << divisible.modulo(number) << "\n";

    return 0;
}
