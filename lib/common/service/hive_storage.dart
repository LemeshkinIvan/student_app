import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  late final Box<dynamic> _storage;
  //HiveReflection hiveReflection = const HiveReflection();

  Future<HiveStorage> init() async {
    await Hive.initFlutter();
    _storage = await Hive.openBox('arm_storage');
    //_registrationAdapter();
    return this;
  }

  // List<dynamic> hiveAdapters = [
  //   DepartmentAdapter(),
  //   UserAdapter(),
  //   WorkCenterAdapter(),
  // ];
  //
  // void _registrationAdapter(){
  //   for (int i = 0; i < hiveAdapters.length; i++){
  //     Hive.registerAdapter(hiveAdapters[i]);
  //   }
  // }

  void deleteStorage() async {
    await _storage.deleteFromDisk();
  }

  void setValue(String key, dynamic value) async {
    await _storage.put(key, value);
  }

  bool? getBoolByKey(String key){
    return _storage.get(key) as bool?;
  }

  String? getStringByKey(String key){
    return _storage.get(key) as String?;
  }

  dynamic getObjectByKey(String key){
    return _storage.get(key);
  }

//TODO написать метод сохранения файлов storage в папке с приложением
}
