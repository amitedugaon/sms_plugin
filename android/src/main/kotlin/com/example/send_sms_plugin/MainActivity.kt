package com.example.send_sms_plugin


import android.annotation.TargetApi
import android.os.Build
import android.telephony.SmsManager
import android.widget.Toast
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "sms_sender_channel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "sendSms" -> {
                    val arguments = call.arguments as? Map<String, String>
                    val number = arguments?.get("number")
                    val message = arguments?.get("message")
                    if (number != null && message != null) {
                        sendSms(number, message)
                        result.success("SMS sent successfully.")
                    } else {
                        result.error("MISSING_ARGS", "Number or message is missing", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    @TargetApi(Build.VERSION_CODES.DONUT)
    private fun sendSms(number: String, message: String) {
        val smsManager = SmsManager.getDefault()
        smsManager.sendTextMessage(number, null, message, null, null)
        Toast.makeText(applicationContext, "Message Sent", Toast.LENGTH_LONG).show()
    }
}
