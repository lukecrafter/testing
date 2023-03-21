import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_model.freezed.dart';
part 'client_model.g.dart';

@freezed
class ClientModel with _$ClientModel {
  const ClientModel._();

  const factory ClientModel({
    @JsonKey(name: 'client_name') required String name,
  }) = _ClientModel;

  factory ClientModel.fromJson(Map<String, Object?> json) =>
      _$ClientModelFromJson(json);
}
