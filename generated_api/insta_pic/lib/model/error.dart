//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Error {
  /// Returns a new [Error] instance.
  Error({
    this.errorMessage,
  });

  String errorMessage;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Error &&
     other.errorMessage == errorMessage;

  @override
  int get hashCode =>
    (errorMessage == null ? 0 : errorMessage.hashCode);

  @override
  String toString() => 'Error[errorMessage=$errorMessage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (errorMessage != null) {
      json[r'ErrorMessage'] = errorMessage;
    }
    return json;
  }

  /// Returns a new [Error] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static Error fromJson(Map<String, dynamic> json) => json == null
    ? null
    : Error(
        errorMessage: json[r'ErrorMessage'],
    );

  static List<Error> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <Error>[]
      : json.map((dynamic value) => Error.fromJson(value)).toList(growable: true == growable);

  static Map<String, Error> mapFromJson(Map<String, dynamic> json) {
    final map = <String, Error>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = Error.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Error-objects as value to a dart map
  static Map<String, List<Error>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<Error>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = Error.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

