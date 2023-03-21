import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/domain/client/mock/mock_record.dart';
import 'package:yuv_quiz/src/domain/client/model/client_model.dart';
import 'package:yuv_quiz/src/domain/client/repository/client_repository.dart';

final clientRepositoryProvider = Provider<ClientRepository>((ref) {
  return ClientRepository();
});

final clientProvider = FutureProvider<ClientModel>((ref) async {
  final repository = ref.watch(clientRepositoryProvider);
  final client = await repository.getClient();
  return client;
});

final clientRecordProvider = Provider((ref) {
  return mockRecord;
});
