import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/mock_data.dart';
import '../../home/data/profile_model.dart';

final profileProvider = FutureProvider<Profile>((ref) async {
  // final dio = ref.watch(dioProvider);
  // final res = await dio.get('/me');
  // return Profile.fromJson(res.data as Map<String, dynamic>);
  await Future.delayed(const Duration(seconds: 1));
  return Profile.fromJson(mockUser);
});
