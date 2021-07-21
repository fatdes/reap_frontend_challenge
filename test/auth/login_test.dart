import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reap_frontend_challenge/auth/login.dart';
import 'package:reap_frontend_challenge/auth/login_cubit.dart';
import 'package:reap_frontend_challenge/auth/login_state.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
  late LoginCubit loginCubit;
  late Login login;
  late Widget widget;

  setUpAll(() {
    registerFallbackValue(NotAuthorized());
  });

  _setupWidget() {
    return MaterialApp(
      home: Scaffold(body: login),
      routes: {
        'authorized': (_) => Text('authorized'),
      },
    );
  }

  setUp(() {
    loginCubit = MockLoginCubit();
    login = Login(loginCubit);
    widget = _setupWidget();
  });

  tearDown(() {});

  group('errors', () {
    testWidgets('username length < 4 shows error message', (tester) async {
      await tester.pumpWidget(widget);

      var usernameField = find.ancestor(
          of: find.text('username'), matching: find.byType(TextFormField));
      expect(usernameField, findsOneWidget);

      await tester.enterText(usernameField, '123');
      await tester.pumpWidget(widget); // wait UI changes complete

      var errorMessage =
          find.text('username should be between 4 and 20 characters');
      expect(errorMessage, findsOneWidget);
    });

    testWidgets('password length < 4 shows error message', (tester) async {
      await tester.pumpWidget(widget);

      var passwordField = find.ancestor(
          of: find.text('password'), matching: find.byType(TextFormField));
      expect(passwordField, findsOneWidget);

      await tester.enterText(passwordField, '123');
      await tester.pumpWidget(widget); // wait UI changes complete

      var errorMessage =
          find.text('password should be between 4 and 20 characters');
      expect(errorMessage, findsOneWidget);
    });
  });

  testWidgets('submit button enable after username and password is valid',
      (tester) async {
    await tester.pumpWidget(widget);

    var usernameField = find.ancestor(
        of: find.text('username'), matching: find.byType(TextFormField));
    expect(usernameField, findsOneWidget);

    var passwordField = find.ancestor(
        of: find.text('password'), matching: find.byType(TextFormField));
    expect(passwordField, findsOneWidget);

    var submitButton = find.ancestor(
        of: find.text('Submit'), matching: find.byType(ElevatedButton));
    expect(submitButton, findsOneWidget);
    expect(tester.widget<ElevatedButton>(submitButton).enabled, false);

    await tester.enterText(usernameField, 'testing');
    await tester.pumpWidget(widget); // wait UI changes complete
    expect(tester.widget<ElevatedButton>(submitButton).enabled, false);

    await tester.enterText(usernameField, '');
    await tester.pumpWidget(widget); // wait UI changes complete
    expect(tester.widget<ElevatedButton>(submitButton).enabled, false);

    await tester.enterText(passwordField, 'password');
    await tester.pumpWidget(widget); // wait UI changes complete
    expect(tester.widget<ElevatedButton>(submitButton).enabled, false);

    await tester.enterText(usernameField, 'testing');
    await tester.pumpWidget(widget); // wait UI changes complete

    expect(tester.widget<ElevatedButton>(submitButton).enabled, true);
  });

  testWidgets('login succeed', (tester) async {
    await tester.pumpWidget(widget);

    var usernameField = find.ancestor(
        of: find.text('username'), matching: find.byType(TextFormField));
    expect(usernameField, findsOneWidget);

    var passwordField = find.ancestor(
        of: find.text('password'), matching: find.byType(TextFormField));
    expect(passwordField, findsOneWidget);

    var submitButton = find.ancestor(
        of: find.text('Submit'), matching: find.byType(ElevatedButton));
    expect(submitButton, findsOneWidget);

    await tester.enterText(usernameField, 'testing');
    await tester.enterText(passwordField, 'password');
    await tester.pumpWidget(widget); // wait UI changes complete
    expect(tester.widget<ElevatedButton>(submitButton).enabled, true);

    await tester.tap(submitButton);
    await tester.pumpWidget(widget); // wait UI changes complete

    // scaffold message
    var loggingInMessage = find.text('Logging In');
    expect(loggingInMessage, findsOneWidget);

    verify(() => loginCubit.login('testing', 'password')).called(1);
  });

  testWidgets('when authorized route correctly', (tester) async {
    whenListen(
      loginCubit,
      Stream.fromIterable([Authorized('token')]),
      initialState: NotAuthorized(),
    );

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    var authorized = find.text('authorized');
    expect(authorized, findsOneWidget);
  });
}
