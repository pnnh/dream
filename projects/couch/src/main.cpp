#include <iostream>
#include "src/markdown/mdtransform.hpp"

#if EMSCRIPTEN

// 在WebAssembly环境下不执行测试代码
int main(int argc, char *argv[]) {
  std::cout << "======" << std::endl;

}

#else

int main(int argc, char *argv[]) {
  std::string table = markdown2json("ssss");

  std::cout << "======\n" << table;
}

#endif //EMSCRIPTEN
