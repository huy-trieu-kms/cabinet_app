import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/providers/auth_providers.dart';

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this.ref) {
    // Rebuild router on auth changes
    ref.listen(authControllerProvider, (_, __) => notifyListeners());
  }
  final Ref ref;
}
