//
//  CardinalPaymentManager.swift
//  worldpay_checkout
//
//  Created by Smit Sonani on 08/02/22.
//

import Flutter
import Foundation
import CardinalMobile

class CardinalSessionManager: CardinalValidationDelegate {
    var session : CardinalSession?
    
    func setupCardinalSession(jwt: String,
                              deploymentEnvironment: CardinalSessionEnvironment,
                              onSuccess: @escaping (String) -> Void,
                              onError: @escaping (CardinalResponse) -> Void) {
        session = CardinalSession()
        let config = CardinalSessionConfiguration()
        config.deploymentEnvironment = deploymentEnvironment
        config.requestTimeout = 8000
        config.challengeTimeout = 8
        config.uiType = .both
        
        let yourCustomUi = UiCustomization()
        config.uiCustomization = yourCustomUi
        
        let yourDarkModeCustomUi = UiCustomization()
        config.uiCustomization = yourDarkModeCustomUi
        
        config.renderType = [CardinalSessionRenderTypeOTP,
                             CardinalSessionRenderTypeHTML,
                             CardinalSessionRenderTypeOOB,
                             CardinalSessionRenderTypeSingleSelect,
                             CardinalSessionRenderTypeMultiSelect]
        
        session!.configure(config)
        
        session!.setup(jwtString: jwt) { consumerSessionId in
            onSuccess(consumerSessionId)
        } validated: { response in
            onError(response)
        }
    }
    
    private var result: FlutterResult?
    func continueCardinalSession(transactionId: String, payload: String, result: @escaping FlutterResult) {
        guard self.result == nil else {
            result(FlutterError(code: "session_issue",
                                message: "There is another session is already in progress!. Please wait till it completes before starting a new session.",
                                details: nil))
            return
        }
        self.result = result
        guard let session = session else {
            result(FlutterError(code: "session_issue",
                                message: "There is no active session!. Please setup a new session before continue",
                                details: nil))
            return
        }
        session.continueWith(transactionId: transactionId,
                             payload: payload,
                             validationDelegate: self)
    }
    
    public func cardinalSession(cardinalSession session: CardinalSession!, stepUpValidated validateResponse: CardinalResponse!, serverJWT: String!) {
        guard let result = result else { return }
        result(["data": validateResponse.toJson(serverJwt: serverJWT)])
        self.result = nil
    }
}
