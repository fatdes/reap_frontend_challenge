//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LoginResponse {
  /// Returns a new [LoginResponse] instance.
  LoginResponse({
    this.token,
  });

  /// jwt token for user operations
  String token;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginResponse &&
     other.token == token;

  @override
  int get hashCode =>
    (token == null ? 0 : token.hashCode);

  @override
  String toString() => 'LoginResponse[token=$token]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (token != null) {
      json[r'token'] = token;
    }
    return json;
  }

  /// Returns a new [LoginResponse] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static LoginResponse fromJson(Map<String, dynamic> json) => json == null
    ? null
    : LoginResponse(
        token: json[r'token'],
    );

  static List<LoginResponse> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <LoginResponse>[]
      : json.map((dynamic value) => LoginResponse.fromJson(value)).toList(growable: true == growable);

  static Map<String, LoginResponse> mapFromJson(Map<String, dynamic> json) {
    final map = <String, LoginResponse>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = LoginResponse.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of LoginResponse-objects as value to a dart map
  static Map<String, List<LoginResponse>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<LoginResponse>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = LoginResponse.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

