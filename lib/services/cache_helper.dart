
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<dynamic> setDataD(
      {required String isDo, required dynamic vDo}) async {
    if (vDo is String) return await sharedPreferences?.setString(isDo, vDo);
    if (vDo is int) return await sharedPreferences?.setInt(isDo, vDo);
    if (vDo is bool) return await sharedPreferences?.setBool(isDo, vDo);

    return await sharedPreferences?.setDouble(isDo, vDo);
  }

  static dynamic getDataD({
    required String isDo,
  }) {
    return sharedPreferences?.get(isDo);
  }

  static Future<dynamic> removeDataD({
    required String isDo,
  }) async {
    return await sharedPreferences?.remove(isDo);
  }
  static Future<dynamic> setData(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences?.setString(key, value);
    if (value is int) return await sharedPreferences?.setInt(key, value);
    if (value is bool) return await sharedPreferences?.setBool(key, value);

    return await sharedPreferences?.setDouble(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences?.get(key);
  }

  static Future<dynamic> removeData({
    required String key,
  }) async {
    return await sharedPreferences?.remove(key);
  }
  static Future<dynamic> setDataId(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences?.setString(key, value);
    if (value is int) return await sharedPreferences?.setInt(key, value);
    if (value is bool) return await sharedPreferences?.setBool(key, value);

    return await sharedPreferences?.setDouble(key, value);
  }

  static dynamic getDataId({
    required String key,
  }) {
    return sharedPreferences?.get(key);
  }

  static Future<dynamic> removeDataId({
    required String key,
  }) async {
    return await sharedPreferences?.remove(key);
  }
}


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await CacheHelper.init();
//   uId = CacheHelper.getData(key: 'uId');
//   if (kDebugMode) {
//     print(uId);
//   }
//   runApp(const MyApp());
// }

// CacheHelper.setData(
//         key: 'uId',
//         value: FirebaseAuth.instance.currentUser?.uid,
//       );


// هتغير دي بالـid الصح بتاع اليوزر     (FirebaseAuth.instance.currentUser?.uid )