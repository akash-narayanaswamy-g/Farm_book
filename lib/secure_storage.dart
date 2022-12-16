import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class token {
  final storage = new FlutterSecureStorage();

  gettoken() async {
    String? value = await storage.read(
      key: "x-auth-token",
    );
    return value;
  }
}
