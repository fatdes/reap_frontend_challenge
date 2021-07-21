import 'package:flutter_test/flutter_test.dart';

void main() {
  test('regex extract post ID', () async {
    final imageURLPattern = RegExp(r'/v1/user/post/([\w-]+)/image');

    expect('POST-1234',
        imageURLPattern.firstMatch('/v1/user/post/POST-1234/image')!.group(1));
  });
}
