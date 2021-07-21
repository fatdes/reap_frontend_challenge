//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ListPostResponse {
  /// Returns a new [ListPostResponse] instance.
  ListPostResponse({
    this.postList = const [],
  });

  List<Post> postList;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ListPostResponse &&
     other.postList == postList;

  @override
  int get hashCode =>
    (postList == null ? 0 : postList.hashCode);

  @override
  String toString() => 'ListPostResponse[postList=$postList]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (postList != null) {
      json[r'post_list'] = postList;
    }
    return json;
  }

  /// Returns a new [ListPostResponse] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static ListPostResponse fromJson(Map<String, dynamic> json) => json == null
    ? null
    : ListPostResponse(
        postList: Post.listFromJson(json[r'post_list']),
    );

  static List<ListPostResponse> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ListPostResponse>[]
      : json.map((dynamic value) => ListPostResponse.fromJson(value)).toList(growable: true == growable);

  static Map<String, ListPostResponse> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ListPostResponse>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = ListPostResponse.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ListPostResponse-objects as value to a dart map
  static Map<String, List<ListPostResponse>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ListPostResponse>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = ListPostResponse.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

