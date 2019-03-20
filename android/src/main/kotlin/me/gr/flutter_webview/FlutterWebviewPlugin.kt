package me.gr.flutter_webview

import android.app.Activity
import android.content.Context
import android.content.Intent
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterWebviewPlugin(private val activity: Activity) : MethodCallHandler {

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "flutter_webview")
            channel.setMethodCallHandler(FlutterWebviewPlugin(registrar.activity()))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        val intent = Intent(activity, WebViewActivity::class.java)
        intent.putExtra(WebViewActivity.URL, call.argument<String>("url"))
        activity.startActivity(intent)
        activity.finish()
    }
}
