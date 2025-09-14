import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/storage_service.dart';
import '../data/auth_repository.dart';

class AuthState {
  const AuthState({this.token});
  final String? token;
  bool get isAuthenticated => token != null && token!.isNotEmpty;
}

final storageServiceProvider = Provider<StorageService>(
  (_) => StorageService(),
);
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(ref),
);

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    final controller = AuthController(ref);
    controller.restore();
    return controller;
  },
);

class AuthController extends StateNotifier<AuthState> {
  AuthController(this.ref) : super(const AuthState());
  final Ref ref;

  Future<void> restore() async {
    final storage = ref.read(storageServiceProvider);
    final token = await storage.readToken();
    if (token != null) state = AuthState(token: token);
  }

  Future<void> login(String email, String password) async {
    final repo = ref.read(authRepositoryProvider);
    final token = await repo.login(email, password);
    await ref.read(storageServiceProvider).saveToken(token);
    state = AuthState(token: token);
  }

  Future<void> logout() async {
    await ref.read(storageServiceProvider).clearToken();
    state = const AuthState(token: null);
  }
}
