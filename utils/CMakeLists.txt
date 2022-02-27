cmake_minimum_required(VERSION 3.11)
project(Utilities C++ VERSION 0.3.2)
add_definitions(-std=c++14 -mtune=native -O3 -Wall -stdlib=libstdc++)
add_executable(lz-string lz-string.cpp)