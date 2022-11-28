part of nuts;

//errors for 'objectbox.g.dart' , 'Store define' and 'openStore' will be solved in customer application project

import 'objectbox.g.dart'; //runner generated objectBox CODES

class StoreObjectBox {
  static late Store _store;
  static final StoreObjectBox _instance = StoreObjectBox._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory StoreObjectBox() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  StoreObjectBox._internal() {
    // initialization singleton
  }

  //first run open(), before operate store
  Future<void> open() async {
    _store = await openStore();
  }

  static Store get() => _store;
}
