import 'package:flutter/material.dart';
import 'package:landflight/components/comment_popup.dart';

class ShowCommentPopUp extends StatefulWidget {
  final String postID;

  const ShowCommentPopUp({
    super.key,
    required this.postID,
  });

  @override
  State<ShowCommentPopUp> createState() => _ShowCommentPopUpState();
}

class _ShowCommentPopUpState extends State<ShowCommentPopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.2),
        body: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: CommentPopup(
              postID: widget.postID,
            ),
          ),
        ));
  }
}
