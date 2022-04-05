#include <iostream>
#include "src/markdown/mdtransform.hpp"

int main(int argc, char *argv[]) {
  std::string table = markdown2json("ssss");

  std::cout << "======\n" << table;

  return 0;
}




