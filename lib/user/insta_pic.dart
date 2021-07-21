import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:insta_pic_api/api.dart';

import '../util/api_util.dart';
import 'add_post.dart';
import 'insta_pic_cubit.dart';
import 'insta_pic_state.dart';

class InstaPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InstaPicCubit>(
      create: (BuildContext context) =>
          InstaPicCubit(LoadingPost())..loadPost(),
      child: BlocConsumer<InstaPicCubit, InstaPicState>(
        listenWhen: (_, __) => true,
        listener: (BuildContext context, InstaPicState state) {
          if (state is NotAuthorized) {
            Navigator.of(context).pushReplacementNamed('not_authorized');
          }
          if (state is UnknownError) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Unknown Error: ${state.reason}')));
          }
          if (state is PostCreated) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Post Created')));

            // reload post list, not ideal but simple
            BlocProvider.of<InstaPicCubit>(context).loadPost();
          }
        },
        buildWhen: (_, current) =>
            current is LoadingPost || current is PostLoaded,
        builder: (BuildContext context, InstaPicState state) {
          Widget _buildPostList() {
            if (state is PostLoaded) {
              List<Post> posts = state.posts;

              // THIS IS NOT WORKING
              // BUG: https://github.com/flutter/flutter/issues/57187
              // HACK: authorization header
              // Map<String, String> headers = {
              //   'Authorization': 'Bearer ${ApiUtil.getToken()}',
              // };

              final imageURLPattern = RegExp(r'/v1/user/post/([\w-]+)/image');

              return ListView.builder(
                padding: EdgeInsets.all(2),
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int i) {
                  final Post post = posts[i];
                  final String? postID =
                      imageURLPattern.firstMatch(post.url)!.group(1);
                  if (postID == null) {
                    return Text('Fail to extract post image');
                  }

                  BlocProvider.of<InstaPicCubit>(context).getPostImage(postID);

                  return Container(
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: Column(
                      children: [
                        // THIS IS NOT WORKING
                        // BUG: https://github.com/flutter/flutter/issues/57187
                        // Image.network(
                        //   '${Env.apiBase}${post.url.replaceAll('/v1', '')}',
                        //   headers: headers,
                        // ),
                        BlocBuilder<InstaPicCubit, InstaPicState>(
                          buildWhen: (_, current) =>
                              current is PostImageLoaded &&
                              current.postID == postID,
                          builder: (BuildContext context, InstaPicState state) {
                            if (state is PostImageLoaded) {
                              return Image.memory(state.bytes, width: 200);
                            }

                            return CircularProgressIndicator();
                          },
                        ),
                        if (post.description != null &&
                            post.description.isNotEmpty)
                          Text(post.description),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text('Posted by ${post.username}'),
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            return CircularProgressIndicator();
          }

          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    ApiUtil.logout();
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    Navigator.of(context)
                        .pushReplacementNamed('not_authorized');
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext _) => BlocProvider.value(
                      value: BlocProvider.of<InstaPicCubit>(context),
                      child: AddPost(),
                    ),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
            body: _buildPostList(),
          );
        },
      ),
    );
  }
}
