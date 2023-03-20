import 'package:yuv_quiz/src/domain/user/mock/mock_user.dart';
import 'package:yuv_quiz/src/domain/user/model/user_model.dart';

abstract class AbstractUserRepository {
  Future<UserModel> getUser();
}

class UserRepository implements AbstractUserRepository {
  @override
  Future<UserModel> getUser() async {
    final response = UserModel.fromJson(mockUser);
    return response;
  }
}
