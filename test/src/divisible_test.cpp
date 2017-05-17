//
// Created by Konstantin Gredeskoul on 5/16/17.
//
#include "divisible/divisible.h"
#include "gtest/gtest.h"
using namespace std;

#define VI vector<int>

class DivisibleTest : public ::testing::Test {

protected:
    VI inputNumbers = {2, 45};
    VI results;

//    virtual void SetUp() { };
//    virtual void TearDown() {};

    virtual void populate(int denominator) {
        for (auto i = 0; i < inputNumbers.size(); i++) {
            auto item = inputNumbers.at(i);
            auto d = Divisible(denominator);
            results.push_back(d.modulo(item));
        }
    }
};


// Tests factorial of 0.
TEST_F(DivisibleTest, ComputeWithDenominator13) {
    populate(13);
    int result, item;
    for (auto i = 0; i < inputNumbers.size(); i++) {
        item = inputNumbers[i];
        result = results[i];
        EXPECT_EQ(result, item % 13);
    }
}

// Tests factorial of 0.
TEST_F(DivisibleTest, ComputeWithDenominator0) {
    Divisible divisible = Divisible(0);
    divisible.modulo(123);
}

