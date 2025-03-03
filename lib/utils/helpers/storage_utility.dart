import 'package:get_storage/get_storage.dart';

class StorageUtility {
  static final StorageUtility _instance = StorageUtility._internal();

  factory StorageUtility() {
    return _instance;
  }

  StorageUtility._internal();

  final _storage = GetStorage();

  Future<void> saveData(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  dynamic getData(String key) {
    return _storage.read(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearData() async {
    await _storage.erase();
  }
}
