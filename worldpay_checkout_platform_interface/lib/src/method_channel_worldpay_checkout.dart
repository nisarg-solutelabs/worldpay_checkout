import 'package:flutter/services.dart';

import 'models.dart';
import 'worldpay_checkout_platform_interface.dart';

class MethodChannelWorldpayCheckout extends WorldpayCheckoutPlatform {
  final _methodChannel = const MethodChannel('worldpay_checkout');

  @override
  Future<Sessions> generateSessions({
    required String baseUrl,
    required String merchantId,
    required String cardNumber,
    required String cardExpiry,
    required String cardCVV,
  }) async {
    final sessions = await _methodChannel.invokeMapMethod<String, String>(
      'generateSessions',
      {
        'baseUrl': baseUrl,
        'merchantId': merchantId,
        'cardNumber': cardNumber,
        'cardExpiry': cardExpiry,
        'cardCVV': cardCVV,
      },
    );
    if (sessions == null || sessions.isEmpty) {
      throw PlatformException(
        code: 'unknown',
        message: 'Could not generate session for the given card details!',
      );
    } else {
      return Sessions(
        cardSession: sessions['cardSession'],
        cvvSession: sessions['cvvSession'],
      );
    }
  }

  @override
  Future<String?> generateCVVSession({
    required String baseUrl,
    required String merchantId,
    required String cardCVV,
  }) async {
    final sessions = await _methodChannel.invokeMapMethod<String, String?>(
      'generateCVVSession',
      {
        'baseUrl': baseUrl,
        'merchantId': merchantId,
        'cardCVV': cardCVV,
      },
    );
    if (sessions == null) {
      throw PlatformException(
        code: 'unknown',
        message: 'Could not generate session for the given CVV details!',
      );
    } else {
      return sessions['cvvSession'];
    }
  }

  @override
  Future<SetupCardinalSessionResponse> setupCardinalSession({
    required String jwt,
    required String deploymentEnvironment,
  }) async {
    final result = await _methodChannel.invokeMapMethod<String, dynamic>(
      'setupCardinalSession',
      {
        'jwt': jwt,
        'deploymentEnvironment': deploymentEnvironment,
      },
    );
    if (result == null) {
      throw PlatformException(
        code: 'unknown',
        message: 'Could not setup cardinal session!',
      );
    } else {
      final success = result['success'] as bool;
      if (success) {
        final consumerSessionId = result['data']['consumerSessionId'] as String;
        return SetupCardinalSessionResponse.success(
          consumerSessionId: consumerSessionId,
        );
      } else {
        final json = Map<String, dynamic>.from(result['data']);
        return SetupCardinalSessionResponse.failure(
          response: CardinalResponse.fromJson(json),
        );
      }
    }
  }

  @override
  Future<CardinalResponse> continueCardinalSession({
    required String transactionId,
    required String payload,
  }) async {
    final result = await _methodChannel.invokeMethod(
      'continueCardinalSession',
      {
        'transactionId': transactionId,
        'payload': payload,
      },
    );
    if (result == null) {
      throw PlatformException(
        code: 'unknown',
        message: 'Could not continue cardinal session!',
      );
    } else {
      final json = Map<String, dynamic>.from(result['data']);
      return CardinalResponse.fromJson(json);
    }
  }
}
