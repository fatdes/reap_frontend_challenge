//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Post {
  /// Returns a new [Post] instance.
  Post({
    this.url,
    this.username,
    this.description,
    this.createdAt,
  });

  /// url to the post image
  String url;

  String username;

  String description;

  /// created date time
  String createdAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Post &&
     other.url == url &&
     other.username == username &&
     other.description == description &&
     other.createdAt == createdAt;

  @override
  int get hashCode =>
    (url == null ? 0 : url.hashCode) +
    (username == null ? 0 : username.hashCode) +
    (description == null ? 0 : description.hashCode) +
    (createdAt == null ? 0 : createdAt.hashCode);

  @override
  String toString() => 'Post[url=$url, username=$username, description=$description, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (url != null) {
      json[r'url'] = url;
    }
    if (username != null) {
      json[r'username'] = username;
    }
    if (description != null) {
      json[r'description'] = description;
    }
    if (createdAt != null) {
      json[r'created_at'] = createdAt;
    }
    return json;
  }

  /// Returns a new [Post] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static Post fromJson(Map<String, dynamic> json) => json == null
    ? null
    : Post(
        url: json[r'url'],
        username: json[r'username'],
        description: json[r'description'],
        createdAt: json[r'created_at'],
    );

  static List<Post> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <Post>[]
      : json.map((dynamic value) => Post.fromJson(value)).toList(growable: true == growable);

  static Map<String, Post> mapFromJson(Map<String, dynamic> json) {
    final map = <String, Post>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = Post.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Post-objects as value to a dart map
  static Map<String, List<Post>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<Post>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = Post.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

