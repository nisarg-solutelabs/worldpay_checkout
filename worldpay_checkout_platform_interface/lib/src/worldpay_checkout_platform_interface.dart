import 'dart:async';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_worldpay_checkout.dart';
import 'models.dart';

abstract class WorldpayCheckoutPlatform extends PlatformInterface {
  static WorldpayCheckoutPlatform _instance = MethodChannelWorldpayCheckout();

  static final _token = Object();

  static WorldpayCheckoutPlatform get instance => _instance;

  static set instance(WorldpayCheckoutPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  WorldpayCheckoutPlatform() : super(token: _token);

  Future<Sessions> generateSessions({
    required String baseUrl,
    required String merchantId,
    required String cardNumber,
    required String cardExpiry,
    required String cardCVV,
  }) {
    throw UnimplementedError(
      'generateSessions() has not been implemented.',
    );
  }

  Future<String?> generateCVVSession({
    required String baseUrl,
    required String merchantId,
    required String cardCVV,
  }) {
    throw UnimplementedError(
      'generateCVVSession() has not been implemented.',
    );
  }

  Future<SetupCardinalSessionResponse> setupCardinalSession({
    /// Token retrieved from server during Device Data Intitialization
    required String jwt,

    /// `production` or `staging`
    required String deploymentEnvironment,
  }) {
    throw UnimplementedError(
      'setupCardinalSession() has not been implemented.',
    );
  }

  Future<CardinalResponse> continueCardinalSession({
    required String transactionId,
    required String payload,
  }) {
    throw UnimplementedError(
      'continueCardinalSession() has not been implemented.',
    );
  }
}
