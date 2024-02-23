
import 'send_sms_plugin_platform_interface.dart';

class SendSmsPlugin {
  Future<String?> getPlatformVersion() {
    return SendSmsPluginPlatform.instance.getPlatformVersion();
  }
}
