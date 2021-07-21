# insta_pic_api.api.UserApi

## Load the API package
```dart
import 'package:insta_pic_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPost**](UserApi.md#createpost) | **POST** /user/post | Create a new post
[**getPostImage**](UserApi.md#getpostimage) | **GET** /user/post/{postID}/image | Get post image
[**listPost**](UserApi.md#listpost) | **GET** /user/post | List posts


# **createPost**
> Post createPost(image, description)

Create a new post

### Example 
```dart
import 'package:insta_pic_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final image = BINARY_DATA_HERE; // MultipartFile | 
final description = description_example; // String | 

try { 
    final result = api_instance.createPost(image, description);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->createPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **image** | **MultipartFile**|  | 
 **description** | **String**|  | [optional] 

### Return type

[**Post**](Post.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPostImage**
> String getPostImage(postID)

Get post image

### Example 
```dart
import 'package:insta_pic_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final postID = postID_example; // String | 

try { 
    final result = api_instance.getPostImage(postID);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->getPostImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postID** | **String**|  | 

### Return type

**String**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: plain/text

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPost**
> ListPostResponse listPost(username, createdAtSortOrder)

List posts

### Example 
```dart
import 'package:insta_pic_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final username = username_example; // String | filter post posted by username
final createdAtSortOrder = createdAtSortOrder_example; // String | 

try { 
    final result = api_instance.listPost(username, createdAtSortOrder);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->listPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| filter post posted by username | [optional] 
 **createdAtSortOrder** | **String**|  | [optional] [default to 'desc']

### Return type

[**ListPostResponse**](ListPostResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

