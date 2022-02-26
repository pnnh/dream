#include <boost/beast/http.hpp>
#include <boost/asio.hpp>
#include <cstdlib>
#include <iostream>
#include <memory>
#include <stdio.h>
#include "src/services/config/aws/init.h"
#include "src/services/config/aws/appconfig.h"
#include "src/lib.h"


int main(int argc, char *argv[]) {
    std::cout << "Hello, World!" << std::endl;
    initAws();
    std::string region = "ap-east-1";
    initConfig();

    auto sitemap = HandleSitemap();

    std::cout << "sitemap: \n" << sitemap << std::endl;
}