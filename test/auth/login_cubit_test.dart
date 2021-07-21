import 'package:flutter_test/flutter_test.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:insta_pic_api/api.dart';
import 'package:mockito/mockito.dart';
import 'package:reap_frontend_challenge/auth/login_cubit.dart';
import 'package:reap_frontend_challenge/auth/login_state.dart';

class MockAuthApi extends Mock implements AuthApi {}

void main() {
  late LoginCubit cubit;
  late MockAuthApi authApi;

  setUp(() {
    authApi = MockAuthApi();
    cubit = LoginCubit(NotAuthorized(), authApi: authApi);
  });

  tearDown(() {
    verifyNoMoreInteractions(authApi);
  });

  test('login succeed', () async {
    when(authApi.login(any))
        .thenAnswer((_) async => LoginResponse(token: 'token'));

    expectLater(
        cubit.stream,
        emitsInOrder([
          Authorized('token'),
        ])).then((_) {
      verify(authApi
              .login(LoginRequest(username: 'testing', password: 'password')))
          .called(1);
    });

    cubit.login('testing', 'password');
  });

  test('login failed', () async {
    when(authApi.login(any)).thenAnswer((_) async => throw ApiException(
        400, '{ "ErrorMessage": "username password not match" }'));

    expectLater(
        cubit.stream,
        emitsInOrder([
          NotAuthorized(
              ErrorResponse(errorMessage: 'username password not match')),
        ])).then((_) {
      verify(authApi
              .login(LoginRequest(username: 'testing', password: 'password')))
          .called(1);
    });

    cubit.login('testing', 'password');
  });

  test('login unknown exception', () async {
    when(authApi.login(any)).thenAnswer((_) async => throw Exception('test'));

    expectLater(
        cubit.stream,
        emitsInOrder([
          NotAuthorized(ErrorResponse(
              errorMessage: 'unknown exception = Exception: test')),
        ])).then((_) {
      verify(authApi
              .login(LoginRequest(username: 'testing', password: 'password')))
          .called(1);
    });

    cubit.login('testing', 'password');
  });
}
