//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UserApi {
  UserApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a new post
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MultipartFile] image (required):
  ///
  /// * [String] description:
  Future<Response> createPostWithHttpInfo(MultipartFile image, { String description }) async {
    // Verify required params are set.
    if (image == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: image');
    }

    final path = r'/user/post';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['multipart/form-data'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>['bearerAuth'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (image != null) {
      hasFields = true;
      mp.fields[r'image'] = image.field;
      mp.files.add(image);
    }
    if (description != null) {
      hasFields = true;
      mp.fields[r'description'] = parameterToString(description);
    }
    if (hasFields) {
      postBody = mp;
    }

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

  /// Create a new post
  ///
  /// Parameters:
  ///
  /// * [MultipartFile] image (required):
  ///
  /// * [String] description:
  Future<Post> createPost(MultipartFile image, { String description }) async {
    final response = await createPostWithHttpInfo(image,  description: description );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Post',) as Post;
        }
    return Future<Post>.value(null);
  }

  /// Get post image
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] postID (required):
  Future<Response> getPostImageWithHttpInfo(String postID) async {
    // Verify required params are set.
    if (postID == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: postID');
    }

    final path = r'/user/post/{postID}/image'
      .replaceAll('{' + 'postID' + '}', postID.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>['bearerAuth'];


    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Get post image
  ///
  /// Parameters:
  ///
  /// * [String] postID (required):
  Future<String> getPostImage(String postID) async {
    final response = await getPostImageWithHttpInfo(postID);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'String',) as String;
        }
    return Future<String>.value(null);
  }

  /// List posts
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] username:
  ///   filter post posted by username
  ///
  /// * [String] createdAtSortOrder:
  Future<Response> listPostWithHttpInfo({ String username, String createdAtSortOrder }) async {
    // Verify required params are set.

    final path = r'/user/post';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (username != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'username', username));
    }
    if (createdAtSortOrder != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'created_at_sort_order', createdAtSortOrder));
    }

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>['bearerAuth'];


    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// List posts
  ///
  /// Parameters:
  ///
  /// * [String] username:
  ///   filter post posted by username
  ///
  /// * [String] createdAtSortOrder:
  Future<ListPostResponse> listPost({ String username, String createdAtSortOrder }) async {
    final response = await listPostWithHttpInfo( username: username, createdAtSortOrder: createdAtSortOrder );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ListPostResponse',) as ListPostResponse;
        }
    return Future<ListPostResponse>.value(null);
  }
}
