import 'package:encryptor/encryptor.dart';
import 'package:assessment/global/global_var.dart';

String encrypt(String s) {
  return Encryptor.encrypt(encryptionKey, s);
}

String decrypt(String s) {
  return Encryptor.decrypt(encryptionKey, s);
}
