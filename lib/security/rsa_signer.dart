import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' hide Signer;
import 'package:pointycastle/export.dart';

class RSASigner {
  static String sign(String plainText, String privateKeyPem) {
    final privateKey = RSAKeyParser().parse(privateKeyPem) as RSAPrivateKey;
    final signer = Signer('SHA-256/RSA');
    signer.init(true, PrivateKeyParameter<RSAPrivateKey>(privateKey));
    final signature = signer.generateSignature(Uint8List.fromList(utf8.encode(plainText)));
    return base64.encode((signature as RSASignature).bytes);
  }

  static bool verify(String plainText, String signatureBase64, String publicKeyPem) {
    final publicKey = RSAKeyParser().parse(publicKeyPem) as RSAPublicKey;
    final verifier = Signer('SHA-256/RSA');
    verifier.init(false, PublicKeyParameter<RSAPublicKey>(publicKey));
    final sigBytes = base64.decode(signatureBase64);
    return verifier.verifySignature(
      Uint8List.fromList(utf8.encode(plainText)),
      RSASignature(sigBytes),
    );
  }
}
