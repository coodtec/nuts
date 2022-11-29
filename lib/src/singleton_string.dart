part of nuts;

class StringSingleton {
  static String _str = '';
  static final StringSingleton _instance = StringSingleton._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory StringSingleton() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  StringSingleton._internal() {
    // initialization singleton
  }

  static init(String initString) {
    _str = _str.isEmpty? initString:_str;
  }

  static String get() => _str;
}
