import 'package:hive/hive.dart';

class HiveHelper {
  static Box<String>? tokenBox;

  static String? get token => tokenBox?.get('token');
  static Future<void> addToken(String token) async => await tokenBox?.put('token', token);
}