import Flutter
import Foundation
import AccessCheckoutSDK
import CardinalMobile

public class SwiftWorldpayCheckoutPlugin: NSObject, FlutterPlugin {
    lazy var cardinalSessionManager = CardinalSessionManager()
    static let instance = SwiftWorldpayCheckoutPlugin()
    private var methodChannel: FlutterMethodChannel?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        instance.methodChannel = FlutterMethodChannel(name: "worldpay_checkout",
                                                      binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(SwiftWorldpayCheckoutPlugin.instance, channel: instance.methodChannel!)
    }
    
    public func handle(_ call: FlutterMethodCall,
                       result: @escaping FlutterResult) {
        switch call.method {
        case "generateSessions":
            generateSession(call, result: result)
        case "generateCVVSession":
            generateCVVSession(call, result: result)
        case "setupCardinalSession":
            setupCardinalSession(call, result: result)
        case "continueCardinalSession":
            continueCardinalSession(call, result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func generateSession(_ call: FlutterMethodCall,
                                 result: @escaping FlutterResult) {
        let args = call.arguments as? [String: Any] ?? [:]
        if let baseUrl = args["baseUrl"] as? String,
           let merchantId = args["merchantId"] as? String,
           let cardNumber = args["cardNumber"] as? String,
           let cardExpiry = args["cardExpiry"] as? String,
           let cardCVV = args["cardCVV"] as? String {
            guard let accessCheckoutClient = try? AccessCheckoutClientBuilder()
                    .accessBaseUrl(baseUrl)
                    .merchantId(merchantId)
                    .build() else {
                        result(FlutterError(code: "client_build_failed",
                                            message: "Could not initialised AccessCheckoutClient object!",
                                            details: nil))
                        return
                    }
            guard let cardDetails = try? CardDetailsBuilder()
                    .pan(cardNumber)
                    .expiryDate(cardExpiry)
                    .cvc(cardCVV)
                    .build() else {
                        result(FlutterError(code: "card_details_build_failed",
                                            message: "Looks like some card details are invalid!",
                                            details: nil))
                        return
                    }
            do {
                try accessCheckoutClient.generateSessions(cardDetails: cardDetails,
                                                          sessionTypes: [SessionType.card, SessionType.cvc]) { response in
                    DispatchQueue.main.async {
                        switch response {
                        case .success(let sessions):
                            guard
                                let cardSession = sessions[SessionType.card],
                                let cvvSession = sessions[SessionType.cvc] else {
                                    result(FlutterError(code: "no_session_for_card",
                                                        message: "There is no session available for the card!",
                                                        details: nil))
                                    return
                                }
                            result([
                                "cardSession": cardSession,
                                "cvvSession": cvvSession,
                            ])
                        case .failure(let error):
                            let errorMessage = error.message
                            result(FlutterError(code: "generate_session_failed",
                                                message: errorMessage,
                                                details: nil))
                        }
                    }
                }
            } catch {
                result(FlutterError(code: "generate_session_failed",
                                    message: "Could not generate session!",
                                    details: nil))
            }
        } else {
            result(FlutterError(code: "invalid_arguments",
                                message: "Please provide valid required arguments!",
                                details: nil))
        }
    }
    
    private func generateCVVSession(_ call: FlutterMethodCall,
                                    result: @escaping FlutterResult) {
        let args = call.arguments as? [String: Any] ?? [:]
        if let baseUrl = args["baseUrl"] as? String,
           let merchantId = args["merchantId"] as? String,
           let cardCVV = args["cardCVV"] as? String {
            guard let accessCheckoutClient = try? AccessCheckoutClientBuilder()
                    .accessBaseUrl(baseUrl)
                    .merchantId(merchantId)
                    .build() else {
                        result(FlutterError(code: "client_build_failed",
                                            message: "Could not initialised AccessCheckoutClient object!",
                                            details: nil))
                        return
                    }
            guard let cardDetails = try? CardDetailsBuilder()
                    .cvc(cardCVV)
                    .build() else {
                        result(FlutterError(code: "card_details_build_failed",
                                            message: "Looks like some card details are invalid!",
                                            details: nil))
                        return
                    }
            do {
                try accessCheckoutClient.generateSessions(cardDetails: cardDetails,
                                                          sessionTypes: [SessionType.cvc]) { response in
                    DispatchQueue.main.async {
                        switch response {
                        case .success(let sessions):
                            guard
                                let cvvSession = sessions[SessionType.cvc] else {
                                    result(FlutterError(code: "no_session_for_cvv",
                                                        message: "There is no session available for the card!",
                                                        details: nil))
                                    return
                                }
                            result(["cvvSession": cvvSession])
                        case .failure(let error):
                            let errorMessage = error.message
                            result(FlutterError(code: "generate_session_failed",
                                                message: errorMessage,
                                                details: nil))
                        }
                    }
                }
            } catch {
                result(FlutterError(code: "generate_session_failed",
                                    message: "Could not generate session!",
                                    details: nil))
            }
        } else {
            result(FlutterError(code: "invalid_arguments",
                                message: "Please provide valid required arguments!",
                                details: nil))
        }
    }
    
    private func setupCardinalSession(_ call: FlutterMethodCall,
                                      result: @escaping FlutterResult) {
        let args = call.arguments as? [String: Any] ?? [:]
        guard
            let jwt = args["jwt"] as? String,
            let deploymentEnvironment = args["deploymentEnvironment"] as? String else {
                result(FlutterError(code: "invalid_arguments",
                                    message: "Please provide valid required arguments!",
                                    details: nil))
                return
            }
        let environment: CardinalSessionEnvironment = deploymentEnvironment == "production" ? .production : .staging
        cardinalSessionManager.setupCardinalSession(jwt: jwt, deploymentEnvironment: environment) { consumerSessionId in
            result(["success": true, "data": ["consumerSessionId": consumerSessionId]])
        } onError: { response in
            result(["success": false, "data": response.toJson(serverJwt: "")])
        }
    }
    
    private func continueCardinalSession(_ call: FlutterMethodCall,
                                         result: @escaping FlutterResult) {
        let args = call.arguments as? [String: Any] ?? [:]
        guard
            let transactionId = args["transactionId"] as? String,
            let payload = args["payload"] as? String else {
                result(FlutterError(code: "invalid_arguments",
                                    message: "Please provide valid required arguments!",
                                    details: nil))
                return
            }
        cardinalSessionManager.continueCardinalSession(transactionId: transactionId,
                                                       payload: payload,
                                                       result: result)
    }
}

extension CardinalResponse {
    func toJson(serverJwt: String) -> [String: Any] {
        let actionCodeStr: String
        switch actionCode {
        case .success:
            actionCodeStr = "success"
        case .noAction:
            actionCodeStr = "noAction"
        case .failure:
            actionCodeStr = "failure"
        case .error:
            actionCodeStr = "error"
        case .cancel:
            actionCodeStr = "cancel"
        case .timeout:
            actionCodeStr = "timeout"
        @unknown default:
            actionCodeStr = "unknown"
        }
        return [
            "actionCode": actionCodeStr,
            "isValidated": isValidated,
            "serverJwt": serverJwt,
            "errorNumber": errorNumber,
            "errorDescription": errorDescription
        ]
    }
}
