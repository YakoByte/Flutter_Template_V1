class ApiConfig {
  ApiConfig._();

  static const String scheme = "https://";
  static const String host = "newsapi.org";

  ///abc.com
  static const String basePath = "/v2/everything";
  static const String mainUrl = scheme + host + basePath;
  static const String getPopularity =
      "$mainUrl?q=apple&from=2023-09-19&to=2023-09-19&sortBy=popularity&apiKey=e86f4a0629b1407b86d3f2cae78f3316";
}
