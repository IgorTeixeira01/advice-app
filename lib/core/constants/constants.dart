class Urls {
  static const String baseUrl = 'https://api.adviceslip.com/advice/';
  static String currentAdviceById(int slipId) =>
      '$baseUrl$slipId';
}