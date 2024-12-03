import 'package:flutter/cupertino.dart';
import 'package:frontend/common/service/hive_storage.dart';
import 'package:frontend/common/service/storage_service.dart';


class Global {
  static late SecureStorageService secureStorageService;
  static late HiveStorage hiveStorage;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    secureStorageService = SecureStorageService().init();
    hiveStorage = await HiveStorage().init();
  }
}