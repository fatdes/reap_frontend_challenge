import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:insta_pic_api/api.dart';

import '../util/api_util.dart';
import 'insta_pic_state.dart';

class InstaPicCubit extends Cubit<InstaPicState> {
  final UserApi userApi;

  final Map<String, Uint8List> cachedImages = {};

  InstaPicCubit(
    InstaPicState initialState, {
    UserApi? userApi,
  })  : this.userApi = userApi ?? UserApi(),
        super(initialState);

  @override
  Future<void> close() async {
    cachedImages.clear();
    super.close();
  }

  void loadPost() async {
    try {
      ListPostResponse response = await userApi.listPost();

      emit(PostLoaded(response.postList));
    } on ApiException catch (e) {
      if (e.code == 403) {
        emit(NotAuthorized(ApiUtil.apiExceptionToError(e)));
        return;
      }
      emit(UnknownError(ApiUtil.apiExceptionToError(e)));
    } catch (e) {
      emit(UnknownError(ErrorResponse(
        errorMessage: 'unknown exception = $e',
      )));
    }
  }

  void getPostImage(String postID) async {
    try {
      if (cachedImages[postID] != null) {
        emit(PostImageLoaded(postID, cachedImages[postID]!));
        return;
      }

      String base64Image = await userApi.getPostImage(postID);
      cachedImages[postID] = base64Decode(base64Image);

      emit(PostImageLoaded(postID, cachedImages[postID]!));
    } on ApiException catch (e) {
      if (e.code == 403) {
        emit(NotAuthorized(ApiUtil.apiExceptionToError(e)));
        return;
      }
      emit(UnknownError(ApiUtil.apiExceptionToError(e)));
    } catch (e) {
      emit(UnknownError(ErrorResponse(
        errorMessage: 'unknown exception = $e',
      )));
    }
  }

  void createPost(Future<Uint8List> imageFile, String? description) async {
    try {
      final file = MultipartFile.fromBytes(
        'image',
        await imageFile,
        filename: 'image', // required or server can't find uploaded file
      );
      Post post = await userApi.createPost(file, description: description);

      emit(PostCreated(post));
    } on ApiException catch (e) {
      if (e.code == 403) {
        emit(NotAuthorized(ApiUtil.apiExceptionToError(e)));
        return;
      }
      emit(UnknownError(ApiUtil.apiExceptionToError(e)));
    } catch (e) {
      emit(UnknownError(ErrorResponse(
        errorMessage: 'unknown exception = $e',
      )));
    }
  }
}
