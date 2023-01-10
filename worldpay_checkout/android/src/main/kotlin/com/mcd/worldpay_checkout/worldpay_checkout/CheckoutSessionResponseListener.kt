package com.mcd.worldpay_checkout.worldpay_checkout

import com.worldpay.access.checkout.client.api.exception.AccessCheckoutException
import com.worldpay.access.checkout.client.session.listener.SessionResponseListener
import com.worldpay.access.checkout.client.session.model.SessionType
import io.flutter.plugin.common.MethodChannel

class CheckoutSessionResponseListener : SessionResponseListener {

    var result: MethodChannel.Result? = null

    override fun onSuccess(sessionResponseMap: Map<SessionType, String>) {
        val cardSession = sessionResponseMap[SessionType.CARD]
        val cvvSession = sessionResponseMap[SessionType.CVC]
        result?.success(mapOf("cardSession" to cardSession, "cvvSession" to cvvSession))
    }

    override fun onError(error: AccessCheckoutException) {
        result?.error(
            "generate_session_failed",
            error.message,
            null
        )
    }

}