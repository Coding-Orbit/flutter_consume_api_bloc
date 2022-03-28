class QP{
  const QP._();

  ///Here you can have a map of query parameters
  ///for example https://example.com?key=value&key2=value2
  static Map<String, String> apiQP({required String value, required String value2}) => {
    'key': value,
    'key2': value2
  };
}