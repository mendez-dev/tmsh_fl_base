// Funcion para encritar la contraseña usando hash_pbkdf2
import 'package:conduit_password_hash/conduit_password_hash.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:crypto/crypto.dart';

Future<String> encryptPassword(String password) async {
  final String salt = GlobalConfiguration().getValue<String>('salt');
  final int iterations = GlobalConfiguration().getValue<int>('iterations');
  final generator = PBKDF2(hashAlgorithm: sha512);
  var hash = generator.generateKey(password, salt, iterations, 64);
  return bin2hex(hash);
}

String bin2hex(List<int> bin) {
  var buffer = "";
  for (var b in bin) {
    buffer += (b + 0x100).toRadixString(16).substring(1);
  }
  return buffer;
}
