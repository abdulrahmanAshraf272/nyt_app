import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'BASE_URL_KEY', obfuscate: true)
  static String baseUrlKey = _Env.baseUrlKey;
}
