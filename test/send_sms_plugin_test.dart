import 'package:flutter_test/flutter_test.dart';
import 'package:send_sms_plugin/send_sms_plugin.dart';
import 'package:send_sms_plugin/send_sms_plugin_platform_interface.dart';
import 'package:send_sms_plugin/send_sms_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSendSmsPluginPlatform
    with MockPlatformInterfaceMixin
    implements SendSmsPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SendSmsPluginPlatform initialPlatform = SendSmsPluginPlatform.instance;

  test('$MethodChannelSendSmsPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSendSmsPlugin>());
  });

  test('getPlatformVersion', () async {
    SendSmsPlugin sendSmsPlugin = SendSmsPlugin();
    MockSendSmsPluginPlatform fakePlatform = MockSendSmsPluginPlatform();
    SendSmsPluginPlatform.instance = fakePlatform;

    expect(await sendSmsPlugin.getPlatformVersion(), '42');
  });
}
