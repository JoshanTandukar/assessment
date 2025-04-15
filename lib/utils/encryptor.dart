import 'package:assessment/global/global_var.dart';
import 'package:encrypt/encrypt.dart';
import 'package:uuid/uuid.dart';

final _key = Key.fromUtf8(encryptionKey); // 32 chars
final _iv = IV.fromUtf8(
  ivKey,
); // You can use IV.fromUtf8('16-char-string') for fixed IV

final _encrypter = Encrypter(
  AES(
    _key,
    mode: AESMode.cbc,
  ),
);

String aesEncrypt(String s) {
  final encrypted = _encrypter.encrypt(s, iv: _iv);
  return encrypted.base64;
}

String aesDecrypt(String s) {
  final decrypted = _encrypter.decrypt64(s, iv: _iv);
  return decrypted;
}

String getUuid() {
  var uuid = Uuid();
  String result = uuid.v1();
  return result;
}

int uuidToInt(String uuidStr) {
  String hex = uuidStr.replaceAll('-', '').substring(0, 8);
  int parsed = int.parse(hex, radix: 16);
  return parsed & 0x7FFFFFFF; // clamp to 31-bit signed
}
