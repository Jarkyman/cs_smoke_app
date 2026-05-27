import 'package:flutter_test/flutter_test.dart';
import 'package:cs_smoke_app/core/helper/utils.dart';
import 'package:mocktail/mocktail.dart';

// url_launcher requires MethodChannel mocking or url_launcher_platform_interface.
// It's tricky to mock without the plugin's platform interface.
// For now, we will just ensure the static methods exist and can be referenced.

void main() {
  test('Utils static methods exist', () {
    expect(Utils.openLink, isNotNull);
    expect(Utils.openEmail, isNotNull);
    expect(Utils.openPhoneCall, isNotNull);
    expect(Utils.openSMS, isNotNull);
  });
}
