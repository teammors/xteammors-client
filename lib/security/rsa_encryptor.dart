import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/export.dart';

class RSAEncryptor {
  static String encryptWithPublicKey(String plainText, String publicKeyPem) {
    final publicKey = RSAKeyParser().parse(publicKeyPem) as RSAPublicKey;
    final encrypter = Encrypter(RSA(publicKey: publicKey));
    return encrypter.encrypt(plainText).base64;
  }

  static String decryptWithPrivateKey(String encryptedBase64, String privateKeyPem) {
    final privateKey = RSAKeyParser().parse(privateKeyPem) as RSAPrivateKey;
    final encrypter = Encrypter(RSA(privateKey: privateKey));
    return encrypter.decrypt(Encrypted.fromBase64(encryptedBase64));
  }
}
