import 'package:assessment/global/global_var.dart';
import 'package:encrypt/encrypt.dart';
import 'package:uuid/uuid.dart';

final _key = Key.fromUtf8(encryptionKey); // 32 chars
final _iv =
    IV.fromLength(16); // You can use IV.fromUtf8('16-char-string') for fixed IV
final _encrypter = Encrypter(AES(_key));

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
  print("------------------------- $result ------------------------");
  return result;
}
