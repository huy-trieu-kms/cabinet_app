import 'core/env/env.dart';

Future<void> bootstrap() async {
  await Env.load();
}
