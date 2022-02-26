//
// Created by ubuntu on 2/16/22.
//

#include "lib.h"
#include <iostream>
#include "src/utils/mime.h"
//#include "src/services/database/postgresql/pq.h"
//#include "src/utils/datetime.h"
//#include <boost/property_tree/ptree.hpp>
//#include <boost/property_tree/xml_parser.hpp>
//
//std::string HandleSitemap() {
//    boost::property_tree::ptree pt;
//
//    pt.put("urlset.<xmlattr>.xmlns", "http://www.sitemaps.org/schemas/sitemap/0.9");
//    boost::property_tree::ptree homeNode;
//    homeNode.put("url.loc", "https://sfx.xyz/");
//    pt.add_child("urlset.url", homeNode.get_child("url"));
//
//    auto articlesList = selectArticles();
//    for (const auto &article: articlesList) {
//        std::cout << "article is " << article.pk << "|" << article.title << std::endl;
//        boost::property_tree::ptree urlNode;
//        urlNode.put("url.loc", "https://sfx.xyz/article/read/" + article.pk);
//        urlNode.put("url.lastmod", formatTime(article.update_time));
//        pt.add_child("urlset.url", urlNode.get_child("url"));
//    }
//    std::ostringstream oss;
//    boost::property_tree::write_xml(oss, pt);
//    std::cout << "xml is " << oss.str() << std::endl;
//    return oss.str();
//}


int list_file(int input) {
    printf("input2: %d\n", input);
    std::string hh = "hhh";
    std::cout << "hh: " << hh << std::endl;

    return input * 2;
}