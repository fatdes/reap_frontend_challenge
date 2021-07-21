//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LoginRequest {
  /// Returns a new [LoginRequest] instance.
  LoginRequest({
    @required this.username,
    @required this.password,
  });

  String username;

  String password;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginRequest &&
     other.username == username &&
     other.password == password;

  @override
  int get hashCode =>
    (username == null ? 0 : username.hashCode) +
    (password == null ? 0 : password.hashCode);

  @override
  String toString() => 'LoginRequest[username=$username, password=$password]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'username'] = username;
      json[r'password'] = password;
    return json;
  }

  /// Returns a new [LoginRequest] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static LoginRequest fromJson(Map<String, dynamic> json) => json == null
    ? null
    : LoginRequest(
        username: json[r'username'],
        password: json[r'password'],
    );

  static List<LoginRequest> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <LoginRequest>[]
      : json.map((dynamic value) => LoginRequest.fromJson(value)).toList(growable: true == growable);

  static Map<String, LoginRequest> mapFromJson(Map<String, dynamic> json) {
    final map = <String, LoginRequest>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = LoginRequest.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of LoginRequest-objects as value to a dart map
  static Map<String, List<LoginRequest>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<LoginRequest>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = LoginRequest.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

