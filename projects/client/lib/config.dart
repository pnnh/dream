class AppConfig {
  String loadArticlesUrl = "/api/query";
  String saveArticleUrl = "/api/add";
  String hostUrl;

  AppConfig({required this.hostUrl}) {
    loadArticlesUrl = hostUrl + loadArticlesUrl;
    saveArticleUrl = hostUrl + saveArticleUrl;
  }
}

var productConfig = AppConfig(hostUrl: "");
var debugConfig = AppConfig(
  hostUrl: "http://localhost:8080",
);

AppConfig loadConfig() {
  const bool inProduction = bool.fromEnvironment("dart.vm.product");
  if (!inProduction) {
    return debugConfig;
  }
  return productConfig;
}
