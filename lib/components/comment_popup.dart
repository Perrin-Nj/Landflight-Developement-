import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:landflight/controller/ControllerComment.dart';
import 'package:landflight/utils/theme.dart';
import 'package:landflight/vues/home/homepage.dart';
import 'package:provider/provider.dart';

class CommentPopup extends StatefulWidget {
  String postID;

  CommentPopup({Key? key, required this.postID}) : super(key: key);

  @override
  State<CommentPopup> createState() => _CommentPopupState();
}

class _CommentPopupState extends State<CommentPopup> {
  final commentPostController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    commentPostController.dispose();
  }

  void _addNewComment(String comment, var postID) {
    if (comment != "" || comment.isNotEmpty) {
      final docPost = FirebaseFirestore.instance.collection("post").doc(postID);
      docPost.update({
        'comments': FieldValue.arrayUnion([comment]),
      });

      SmartDialog.showToast("Chargement...",
          displayTime: const Duration(seconds: 1));
      context.read<CommentController>().close();
    } else {
      SmartDialog.showToast(
        "Aucun commenntaire ajouté",
        displayTime: const Duration(seconds: 1),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Container(
      height: 140,
      width: widht * .9,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: GREENlIGTH_COLOR,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {
                    context.read<CommentController>().close();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Icon(Icons.close))),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage('assets/images/image 30.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Container(
                        height: 31,
                        width: widht,
                        decoration: BoxDecoration(
                            color: GRAY_COLOR,
                            borderRadius: BorderRadius.circular(18)),
                        child: TextFormField(
                          onEditingComplete: () => _addNewComment(
                            commentPostController.text,
                            widget.postID,
                          ),
                          controller: commentPostController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            return inputValidator(value);
                          },
                          style: const TextStyle(
                              fontFamily: "Bold",
                              color: FONT_COLOR,
                              fontSize: 14),
                          textAlign: TextAlign.start,
                          onChanged: (value) {},
                          decoration: const InputDecoration(
                            focusColor: PRIMARY_COLOR,
                            // ]),
                            //suffixIcon: widget.suffixIcon,
                            contentPadding:
                                EdgeInsets.only(bottom: 18, top: 5, left: 10),
                            border: InputBorder.none,
                            // hintText: widget.hintText,
                            hintStyle: TextStyle(
                              fontFamily: "Bold",
                              color: FONT_COLOR,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Color.fromRGBO(86, 134, 145, 1),
                      ),
                    ],
                  ))
            ],
          ),
          GestureDetector(
            onTap: () {
              _addNewComment(
                commentPostController.text,
                widget.postID,
              );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Commenter",
                    style: TextStyle(
                        color: FONT_COLOR, fontSize: 14, fontFamily: "Light")),
                SizedBox(
                  width: 8,
                ),
                Icon(Icons.comment_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String? inputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return " ";
    }
    return null;
  }
}
