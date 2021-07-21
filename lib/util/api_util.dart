import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:insta_pic_api/api.dart';

class ApiUtil {
  static bool hasLoggedIn() {
    HttpBearerAuth bearer = defaultApiClient.getAuthentication('bearerAuth');
    return bearer.accessToken?.isNotEmpty ?? false;
  }

  static String getToken() {
    HttpBearerAuth bearer = defaultApiClient.getAuthentication('bearerAuth');
    return bearer.accessToken;
  }

  static void loggedIn(String token) {
    HttpBearerAuth bearer = defaultApiClient.getAuthentication('bearerAuth');
    bearer.accessToken = token;
  }

  static void logout() {
    HttpBearerAuth bearer = defaultApiClient.getAuthentication('bearerAuth');
    bearer.accessToken = '';
  }

  static ErrorResponse? apiExceptionToError(ApiException apiException) {
    try {
      Map<String, dynamic> map = json.decode(apiException.message);
      return ErrorResponse.fromJson(map);
    } catch (e) {
      return ErrorResponse(errorMessage: apiException.message);
    }
  }
}
