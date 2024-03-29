import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:landflight/components/comment_popup.dart';
import 'package:landflight/components/showCommentPopUp.dart';
import 'package:landflight/controller/ControllerComment.dart';
import 'package:landflight/controller/LikePostController.dart';
import 'package:landflight/utils/theme.dart';
import 'package:landflight/vues/home/homepage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dynamic_extension.dart';
import '../models/agence.dart';
import '../models/post.dart';
import 'comment_list.dart';
import 'package:intl/intl.dart';

class CardPost extends StatefulWidget {
  Post monPost;
  Agence monAgence;

  CardPost({
    Key? key,
    required this.monPost,
    required this.monAgence,
  }) : super(key: key);

  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  var likedPosts = [];

  @override
  void initState() {
    super.initState();
    /* _loadSavedPrefsData();*/

    final User? CurrentUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('user')
        .doc(CurrentUser!.uid)
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      likedPosts = documentSnapshot.data()['likedPosts'];
      widget.monPost.hasLiked = likedPosts.contains(widget.monPost.id);
      setState(() {});
    });
  }

  int i = 0;
  /*Future<void> _loadSavedPrefsData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _hasLiked = prefs.getBool('hasLiked') ?? false;
    });
  }

  Future<void> _savePrefsData(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasLiked', value);
  }
*/
  @override
  Widget build(BuildContext context) {
    //CommentPopup.staticPostUid = widget.monPost.id;
    final comment = context.watch<CommentController>();
    LikePostController.like = widget.monPost.likes;
    final postLikes = Provider.of<LikePostController>(context);
    LikePostController.staticPostUid = widget.monPost.id;
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;

    int postedDifference =
        DateTime.now().difference(widget.monPost.datePost).inHours;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(
        top: 6,
        left: 8,
        right: 8,
      ),
      width: widht,
      height: 300,
      decoration: BoxDecoration(
          color: GREENlIGTH_COLOR, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // width: widht,
            //color: PRIMARY_COLOR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  onBackgroundImageError: (exception, stackTrace) {
                    Image.asset("assets/images/image 30.png");
                  },
                  radius: 25,
                  backgroundImage: NetworkImage(
                    widget.monAgence.profileUrl,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.monAgence.nom,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: FONT_COLOR,
                              fontSize: 14,
                              fontFamily: "Bold"),
                        ),
                        postedDifference == 0 || postedDifference == 1
                            ? const Text(
                                "il y’a moins d'une heure",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: FONT_COLOR,
                                    fontSize: 14,
                                    fontFamily: "Regular"),
                              )
                            : postedDifference < 25
                                ? Text(
                                    "il y’a $postedDifference heures",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: FONT_COLOR,
                                        fontSize: 14,
                                        fontFamily: "Regular"),
                                  )
                                : const Text(
                                    "il y’a plus d'un jour",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: FONT_COLOR,
                                        fontSize: 14,
                                        fontFamily: "Regular"),
                                  ),
                      ],
                    ),
                  ),
                ),
                Container(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("message"),
                                    //  content: Text("Would you like to continue learning how to use Flutter alerts?"),
                                    actions: [
                                      TextButton(
                                        child:
                                            const Text("Voir les commentaires"),
                                        onPressed: () {
                                          Navigator.of(context).pop();

                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) => CommentList(
                                                postID: widget.monPost.id,
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.more_vert)),
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 8,
              right: 8,
            ),
            child: Text(
              widget.monPost.description,
              style: TextStyle(
                  color: FONT_COLOR, fontSize: 14, fontFamily: "Regular"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 8,
              right: 8,
            ),
            child: Container(
              height: 95,
              width: widht,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: widget.monPost.imageUrl != ""
                      ? NetworkImage(
                          widget.monPost.imageUrl,
                        )
                      : NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/landflight-backend.appspot.com/o/error%2FerrorImage.jpg?alt=media&token=bb9481d9-7464-4cbc-b99f-8a14c4b78fbc",
                        ),
                  onError: (exception, stackTrace) {
                    Image.asset("assets/images/error.png");
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 8,
              right: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${widget.monPost.likes} Likes',
                    style: const TextStyle(
                        color: FONT_COLOR, fontSize: 14, fontFamily: "Light")),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => CommentList(
                          postID: widget.monPost.id,
                        ),
                      ),
                    );
                  },
                  child: Text("${widget.monPost.nberComments} commentaires",
                      style: const TextStyle(
                          color: FONT_COLOR,
                          fontSize: 14,
                          fontFamily: "Light")),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 6,
              left: 8,
              right: 8,
            ),
            child: Divider(
              color: Color.fromRGBO(86, 134, 145, 1),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                top: 6,
                left: 8,
                right: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.monPost.hasLiked == false &&
                          likedPosts.contains(widget.monPost.id)
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                const Tooltip(
                                  message:
                                      "Vous avez déjà aimé ce post, modifiez votre choix dans la page des favoris.",
                                );
                              },
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              "Déjà aimé",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontFamily: "Light"),
                            )
                          ],
                        )
                      : Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (!widget.monPost.hasLiked ||
                                    !likedPosts.contains(widget.monPost.id)) {
                                  context
                                      .read<LikePostController>()
                                      .onClickLike();

                                  setState(() {
                                    widget.monPost.hasLiked = postLikes.isLiked;
                                  });

                                  //Update likes in post collection
                                  final docUser = FirebaseFirestore.instance
                                      .collection("post")
                                      .doc(widget.monPost.id);

                                  int total_likes = postLikes
                                      .incrementLike(widget.monPost.id);

                                  docUser.update({
                                    'likes': total_likes,
                                  });
                                }
                                // print("Like = ${postLikes.isLiked}");
                                //print("prefsLike = $_hasLiked");

                                //updatePost in the userID

                                //  print(userId);
                              },
                              child: widget.monPost.hasLiked ||
                                      likedPosts.contains(widget.monPost.id)
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(Icons.favorite_border),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            widget.monPost.hasLiked ||
                                    likedPosts.contains(widget.monPost.id)
                                ? const Text(
                                    "Déjà aimée",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontFamily: "Light"),
                                  )
                                : const Text(
                                    "Likes",
                                    style: TextStyle(
                                        color: FONT_COLOR,
                                        fontSize: 14,
                                        fontFamily: "Light"),
                                  ),
                          ],
                        ),
                  GestureDetector(
                    onTap: () {
                      context.read<CommentController>().open();
                      if (comment.iscomment) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ShowCommentPopUp(
                              postID: widget.monPost.id,
                            ),
                          ),
                        );
                      }
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.comment_outlined),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Commenter",
                          style: TextStyle(
                              color: FONT_COLOR,
                              fontSize: 14,
                              fontFamily: "Light"),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
