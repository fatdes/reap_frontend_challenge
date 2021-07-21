import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:insta_pic_api/api.dart';

abstract class InstaPicState extends Equatable {
  const InstaPicState();

  @override
  List<Object?> get props => [];
}

class NotAuthorized extends InstaPicState {
  final ErrorResponse? reason;

  NotAuthorized([this.reason]);

  @override
  List<Object?> get props => [this.reason];
}

class UnknownError extends InstaPicState {
  final ErrorResponse? reason;

  UnknownError([this.reason]);

  @override
  List<Object?> get props => [this.reason];
}

class LoadingPost extends InstaPicState {}

class PostLoaded extends InstaPicState {
  final List<Post> posts;

  PostLoaded(this.posts);

  @override
  List<Object?> get props => [this.posts];
}

class PostImageLoaded extends InstaPicState {
  final String postID;
  final Uint8List bytes;

  PostImageLoaded(this.postID, this.bytes);

  @override
  List<Object?> get props => [this.postID, this.bytes];
}

class PostCreated extends InstaPicState {
  final Post post;

  PostCreated(this.post);

  @override
  List<Object?> get props => [this.post];
}
