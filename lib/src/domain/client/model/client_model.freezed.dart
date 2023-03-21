// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientModel _$ClientModelFromJson(Map<String, dynamic> json) {
  return _ClientModel.fromJson(json);
}

/// @nodoc
mixin _$ClientModel {
  @JsonKey(name: 'client_name')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientModelCopyWith<ClientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientModelCopyWith<$Res> {
  factory $ClientModelCopyWith(
          ClientModel value, $Res Function(ClientModel) then) =
      _$ClientModelCopyWithImpl<$Res, ClientModel>;
  @useResult
  $Res call({@JsonKey(name: 'client_name') String name});
}

/// @nodoc
class _$ClientModelCopyWithImpl<$Res, $Val extends ClientModel>
    implements $ClientModelCopyWith<$Res> {
  _$ClientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClientModelCopyWith<$Res>
    implements $ClientModelCopyWith<$Res> {
  factory _$$_ClientModelCopyWith(
          _$_ClientModel value, $Res Function(_$_ClientModel) then) =
      __$$_ClientModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'client_name') String name});
}

/// @nodoc
class __$$_ClientModelCopyWithImpl<$Res>
    extends _$ClientModelCopyWithImpl<$Res, _$_ClientModel>
    implements _$$_ClientModelCopyWith<$Res> {
  __$$_ClientModelCopyWithImpl(
      _$_ClientModel _value, $Res Function(_$_ClientModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_ClientModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientModel extends _ClientModel {
  const _$_ClientModel({@JsonKey(name: 'client_name') required this.name})
      : super._();

  factory _$_ClientModel.fromJson(Map<String, dynamic> json) =>
      _$$_ClientModelFromJson(json);

  @override
  @JsonKey(name: 'client_name')
  final String name;

  @override
  String toString() {
    return 'ClientModel(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientModel &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClientModelCopyWith<_$_ClientModel> get copyWith =>
      __$$_ClientModelCopyWithImpl<_$_ClientModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientModelToJson(
      this,
    );
  }
}

abstract class _ClientModel extends ClientModel {
  const factory _ClientModel(
          {@JsonKey(name: 'client_name') required final String name}) =
      _$_ClientModel;
  const _ClientModel._() : super._();

  factory _ClientModel.fromJson(Map<String, dynamic> json) =
      _$_ClientModel.fromJson;

  @override
  @JsonKey(name: 'client_name')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_ClientModelCopyWith<_$_ClientModel> get copyWith =>
      throw _privateConstructorUsedError;
}
