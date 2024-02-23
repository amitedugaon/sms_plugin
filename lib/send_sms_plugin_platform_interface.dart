import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'send_sms_plugin_method_channel.dart';

abstract class SendSmsPluginPlatform extends PlatformInterface {
  /// Constructs a SendSmsPluginPlatform.
  SendSmsPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static SendSmsPluginPlatform _instance = MethodChannelSendSmsPlugin();

  /// The default instance of [SendSmsPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelSendSmsPlugin].
  static SendSmsPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SendSmsPluginPlatform] when
  /// they register themselves.
  static set instance(SendSmsPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
