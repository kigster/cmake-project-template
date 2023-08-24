[![CMake on multiple platforms](https://github.com/kigster/cmake-project-template/actions/workflows/cmake-multi-platform.yml/badge.svg)](https://github.com/kigster/cmake-project-template/actions/workflows/cmake-multi-platform.yml)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fkigster%2Fcmake-project-template.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fkigster%2Fcmake-project-template?ref=badge_shield)

# CMake C++ Project Template with Google-Test Unit Testing Library

> WTF is this? 
>
> I was just starting with C++ and CMake and I was having a hard time building a workable template that had all the pieces I wanted. This project represents a culmination of work to distill down to bare minimum any C/C++ project that wants to have the option to be build via CMake, to install itself as executables, libraries (shared/static), and provides test binaries that can be used to execute unit tests.
>
> GoogleTest library is a git module, and is a pull by the "setup-and-run" script `./build-and-run`

### Division with a remainder library

Thank you for your interest in this project!

Are you just starting with `CMake` or C++?

Do you need some easy-to-use starting point, but one that has the basic moving parts you are likely going to need on any medium sized project?

Do you believe in test-driven development, or at the very least — write your tests *together* with the feature code? If so you'd want to start your project pre-integrated with a good testing framework.

Divider is a minimal project that's kept deliberately very small. When you build it using CMake/make (see below) it generates:

 1. A tiny **static library** `lib/libdivision.a`,
 2. **A command line binary `bin/divider`**, which links with the library,
 3. **An executable unit test** `bin/divider_tests`  using [Google Test library](https://github.com/google/googletest).
 4. **An optional BASH build script** `build-and-run` that you can use to quickly test if the project compiles, and runs.

## Usage

### Prerequisites

You will need:

 * A modern C/C++ compiler
 * CMake 3.1+ installed (on a Mac, run `brew install cmake`)
 * If you prefer to code in a great IDE, I highly recommend [Jetbrains CLion](https://www.jetbrains.com/clion/). It is fully compatible with this project.

### Building The Project

#### Git Clone

First we need to check out the git repo:

```bash
❯ mkdir ~/workspace
❯ cd ~/workspace
❯ git clone \
    https://github.com/kigster/cmake-project-template \
    my-project
❯ cd my-project
❯ bash build-and-run
```

The output of this script is rather long and is shown [on this screenshot](doc/build-and-run.png).

The script `build-and-run` is a short-cut — you shouldn't really be using this script to build your project, but see how to do it properly below.

#### Project Structure

There are three empty folders: `lib`, `bin`, and `include`. Those are populated by `make install`.

The rest should be obvious: `src` is the sources, and `test` is where we put our unit tests.

Now we can build this project, and below we show three separate ways to do so.

#### Building Manually

```bash
❯ rm -rf build && mkdir build
❯ git submodule init && git submodule update
❯ cd build
❯ cmake ..
❯ make && make install
❯ cd ..
```


#### Running the tests

```bash
❯ bin/divider_tests
[==========] Running 5 tests from 1 test case.
[----------] Global test environment set-up.
[----------] 5 tests from DividerTest
[ RUN      ] DividerTest.5_DivideBy_2
[       OK ] DividerTest.5_DivideBy_2 (1 ms)
[ RUN      ] DividerTest.9_DivideBy_3
[       OK ] DividerTest.9_DivideBy_3 (0 ms)
[ RUN      ] DividerTest.17_DivideBy_19
[       OK ] DividerTest.17_DivideBy_19 (0 ms)
[ RUN      ] DividerTest.Long_DivideBy_Long
[       OK ] DividerTest.Long_DivideBy_Long (0 ms)
[ RUN      ] DividerTest.DivisionByZero
[       OK ] DividerTest.DivisionByZero (0 ms)
[----------] 5 tests from DividerTest (1 ms total)

[----------] Global test environment tear-down
[==========] 5 tests from 1 test case ran. (1 ms total)
[  PASSED  ] 5 tests.
```

#### Running the CLI Executable

Without arguments, it prints out its usage:

```bash
❯ bin/divider

Divider © 2018 Monkey Claps Inc.

Usage:
	divider <numerator> <denominator>

Description:
	Computes the result of a fractional division,
	and reports both the result and the remainder.
```

But with arguments, it computes as expected the denominator:

```bash
❯ bin/divider 112443477 12309324

Divider © 2018 Monkey Claps Inc.

Division : 112443477 / 12309324 = 9
Remainder: 112443477 % 12309324 = 1659561
```

### Building in CLion

> **NOTE**: Since JetBrains software [does not officially support git submodules](https://youtrack.jetbrains.com/issue/IDEA-64024), you must run `git submodule init && git submodule update` before starting CLion on a freshly checked-out repo.

> **NOTE**: We recommend that you copy file `.idea/workspace.xml.example` into `.idea/workspace.xml` **before starting CLion**. It will provide a good starting point for your project's workspace.

Assuming you've done the above two steps, you can start CLion, and open the project's top level folder. CLion should automatically detect the top level `CMakeLists.txt` file and provide you with the full set of build targets.

Select menu option **Build   ➜ Build Project**, and then **Build ➜ Install**.

![CLION](doc/cmake-clion.png)

The above screenshot is an example of CLion with this project open.

### Using it as a C++ Library

We build a static library that, given a simple fraction will return the integer result of the division, and the remainder.

We can use it from C++ like so:

```cpp
#include <iostream>
#include <division>

Fraction       f = Fraction{25, 7};
DivisionResult r = Division(f).divide();

std::cout << "Result of the division is " << r.division;
std::cout << "Remainder of the division is " << r.remainder;
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

&copy; 2017-2019 Konstantin Gredeskoul.

Open sourced under MIT license, the terms of which can be read here — [MIT License](http://opensource.org/licenses/MIT).


[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fkigster%2Fcmake-project-template.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fkigster%2Fcmake-project-template?ref=badge_large)

### Acknowledgements

This project is a derivative of the [CMake Tutorial](https://cmake.org/cmake-tutorial/), and is aimed at saving time for starting new projects in C++ that use CMake and GoogleTest.
