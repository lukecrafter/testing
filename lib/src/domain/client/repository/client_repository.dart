import 'package:yuv_quiz/src/domain/client/mock/mock_client.dart';
import 'package:yuv_quiz/src/domain/client/model/client_model.dart';

abstract class AbstractUserRepository {
  Future<ClientModel> getClient();
}

class ClientRepository implements AbstractUserRepository {
  @override
  Future<ClientModel> getClient() async {
    final response = ClientModel.fromJson(mockClient);
    return response;
  }
}
