#include <iostream>
#include "../include/Application.hpp"

int main(int argc, char* argv[]) {
  std::cout << "Hello World" << std::endl;

  Application::Application App;

  App.Init(argc, argv);
  App.Run();

  return 0;
}
