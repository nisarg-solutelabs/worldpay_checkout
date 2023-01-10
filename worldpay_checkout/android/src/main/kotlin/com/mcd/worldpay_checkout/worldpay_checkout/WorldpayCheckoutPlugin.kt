package com.mcd.worldpay_checkout.worldpay_checkout

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.LifecycleOwner
import com.cardinalcommerce.cardinalmobilesdk.Cardinal
import com.cardinalcommerce.cardinalmobilesdk.enums.CardinalEnvironment
import com.cardinalcommerce.cardinalmobilesdk.enums.CardinalRenderType
import com.cardinalcommerce.cardinalmobilesdk.enums.CardinalUiType
import com.cardinalcommerce.cardinalmobilesdk.models.CardinalActionCode
import com.cardinalcommerce.cardinalmobilesdk.models.CardinalConfigurationParameters
import com.cardinalcommerce.cardinalmobilesdk.services.CardinalInitService
import com.cardinalcommerce.shared.userinterfaces.UiCustomization
import com.worldpay.access.checkout.client.session.AccessCheckoutClientBuilder
import com.worldpay.access.checkout.client.session.model.CardDetails
import com.worldpay.access.checkout.client.session.model.SessionType
import io.flutter.embedding.android.FlutterActivity

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.lifecycle.HiddenLifecycleReference
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import org.json.JSONArray
import com.cardinalcommerce.cardinalmobilesdk.models.ValidateResponse
import com.cardinalcommerce.cardinalmobilesdk.services.CardinalValidateReceiver


/** WorldpayCheckoutPlugin */
class WorldpayCheckoutPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    private lateinit var context: Context
    private lateinit var activity: Activity

    private val responseListener = CheckoutSessionResponseListener()

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "worldpay_checkout")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity;
    }

    override fun onDetachedFromActivityForConfigChanges() {

    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity;
    }

    override fun onDetachedFromActivity() {

    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "generateSessions" -> {
                generateSession(call, result)
            }
            "generateCVVSession" -> {
                generateCVVSession(call, result)
            }
            "setupCardinalSession" -> {
                setupCardinalSession(call, result)
            }
            "continueCardinalSession" -> {
                continueCardinalSession(call, result)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun generateSession(@NonNull call: MethodCall, @NonNull result: Result) {
        responseListener.result = result

        try {
            val args = call.arguments as Map<*, *>
            val baseUrl = args["baseUrl"] as String
            val merchantId = args["merchantId"] as String
            val cardNumber = args["cardNumber"] as String
            val cardExpiry = args["cardExpiry"] as String
            val cardCVV = args["cardCVV"] as String

            val accessCheckoutClient = AccessCheckoutClientBuilder()
                .baseUrl(baseUrl)
                .merchantId(merchantId)
                .context(context)
                .sessionResponseListener(responseListener)
                .lifecycleOwner(activity as LifecycleOwner)
                .build()
            val cardDetails = CardDetails.Builder()
                .pan(cardNumber)
                .expiryDate(cardExpiry)
                .cvc(cardCVV)
                .build()
            accessCheckoutClient.generateSessions(cardDetails, listOf(SessionType.CARD, SessionType.CVC))
        } catch (e: Exception) {
            result.error(
                "generate_session_failed",
                e.message ?: "Unknown error occurred!",
                null
            )
        }
    }

    private fun generateCVVSession(@NonNull call: MethodCall, @NonNull result: Result) {
        responseListener.result = result

        try {
            val args = call.arguments as Map<*, *>
            val baseUrl = args["baseUrl"] as String
            val merchantId = args["merchantId"] as String
            val cardCVV = args["cardCVV"] as String

            val accessCheckoutClient = AccessCheckoutClientBuilder()
                .baseUrl(baseUrl)
                .merchantId(merchantId)
                .context(context)
                .sessionResponseListener(responseListener)
                .lifecycleOwner(activity as LifecycleOwner)
                .build()
            val cardDetails = CardDetails.Builder()
                .cvc(cardCVV)
                .build()
            accessCheckoutClient.generateSessions(cardDetails, listOf(SessionType.CVC))
        } catch (e: Exception) {
            result.error(
                "generate_session_failed",
                e.message ?: "Unknown error occurred!",
                null
            )
        }
    }

    private fun setupCardinalSession(@NonNull call: MethodCall, @NonNull result: Result) {
        try {
            val args = call.arguments as Map<*, *>
            val jwt = args["jwt"] as String
            val deploymentEnvironment = args["deploymentEnvironment"] as String
            val environment = if (deploymentEnvironment == "production")  CardinalEnvironment.PRODUCTION else CardinalEnvironment.STAGING

            val cardinal = Cardinal.getInstance()
            var cardinalConfigurationParameters = CardinalConfigurationParameters()
            cardinalConfigurationParameters.environment = environment
            cardinalConfigurationParameters.requestTimeout = 8000
            cardinalConfigurationParameters.challengeTimeout = 5

            var rType = JSONArray()
            rType.put(CardinalRenderType.OTP)
            rType.put(CardinalRenderType.SINGLE_SELECT)
            rType.put(CardinalRenderType.MULTI_SELECT)
            rType.put(CardinalRenderType.OOB)
            rType.put(CardinalRenderType.HTML)
            cardinalConfigurationParameters.renderType = rType

            cardinalConfigurationParameters.uiType = CardinalUiType.BOTH
            cardinalConfigurationParameters.isLocationDataConsentGiven = true


            val yourUICustomizationObject = UiCustomization()
            cardinalConfigurationParameters.uiCustomization = yourUICustomizationObject

            cardinal.configure(context, cardinalConfigurationParameters)

            cardinal.init(jwt,
                object : CardinalInitService {
                    override fun onSetupCompleted(consumerSessionId: String) {
                        result.success(mapOf("success" to true, "data" to mapOf("consumerSessionId" to consumerSessionId)))
                    }

                    override fun onValidated(
                        validateResponse: ValidateResponse,
                        serverJwt: String?
                    ) {
                        result.success(mapOf("success" to false, "data" to validateResponse.toJson(serverJwt ?: "")))
                    }
                })
        } catch (e: Exception) {
            result.error(
                "setup_cardinal_session_failed",
                e.message ?: "Unknown error occurred!",
                null
            )
        }
    }

    private fun continueCardinalSession(@NonNull call: MethodCall, @NonNull result: Result) {
        try {
            val args = call.arguments as Map<*, *>
            val transactionId = args["transactionId"] as String
            val payload = args["payload"] as String

            val cardinal = Cardinal.getInstance()
            cardinal.cca_continue(transactionId, payload, activity) { _, validateResponse, serverJWT ->
                result.success(mapOf("data" to validateResponse.toJson(serverJWT)))
            }
        } catch (e: Exception) {
            result.error(
                "continue_cardinal_session_failed",
                e.message ?: "Unknown error occurred!",
                null
            )
        }
    }
}

fun ValidateResponse.toJson(serverJwt: String): Map<String, Any> {
    val actionCodeStr = when (actionCode) {
        CardinalActionCode.ERROR -> "error"
        CardinalActionCode.SUCCESS -> "success"
        CardinalActionCode.NOACTION -> "noAction"
        CardinalActionCode.FAILURE -> "failure"
        CardinalActionCode.CANCEL -> "cancel"
        CardinalActionCode.TIMEOUT -> "timeout"
    }
    return mapOf(
        "actionCode" to actionCodeStr,
        "isValidated" to isValidated,
        "serverJwt" to serverJwt,
        "errorNumber" to errorNumber,
        "errorDescription" to errorDescription
    )
}