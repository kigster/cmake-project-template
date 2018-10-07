[![Build Status](https://travis-ci.org/kigster/cmake-project-template.svg?branch=master)](https://travis-ci.org/kigster/cmake-project-template)

# CMake C++ Project Template

### Division with a remainder library

Thank you for your interest in this project!

Are you just starting with `CMake` or C++? 

Do you need some easy-to-use starting point, but one that has the basic moving parts you are likely going to need on any medium sized project?

Do you believe in test-driven development, or at the very lest — write your tests *together* with the feature code? If so you'd want to start your project pre-integrated with a good testing framework.

Divider is a minimal project that's kept deliberately very small. When you build it using CMake/make (see below) it generates:

 1. A tiny **static library** `lib/libdivision.a`.
 2. **A command line binary `bin/divider`**, which links with the library, and computes modulo of its argument over 2, or the third argument.
 3. **An executable unit test** `bin/divider_tests`  using [Google Test library](https://github.com/google/googletest)
 
## Usage

### Prerequisites

You need:

 * C++ compiler
 * CMake 3.1+ installed (on a Mac, run `brew install cmake`)
 * If you prefer to code in a great IDE, I highly recommend [Jetbrains CLion](https://www.jetbrains.com/clion/). It is fully compatible with this project.

### Building Project

First we need to check out the git repo:

```bash
$ cd ${insert your workspace folder here}
$ git clone https://github.com/kigster/cmake-project-template 
$ cd cmake-project-template
``` 

Now we should be in the project's top level folder. First step is to remove (any possible existing) and re-create the 'build' folder

There is a handy BASH script (used by the Travis CI) that you can run locally. It builds the project, and runs all the tests

####  Building Using the Script

```bash
./run.sh
```

#### Building Manually

```bash
$ rm -rf build && mkdir build
$ cd build
$ cmake ..
$ make && make install
$ cd ..
$ bin/divider_tests
$ bin/divider 234 5431
```

### Building in CLion

Before starting CLion, I recommend removing any previous `build` folder with `rm -rf build`.

Next, start CLion, and open the project's top level folder. CLion should automatically detect the top level `CMakeLists.txt` file, and build everything.

Select menu option **Run ➜ Build**, and then **Run ➜ Install**.

Hopefully you get no errors, and the project builds.


## Functionality

For simplicity's sake  we'll build a simple command line tool that for every input number prints out if it's libdivision by two. Having said that, the denominator can also be supplied as an argument.

We'll call this library **division**, and that name will now be our project's name too.

Our goal is to have a working binary, such as :

```bash
$ bin/divider value [ denominator ]

# eg:
$ divider 234 5435

Division : 234 / 5435 = 0
Remainder: 234 % 5435 = 234
```

And C++ usage:

```C++
#include <iostream>
#include <division>

Fraction f = Fraction{25, 7};
std::cout << Division(f).divide();
```

## File Locations

 * `src/*` — C++ code that ultimately compiles into a library
 * `test/lib` — C++ libraries used for tests (eg, Google Test)
 * `test/src` — C++ test suite
 * `bin/`, `lib`, `include` are all empty directories, until the `make install` install the project artifacts there.

Tests: 

 * A `test` folder with the automated tests and fixtures that mimics the directory structure of `src`.
 * For every C++ file in `src/A/B/<name>.cpp` there is a corresponding test file `test/A/B/<name>_test.cpp`
 * Tests compile into a single binary `test/bin/runner` that is run on a command line to run the tests.
 * `test/lib` folder with a git submodule in `test/lib/googletest`, and possibly other libraries.

#### Contributing

**Pull Requests are WELCOME!** Please submit any fixes or improvements, and I promise to review it as soon as I can at the project URL: 

 * [Project Github Home](https://github.com/kigster/cmake-project-template)
 * [Submit Issues](https://github.com/kigster/cmake-project-template/issues)
 * [Pull Requests](https://github.com/kigster/cmake-project-template/pulls)

### License

&copy; 2017-2018 Konstantin Gredeskoul. 

Open sourced under MIT license, the terms of which can be read here — [MIT License](http://opensource.org/licenses/MIT).

### Acknowledgements

This project is a derivative of the [CMake Tutorial](https://cmake.org/cmake-tutorial/), and is aimed at saving time for starting new projects in C++ that use CMake and GoogleTest.

