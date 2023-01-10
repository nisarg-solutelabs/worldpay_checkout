// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardinalResponse _$$_CardinalResponseFromJson(Map<String, dynamic> json) =>
    _$_CardinalResponse(
      actionCode: $enumDecode(
          _$CardinalResponseActionCodeEnumMap, json['actionCode'],
          unknownValue: CardinalResponseActionCode.unknown),
      isValidated: json['isValidated'] as bool,
      serverJwt: json['serverJwt'] as String,
      errorNumber: json['errorNumber'] as int?,
      errorDescription: json['errorDescription'] as String?,
    );

Map<String, dynamic> _$$_CardinalResponseToJson(_$_CardinalResponse instance) =>
    <String, dynamic>{
      'actionCode': _$CardinalResponseActionCodeEnumMap[instance.actionCode],
      'isValidated': instance.isValidated,
      'serverJwt': instance.serverJwt,
      'errorNumber': instance.errorNumber,
      'errorDescription': instance.errorDescription,
    };

const _$CardinalResponseActionCodeEnumMap = {
  CardinalResponseActionCode.success: 'success',
  CardinalResponseActionCode.noAction: 'noAction',
  CardinalResponseActionCode.failure: 'failure',
  CardinalResponseActionCode.error: 'error',
  CardinalResponseActionCode.cancel: 'cancel',
  CardinalResponseActionCode.timeout: 'timeout',
  CardinalResponseActionCode.unknown: 'unknown',
};
