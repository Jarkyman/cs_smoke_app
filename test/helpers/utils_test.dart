// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:cs_smoke_app/core/helper/utils.dart';
import 'package:mocktail/mocktail.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUrlLauncher extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {}

class FakeLaunchOptions extends Fake implements LaunchOptions {}

void main() {
  late MockUrlLauncher mockUrlLauncher;

  setUpAll(() {
    registerFallbackValue(FakeLaunchOptions());
  });

  setUp(() {
    mockUrlLauncher = MockUrlLauncher();
    UrlLauncherPlatform.instance = mockUrlLauncher;
  });

  test('Utils openEmail launches email url', () async {
    when(() => mockUrlLauncher.canLaunch(any())).thenAnswer((_) async => true);
    when(() => mockUrlLauncher.launchUrl(any(), any())).thenAnswer((_) async => true);

    await Utils.openEmail(toEmail: 'test@test.com', subject: 'Subject', body: 'Body');

    verify(() => mockUrlLauncher.launchUrl('mailto:test@test.com?subject=Subject&body=Body', any())).called(1);
  });

  test('Utils openPhoneCall launches tel url', () async {
    when(() => mockUrlLauncher.canLaunch(any())).thenAnswer((_) async => true);
    when(() => mockUrlLauncher.launchUrl(any(), any())).thenAnswer((_) async => true);

    await Utils.openPhoneCall(phoneNumber: '1234567890');

    verify(() => mockUrlLauncher.launchUrl('tel:1234567890', any())).called(1);
  });

  test('Utils openSMS launches sms url', () async {
    when(() => mockUrlLauncher.canLaunch(any())).thenAnswer((_) async => true);
    when(() => mockUrlLauncher.launchUrl(any(), any())).thenAnswer((_) async => true);

    await Utils.openSMS(phoneNumber: '1234567890');

    verify(() => mockUrlLauncher.launchUrl('sms:1234567890', any())).called(1);
  });
  
  test('Utils openLink launches https url on Android/web fallback', () async {
    when(() => mockUrlLauncher.canLaunch(any())).thenAnswer((_) async => true);
    when(() => mockUrlLauncher.launchUrl(any(), any())).thenAnswer((_) async => true);

    // Platform.isIOS might be false on the test environment (macOS or Linux etc)
    // So it will use https://
    await Utils.openLink(url: 'www.google.com');

    verify(() => mockUrlLauncher.launchUrl('https://www.google.com', any())).called(1);
  });
}
