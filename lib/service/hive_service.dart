import 'package:hive/hive.dart';

class HiveServise {
  static late final Box _userSettingsBox;

  // static Future<void> init() async {
  //   _userSettingsBox = await Hive.openBox(HiveBoxKeys.userSettins);
  // }

  static Future<int> clear() async {
    return _userSettingsBox.clear();
  }

  // static Future<bool> saveUserInfo(
  //   String name,
  //   String token,
  //   int userId,
  // ) async {
  //   await _userSettingsBox.put(HiveKeys.userName, name);
  //   await _userSettingsBox.put(HiveKeys.userId, userId);
  //   await _userSettingsBox.put(HiveKeys.token, token);
  //   return true;
  // }

  // static String getUsername() {
  //   String name = _userSettingsBox.get(HiveKeys.userName) ?? '';
  //   return name;
  // }

  // static String? getToken() {
  //   String? token = _userSettingsBox.get(HiveKeys.token);
  //   return token;
  // }

  // static int? getUserId() {
  //   int? userId = _userSettingsBox.get(HiveKeys.userId);
  //   return userId;
  // }
}
