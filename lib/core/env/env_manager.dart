import 'package:envied/envied.dart';

part 'env_manager.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'BASE_URL')
  static const String base_url = _Env.base_url;
  // @EnviedField()
  // static const KEY2 = _Env.KEY2;
  // @EnviedField(defaultValue: 'test_')
  // static const key3 = _Env.key3;
}
