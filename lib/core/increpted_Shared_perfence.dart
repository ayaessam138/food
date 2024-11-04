import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelperEncrypted {
  static late FlutterSecureStorage flutterSecureStorage;

  static init() async {
    flutterSecureStorage = const FlutterSecureStorage();
  }

  static dynamic getData({
    required String key,
  }) {
    return flutterSecureStorage.read(key: key);
  }

  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    return await flutterSecureStorage.write(key: key, value: value);
  }

  static Future<void> removeData({
    required String key,
  }) async {
    return await flutterSecureStorage.delete(
      key: key,
    );
  }
}

class SharedPreferenceValueEncrypted {
  static void saveUid(String uid) {
    CacheHelperEncrypted.saveData(key: "uid", value: uid);
  }

  static Future<String> getUid() async {
    final uid = await CacheHelperEncrypted.getData(key: "uid");
    return uid ?? ''; // Return empty string if uid is null
  }

  static Future<void> removeUid() async {
    await CacheHelperEncrypted.removeData(key: "uid");
    print('removeUid==============================');
  }
}
