import 'package:flutter/services.dart';

class FlutterWebview {
  static const MethodChannel _channel = const MethodChannel('flutter_webview');

  static void load(String url) {
    _channel.invokeMethod('load', {'url': url});
  }
}
