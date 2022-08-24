import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tikitiki/constants.dart';
import 'package:tikitiki/controllers/commentcontroller.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentView extends StatelessWidget {
  final String id;
  CommentView({
    Key? key,
    required this.id,
  }) : super(key: key);

  final TextEditingController _commentController = TextEditingController();
  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(id);

    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                      itemCount: commentController.comments.length,
                      itemBuilder: (context, index) {
                        final comment = commentController.comments[index];
                        return Row(
                          children: [
                            ClipOval(
                              child: Image.network(comment.profilePhoto),
                            ),
                            Row(
                              children: [
                                Text(
                                  "${comment.username}  ",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: CupertinoColors.systemRed,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  comment.comment,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: CupertinoColors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  timeago.format(
                                    comment.datePublished.toDate(),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: CupertinoColors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${comment.likes.length} likes',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: CupertinoColors.white,
                                  ),
                                )
                              ],
                            ),
                            CupertinoButton(
                              onPressed: () =>
                                  commentController.likeComment(comment.id),
                              child: Icon(
                                CupertinoIcons.heart,
                                size: 25,
                                color: comment.likes
                                        .contains(authController.user.uid)
                                    ? CupertinoColors.systemRed
                                    : CupertinoColors.white,
                              ),
                            ),
                          ],
                        );
                      });
                }),
              ),
              Container(
                height: 2.0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                color: CupertinoColors.inactiveGray,
              ),
              Row(
                children: [
                  CupertinoTextField(
                    controller: _commentController,
                    style: const TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.white,
                    ),
                    placeholder: 'Comment',
                    placeholderStyle: const TextStyle(
                      fontSize: 20,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () =>
                        commentController.postComment(_commentController.text),
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
