# insta_pic_api.api.AuthApi

## Load the API package
```dart
import 'package:insta_pic_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**login**](AuthApi.md#login) | **POST** /auth/login | Register or login user


# **login**
> LoginResponse login(loginRequest)

Register or login user

Register new user or login existing user, jwt token is returned on successful operation

### Example 
```dart
import 'package:insta_pic_api/api.dart';

final api_instance = AuthApi();
final loginRequest = LoginRequest(); // LoginRequest | 

try { 
    final result = api_instance.login(loginRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->login: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | 

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

