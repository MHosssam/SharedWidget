import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
 *shared_preferences: ^2.0.5 
 */
class CacheHelperService extends GetxService {
  static CacheHelperService get to => Get.find();

  SharedPreferences? sharedPreferences;

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  dynamic getData({
    required String key,
  }) {
    return sharedPreferences!.get(key);
  }

  Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);

    return await sharedPreferences!.setDouble(key, value);
  }

  Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences!.remove(key);
  }
}
/**
 * Ex Get Data:
 * 
 * CacheHelperService.to.getData(key: 'key');
 * 
 * Ex put Data:
 * 
 * CacheHelperService.to.saveData(key: 'key' , value: 'value');
 * 
 * Ex Remove Data:
 * 
 * CacheHelperService.to.removeData(key: 'key');
 * 
 */
