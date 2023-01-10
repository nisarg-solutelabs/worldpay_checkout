// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SetupCardinalSessionResponseTearOff {
  const _$SetupCardinalSessionResponseTearOff();

  SetupCardinalSessionSuccess success({required String consumerSessionId}) {
    return SetupCardinalSessionSuccess(
      consumerSessionId: consumerSessionId,
    );
  }

  SetupCardinalSessionFailure failure({required CardinalResponse response}) {
    return SetupCardinalSessionFailure(
      response: response,
    );
  }
}

/// @nodoc
const $SetupCardinalSessionResponse = _$SetupCardinalSessionResponseTearOff();

/// @nodoc
mixin _$SetupCardinalSessionResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String consumerSessionId) success,
    required TResult Function(CardinalResponse response) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String consumerSessionId)? success,
    TResult Function(CardinalResponse response)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String consumerSessionId)? success,
    TResult Function(CardinalResponse response)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetupCardinalSessionSuccess value) success,
    required TResult Function(SetupCardinalSessionFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SetupCardinalSessionSuccess value)? success,
    TResult Function(SetupCardinalSessionFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetupCardinalSessionSuccess value)? success,
    TResult Function(SetupCardinalSessionFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetupCardinalSessionResponseCopyWith<$Res> {
  factory $SetupCardinalSessionResponseCopyWith(
          SetupCardinalSessionResponse value,
          $Res Function(SetupCardinalSessionResponse) then) =
      _$SetupCardinalSessionResponseCopyWithImpl<$Res>;
}

/// @nodoc
class _$SetupCardinalSessionResponseCopyWithImpl<$Res>
    implements $SetupCardinalSessionResponseCopyWith<$Res> {
  _$SetupCardinalSessionResponseCopyWithImpl(this._value, this._then);

  final SetupCardinalSessionResponse _value;
  // ignore: unused_field
  final $Res Function(SetupCardinalSessionResponse) _then;
}

/// @nodoc
abstract class $SetupCardinalSessionSuccessCopyWith<$Res> {
  factory $SetupCardinalSessionSuccessCopyWith(
          SetupCardinalSessionSuccess value,
          $Res Function(SetupCardinalSessionSuccess) then) =
      _$SetupCardinalSessionSuccessCopyWithImpl<$Res>;
  $Res call({String consumerSessionId});
}

/// @nodoc
class _$SetupCardinalSessionSuccessCopyWithImpl<$Res>
    extends _$SetupCardinalSessionResponseCopyWithImpl<$Res>
    implements $SetupCardinalSessionSuccessCopyWith<$Res> {
  _$SetupCardinalSessionSuccessCopyWithImpl(SetupCardinalSessionSuccess _value,
      $Res Function(SetupCardinalSessionSuccess) _then)
      : super(_value, (v) => _then(v as SetupCardinalSessionSuccess));

  @override
  SetupCardinalSessionSuccess get _value =>
      super._value as SetupCardinalSessionSuccess;

  @override
  $Res call({
    Object? consumerSessionId = freezed,
  }) {
    return _then(SetupCardinalSessionSuccess(
      consumerSessionId: consumerSessionId == freezed
          ? _value.consumerSessionId
          : consumerSessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetupCardinalSessionSuccess implements SetupCardinalSessionSuccess {
  _$SetupCardinalSessionSuccess({required this.consumerSessionId});

  @override
  final String consumerSessionId;

  @override
  String toString() {
    return 'SetupCardinalSessionResponse.success(consumerSessionId: $consumerSessionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetupCardinalSessionSuccess &&
            const DeepCollectionEquality()
                .equals(other.consumerSessionId, consumerSessionId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(consumerSessionId));

  @JsonKey(ignore: true)
  @override
  $SetupCardinalSessionSuccessCopyWith<SetupCardinalSessionSuccess>
      get copyWith => _$SetupCardinalSessionSuccessCopyWithImpl<
          SetupCardinalSessionSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String consumerSessionId) success,
    required TResult Function(CardinalResponse response) failure,
  }) {
    return success(consumerSessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String consumerSessionId)? success,
    TResult Function(CardinalResponse response)? failure,
  }) {
    return success?.call(consumerSessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String consumerSessionId)? success,
    TResult Function(CardinalResponse response)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(consumerSessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetupCardinalSessionSuccess value) success,
    required TResult Function(SetupCardinalSessionFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SetupCardinalSessionSuccess value)? success,
    TResult Function(SetupCardinalSessionFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetupCardinalSessionSuccess value)? success,
    TResult Function(SetupCardinalSessionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SetupCardinalSessionSuccess
    implements SetupCardinalSessionResponse {
  factory SetupCardinalSessionSuccess({required String consumerSessionId}) =
      _$SetupCardinalSessionSuccess;

  String get consumerSessionId;
  @JsonKey(ignore: true)
  $SetupCardinalSessionSuccessCopyWith<SetupCardinalSessionSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetupCardinalSessionFailureCopyWith<$Res> {
  factory $SetupCardinalSessionFailureCopyWith(
          SetupCardinalSessionFailure value,
          $Res Function(SetupCardinalSessionFailure) then) =
      _$SetupCardinalSessionFailureCopyWithImpl<$Res>;
  $Res call({CardinalResponse response});

  $CardinalResponseCopyWith<$Res> get response;
}

/// @nodoc
class _$SetupCardinalSessionFailureCopyWithImpl<$Res>
    extends _$SetupCardinalSessionResponseCopyWithImpl<$Res>
    implements $SetupCardinalSessionFailureCopyWith<$Res> {
  _$SetupCardinalSessionFailureCopyWithImpl(SetupCardinalSessionFailure _value,
      $Res Function(SetupCardinalSessionFailure) _then)
      : super(_value, (v) => _then(v as SetupCardinalSessionFailure));

  @override
  SetupCardinalSessionFailure get _value =>
      super._value as SetupCardinalSessionFailure;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(SetupCardinalSessionFailure(
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as CardinalResponse,
    ));
  }

  @override
  $CardinalResponseCopyWith<$Res> get response {
    return $CardinalResponseCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$SetupCardinalSessionFailure implements SetupCardinalSessionFailure {
  _$SetupCardinalSessionFailure({required this.response});

  @override
  final CardinalResponse response;

  @override
  String toString() {
    return 'SetupCardinalSessionResponse.failure(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetupCardinalSessionFailure &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  $SetupCardinalSessionFailureCopyWith<SetupCardinalSessionFailure>
      get copyWith => _$SetupCardinalSessionFailureCopyWithImpl<
          SetupCardinalSessionFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String consumerSessionId) success,
    required TResult Function(CardinalResponse response) failure,
  }) {
    return failure(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String consumerSessionId)? success,
    TResult Function(CardinalResponse response)? failure,
  }) {
    return failure?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String consumerSessionId)? success,
    TResult Function(CardinalResponse response)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetupCardinalSessionSuccess value) success,
    required TResult Function(SetupCardinalSessionFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SetupCardinalSessionSuccess value)? success,
    TResult Function(SetupCardinalSessionFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetupCardinalSessionSuccess value)? success,
    TResult Function(SetupCardinalSessionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class SetupCardinalSessionFailure
    implements SetupCardinalSessionResponse {
  factory SetupCardinalSessionFailure({required CardinalResponse response}) =
      _$SetupCardinalSessionFailure;

  CardinalResponse get response;
  @JsonKey(ignore: true)
  $SetupCardinalSessionFailureCopyWith<SetupCardinalSessionFailure>
      get copyWith => throw _privateConstructorUsedError;
}

CardinalResponse _$CardinalResponseFromJson(Map<String, dynamic> json) {
  return _CardinalResponse.fromJson(json);
}

/// @nodoc
class _$CardinalResponseTearOff {
  const _$CardinalResponseTearOff();

  _CardinalResponse call(
      {@JsonKey(unknownEnumValue: CardinalResponseActionCode.unknown)
          required CardinalResponseActionCode actionCode,
      required bool isValidated,
      required String serverJwt,
      int? errorNumber,
      String? errorDescription}) {
    return _CardinalResponse(
      actionCode: actionCode,
      isValidated: isValidated,
      serverJwt: serverJwt,
      errorNumber: errorNumber,
      errorDescription: errorDescription,
    );
  }

  CardinalResponse fromJson(Map<String, Object?> json) {
    return CardinalResponse.fromJson(json);
  }
}

/// @nodoc
const $CardinalResponse = _$CardinalResponseTearOff();

/// @nodoc
mixin _$CardinalResponse {
  @JsonKey(unknownEnumValue: CardinalResponseActionCode.unknown)
  CardinalResponseActionCode get actionCode =>
      throw _privateConstructorUsedError;
  bool get isValidated => throw _privateConstructorUsedError;
  String get serverJwt => throw _privateConstructorUsedError;
  int? get errorNumber => throw _privateConstructorUsedError;
  String? get errorDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardinalResponseCopyWith<CardinalResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardinalResponseCopyWith<$Res> {
  factory $CardinalResponseCopyWith(
          CardinalResponse value, $Res Function(CardinalResponse) then) =
      _$CardinalResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(unknownEnumValue: CardinalResponseActionCode.unknown)
          CardinalResponseActionCode actionCode,
      bool isValidated,
      String serverJwt,
      int? errorNumber,
      String? errorDescription});
}

/// @nodoc
class _$CardinalResponseCopyWithImpl<$Res>
    implements $CardinalResponseCopyWith<$Res> {
  _$CardinalResponseCopyWithImpl(this._value, this._then);

  final CardinalResponse _value;
  // ignore: unused_field
  final $Res Function(CardinalResponse) _then;

  @override
  $Res call({
    Object? actionCode = freezed,
    Object? isValidated = freezed,
    Object? serverJwt = freezed,
    Object? errorNumber = freezed,
    Object? errorDescription = freezed,
  }) {
    return _then(_value.copyWith(
      actionCode: actionCode == freezed
          ? _value.actionCode
          : actionCode // ignore: cast_nullable_to_non_nullable
              as CardinalResponseActionCode,
      isValidated: isValidated == freezed
          ? _value.isValidated
          : isValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      serverJwt: serverJwt == freezed
          ? _value.serverJwt
          : serverJwt // ignore: cast_nullable_to_non_nullable
              as String,
      errorNumber: errorNumber == freezed
          ? _value.errorNumber
          : errorNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      errorDescription: errorDescription == freezed
          ? _value.errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CardinalResponseCopyWith<$Res>
    implements $CardinalResponseCopyWith<$Res> {
  factory _$CardinalResponseCopyWith(
          _CardinalResponse value, $Res Function(_CardinalResponse) then) =
      __$CardinalResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(unknownEnumValue: CardinalResponseActionCode.unknown)
          CardinalResponseActionCode actionCode,
      bool isValidated,
      String serverJwt,
      int? errorNumber,
      String? errorDescription});
}

/// @nodoc
class __$CardinalResponseCopyWithImpl<$Res>
    extends _$CardinalResponseCopyWithImpl<$Res>
    implements _$CardinalResponseCopyWith<$Res> {
  __$CardinalResponseCopyWithImpl(
      _CardinalResponse _value, $Res Function(_CardinalResponse) _then)
      : super(_value, (v) => _then(v as _CardinalResponse));

  @override
  _CardinalResponse get _value => super._value as _CardinalResponse;

  @override
  $Res call({
    Object? actionCode = freezed,
    Object? isValidated = freezed,
    Object? serverJwt = freezed,
    Object? errorNumber = freezed,
    Object? errorDescription = freezed,
  }) {
    return _then(_CardinalResponse(
      actionCode: actionCode == freezed
          ? _value.actionCode
          : actionCode // ignore: cast_nullable_to_non_nullable
              as CardinalResponseActionCode,
      isValidated: isValidated == freezed
          ? _value.isValidated
          : isValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      serverJwt: serverJwt == freezed
          ? _value.serverJwt
          : serverJwt // ignore: cast_nullable_to_non_nullable
              as String,
      errorNumber: errorNumber == freezed
          ? _value.errorNumber
          : errorNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      errorDescription: errorDescription == freezed
          ? _value.errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardinalResponse implements _CardinalResponse {
  _$_CardinalResponse(
      {@JsonKey(unknownEnumValue: CardinalResponseActionCode.unknown)
          required this.actionCode,
      required this.isValidated,
      required this.serverJwt,
      this.errorNumber,
      this.errorDescription});

  factory _$_CardinalResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CardinalResponseFromJson(json);

  @override
  @JsonKey(unknownEnumValue: CardinalResponseActionCode.unknown)
  final CardinalResponseActionCode actionCode;
  @override
  final bool isValidated;
  @override
  final String serverJwt;
  @override
  final int? errorNumber;
  @override
  final String? errorDescription;

  @override
  String toString() {
    return 'CardinalResponse(actionCode: $actionCode, isValidated: $isValidated, serverJwt: $serverJwt, errorNumber: $errorNumber, errorDescription: $errorDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CardinalResponse &&
            const DeepCollectionEquality()
                .equals(other.actionCode, actionCode) &&
            const DeepCollectionEquality()
                .equals(other.isValidated, isValidated) &&
            const DeepCollectionEquality().equals(other.serverJwt, serverJwt) &&
            const DeepCollectionEquality()
                .equals(other.errorNumber, errorNumber) &&
            const DeepCollectionEquality()
                .equals(other.errorDescription, errorDescription));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(actionCode),
      const DeepCollectionEquality().hash(isValidated),
      const DeepCollectionEquality().hash(serverJwt),
      const DeepCollectionEquality().hash(errorNumber),
      const DeepCollectionEquality().hash(errorDescription));

  @JsonKey(ignore: true)
  @override
  _$CardinalResponseCopyWith<_CardinalResponse> get copyWith =>
      __$CardinalResponseCopyWithImpl<_CardinalResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardinalResponseToJson(this);
  }
}

abstract class _CardinalResponse implements CardinalResponse {
  factory _CardinalResponse(
      {@JsonKey(unknownEnumValue: CardinalResponseActionCode.unknown)
          required CardinalResponseActionCode actionCode,
      required bool isValidated,
      required String serverJwt,
      int? errorNumber,
      String? errorDescription}) = _$_CardinalResponse;

  factory _CardinalResponse.fromJson(Map<String, dynamic> json) =
      _$_CardinalResponse.fromJson;

  @override
  @JsonKey(unknownEnumValue: CardinalResponseActionCode.unknown)
  CardinalResponseActionCode get actionCode;
  @override
  bool get isValidated;
  @override
  String get serverJwt;
  @override
  int? get errorNumber;
  @override
  String? get errorDescription;
  @override
  @JsonKey(ignore: true)
  _$CardinalResponseCopyWith<_CardinalResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
