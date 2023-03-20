import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/domain/user/model/user_model.dart';
import 'package:yuv_quiz/src/domain/user/repository/user_repository.dart';

final userRepository = Provider<UserRepository>((ref) {
  return UserRepository();
});

final userProvider = FutureProvider<UserModel>((ref) async {
  final repository = ref.watch(userRepository);
  final user = await repository.getUser();
  return user;
});
