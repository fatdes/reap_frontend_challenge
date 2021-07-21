import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:insta_pic_api/api.dart';

import '../util/api_util.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthApi authApi;

  LoginCubit(
    LoginState initialState, {
    AuthApi? authApi,
  })  : this.authApi = authApi ?? AuthApi(),
        super(initialState);

  void login(String username, String password) async {
    try {
      LoginResponse loginResponse = await authApi.login(
        LoginRequest(username: username, password: password),
      );

      emit(Authorized(loginResponse.token));
    } on ApiException catch (e) {
      emit(NotAuthorized(ApiUtil.apiExceptionToError(e)));
    } catch (e) {
      emit(NotAuthorized(ErrorResponse(
        errorMessage: 'unknown exception = $e',
      )));
    }
  }
}
