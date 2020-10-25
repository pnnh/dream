class AppConfig {
  String loadArticlesUrl = "/api/query";
  String saveArticleUrl = "/api/add";
  String hostUrl;

  AppConfig({this.hostUrl}) {
    this.loadArticlesUrl = this.hostUrl + this.loadArticlesUrl;
    this.saveArticleUrl = this.hostUrl + this.saveArticleUrl;
  }
}

var productConfig = new AppConfig(hostUrl: "");
var debugConfig = new AppConfig(
  hostUrl: "http://localhost:8080",
);

AppConfig loadConfig() {
  const bool inProduction = const bool.fromEnvironment("dart.vm.product");
  if (!inProduction) {
    return debugConfig;
  }
  return productConfig;
}
