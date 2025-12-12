import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:pointycastle/asn1.dart';
import 'package:pointycastle/export.dart';

class RSAKeyPair {
  late AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> keyPair;

  Future<void> generateKeyPair() async {
    final secureRandom = FortunaRandom();
    final random = Random.secure();
    final seed = Uint8List.fromList(List.generate(32, (_) => random.nextInt(256)));
    secureRandom.seed(KeyParameter(seed));

    final keyParams = RSAKeyGeneratorParameters(BigInt.from(65537), 2048, 12);

    final generator = RSAKeyGenerator();
    generator.init(ParametersWithRandom(keyParams, secureRandom));

    final pair = generator.generateKeyPair();
    keyPair = AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey>(
      pair.publicKey as RSAPublicKey,
      pair.privateKey as RSAPrivateKey,
    );
  }

  String get publicKeyPem {
    return CryptoUtils.encodeRSAPublicKeyToPem(keyPair.publicKey);
  }

  String get privateKeyPem {
    return _encodePrivateKeyToPem(keyPair.privateKey);
  }

  String _encodePublicKeyToPem(RSAPublicKey publicKey) {
    final algorithmIdentifier = ASN1Sequence();
    algorithmIdentifier.add(ASN1ObjectIdentifier(Uint8List.fromList([0x2A, 0x86, 0x48, 0x86, 0xF7, 0x0D, 0x01, 0x01, 0x01])));
    algorithmIdentifier.add(ASN1Null());

    final publicKeySequence = ASN1Sequence();
    publicKeySequence.add(ASN1Integer(publicKey.modulus!));
    publicKeySequence.add(ASN1Integer(publicKey.exponent!));
    publicKeySequence.encode();
    final publicKeyBitString = ASN1BitString(stringValues: publicKeySequence.encodedBytes);

    final topLevelSequence = ASN1Sequence();
    topLevelSequence.add(algorithmIdentifier);
    topLevelSequence.add(publicKeyBitString);
    topLevelSequence.encode();
    final dataBase64 = base64.encode(topLevelSequence.encodedBytes!);
    return """-----BEGIN PUBLIC KEY-----
$dataBase64
-----END PUBLIC KEY-----""";
  }

  String _encodePrivateKeyToPem(RSAPrivateKey privateKey) {
    // PKCS#8 format
    final version = ASN1Integer(BigInt.from(0));
    final algorithmIdentifier = ASN1Sequence();
    algorithmIdentifier.add(ASN1ObjectIdentifier(Uint8List.fromList([0x2A, 0x86, 0x48, 0x86, 0xF7, 0x0D, 0x01, 0x01, 0x01])));
    algorithmIdentifier.add(ASN1Null());

    // Private key in PKCS#1 format
    final privateKeySequence = ASN1Sequence();
    privateKeySequence.add(ASN1Integer(BigInt.from(0))); // version
    privateKeySequence.add(ASN1Integer(privateKey.n!));
    privateKeySequence.add(ASN1Integer(privateKey.exponent!));
    privateKeySequence.add(ASN1Integer(privateKey.d!));
    privateKeySequence.add(ASN1Integer(privateKey.p!));
    privateKeySequence.add(ASN1Integer(privateKey.q!));
    privateKeySequence.add(ASN1Integer(privateKey.d! % (privateKey.p! - BigInt.one))); // dP
    privateKeySequence.add(ASN1Integer(privateKey.d! % (privateKey.q! - BigInt.one))); // dQ
    privateKeySequence.add(ASN1Integer(privateKey.q!.modInverse(privateKey.p!))); // qInv
    privateKeySequence.encode();
    final privateKeyOctetString = ASN1OctetString(octets: privateKeySequence.encodedBytes);

    final topLevelSequence = ASN1Sequence();
    topLevelSequence.add(version);
    topLevelSequence.add(algorithmIdentifier);
    topLevelSequence.add(privateKeyOctetString);
    topLevelSequence.encode();
    final dataBase64 = base64.encode(topLevelSequence.encodedBytes!);
    return """-----BEGIN PRIVATE KEY-----
$dataBase64
-----END PRIVATE KEY-----""";
  }
}
