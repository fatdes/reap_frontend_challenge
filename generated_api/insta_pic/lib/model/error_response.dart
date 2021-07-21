//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ErrorResponse {
  /// Returns a new [ErrorResponse] instance.
  ErrorResponse({
    this.errorMessage,
  });

  String errorMessage;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ErrorResponse &&
     other.errorMessage == errorMessage;

  @override
  int get hashCode =>
    (errorMessage == null ? 0 : errorMessage.hashCode);

  @override
  String toString() => 'ErrorResponse[errorMessage=$errorMessage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (errorMessage != null) {
      json[r'ErrorMessage'] = errorMessage;
    }
    return json;
  }

  /// Returns a new [ErrorResponse] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static ErrorResponse fromJson(Map<String, dynamic> json) => json == null
    ? null
    : ErrorResponse(
        errorMessage: json[r'ErrorMessage'],
    );

  static List<ErrorResponse> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ErrorResponse>[]
      : json.map((dynamic value) => ErrorResponse.fromJson(value)).toList(growable: true == growable);

  static Map<String, ErrorResponse> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ErrorResponse>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = ErrorResponse.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ErrorResponse-objects as value to a dart map
  static Map<String, List<ErrorResponse>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ErrorResponse>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = ErrorResponse.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

