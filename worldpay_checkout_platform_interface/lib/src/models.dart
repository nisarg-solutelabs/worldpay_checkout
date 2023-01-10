import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

enum SessionType { card, cvv }

class Sessions {
  final String? cardSession;
  final String? cvvSession;

  const Sessions({
    this.cardSession,
    this.cvvSession,
  });
}

@freezed
class SetupCardinalSessionResponse with _$SetupCardinalSessionResponse {
  factory SetupCardinalSessionResponse.success({
    required String consumerSessionId,
  }) = SetupCardinalSessionSuccess;

  factory SetupCardinalSessionResponse.failure({
    required CardinalResponse response,
  }) = SetupCardinalSessionFailure;
}

@JsonEnum()
enum CardinalResponseActionCode {
  @JsonValue('success')
  success,
  @JsonValue('noAction')
  noAction,
  @JsonValue('failure')
  failure,
  @JsonValue('error')
  error,
  @JsonValue('cancel')
  cancel,
  @JsonValue('timeout')
  timeout,
  @JsonValue('unknown')
  unknown,
}

@freezed
class CardinalResponse with _$CardinalResponse {
  factory CardinalResponse({
    // ignore: invalid_annotation_target
    @JsonKey(unknownEnumValue: CardinalResponseActionCode.unknown)
        required CardinalResponseActionCode actionCode,
    required bool isValidated,
    required String serverJwt,
    int? errorNumber,
    String? errorDescription,
  }) = _CardinalResponse;

  factory CardinalResponse.fromJson(Map<String, dynamic> json) =>
      _$CardinalResponseFromJson(json);
}
