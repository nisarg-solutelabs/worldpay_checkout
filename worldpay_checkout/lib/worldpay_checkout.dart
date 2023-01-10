import 'dart:async';

import 'package:worldpay_checkout_platform_interface/worldpay_checkout_platform_interface.dart';

export 'package:worldpay_checkout_platform_interface/worldpay_checkout_platform_interface.dart';

class WorldpayCheckout {
  const WorldpayCheckout({
    required this.baseUrl,
    required this.merchantId,
  });

  final String baseUrl;
  final String merchantId;

  Future<Sessions> generateSessions({
    required String cardNumber,
    required String cardExpiry,
    required String cardCVV,
  }) =>
      WorldpayCheckoutPlatform.instance.generateSessions(
        baseUrl: baseUrl,
        merchantId: merchantId,
        cardNumber: cardNumber,
        cardExpiry: cardExpiry,
        cardCVV: cardCVV,
      );

  Future<String?> generateCVVSession({
    required String cardCVV,
  }) =>
      WorldpayCheckoutPlatform.instance.generateCVVSession(
        baseUrl: baseUrl,
        merchantId: merchantId,
        cardCVV: cardCVV,
      );

  Future<SetupCardinalSessionResponse> setupCardinalSession({
    /// Token retrieved from server during Device Data Intitialization
    required String jwt,

    /// Accepted Values => `production` or `staging`
    required String deploymentEnvironment,
  }) =>
      WorldpayCheckoutPlatform.instance.setupCardinalSession(
        jwt: jwt,
        deploymentEnvironment: deploymentEnvironment,
      );

  Future<CardinalResponse> continueCardinalSession({
    required String transactionId,
    required String payload,
  }) =>
      WorldpayCheckoutPlatform.instance.continueCardinalSession(
        transactionId: transactionId,
        payload: payload,
      );
}
