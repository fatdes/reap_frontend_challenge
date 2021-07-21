//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AuthApi {
  AuthApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Register or login user
  ///
  /// Register new user or login existing user, jwt token is returned on successful operation
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [LoginRequest] loginRequest (required):
  Future<Response> loginWithHttpInfo(LoginRequest loginRequest) async {
    // Verify required params are set.
    if (loginRequest == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: loginRequest');
    }

    final path = r'/auth/login';

    Object postBody = loginRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Register or login user
  ///
  /// Register new user or login existing user, jwt token is returned on successful operation
  ///
  /// Parameters:
  ///
  /// * [LoginRequest] loginRequest (required):
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final response = await loginWithHttpInfo(loginRequest);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'LoginResponse',) as LoginResponse;
        }
    return Future<LoginResponse>.value(null);
  }
}
