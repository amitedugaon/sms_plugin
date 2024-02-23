import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'send_sms_plugin_platform_interface.dart';

/// An implementation of [SendSmsPluginPlatform] that uses method channels.
class MethodChannelSendSmsPlugin extends SendSmsPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('send_sms_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
