import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pillow/pillow.dart';

void main() {
  const MethodChannel channel = MethodChannel('pillow');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Pillow.platformVersion, '42');
  });
}
