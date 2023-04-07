import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:landflight/components/card_post.dart';
import 'package:landflight/components/comment_popup.dart';
import 'package:landflight/components/search_popup.dart';
import 'package:landflight/controller/ControllerComment.dart';
import 'package:landflight/controller/MenuController.dart';
import 'package:landflight/controller/SearchController.dart';
import 'package:landflight/models/agence.dart';
import 'package:landflight/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:async/async.dart';

import '../../models/post.dart';
import '../../models/post.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool SearchOpen =
      false; // si la barre de recherche est devoiler par defaut il est fermer

  /* Stream<QuerySnapshot> agencyDocStream = FirebaseFirestore.instance
      .collection('agence')
      .doc('EbquQrjbwDD2maaK1gwo')
      .snapshots() as Stream<QuerySnapshot<Object?>>;*/

  @override
  Widget build(BuildContext context) {
    var docPostId;
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    final search = context.watch<SearchController>();
    final comment = context.watch<CommentController>();
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: widht,
        height: heigth,
        padding: EdgeInsets.only(bottom: 50),
        // color: Colors.amber,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  width: widht,
                  decoration: const BoxDecoration(
                      color: PRIMARY_COLOR,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: IconButton(
                      onPressed: () {
                        //  context.read<menuController>().controlMenu();
                      },
                      icon: const Icon(
                        Icons.menu,
                        size: 24,
                        color: WHITE_COLOR,
                      )),
                ),
                SizedBox(
                  height: 32,
                ),
                /*  Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Container(
                padding: EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                height: 100,
                width: widht,
                decoration: BoxDecoration(
                    color: GREENlIGTH_COLOR,
                    borderRadius: BorderRadius.circular(14)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage:
                              AssetImage('assets/images/image 30.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Container(
                                  height: 30,
                                  width: widht,
                                  decoration: BoxDecoration(
                                      color: GRAY_COLOR,
                                      borderRadius:
                                          BorderRadius.circular(18)),
                                  child: TextField(
                                      keyboardType: TextInputType.text,
                                      onTap: () {},
                                      onSubmitted: (_) {},
                                      style: const TextStyle(
                                          fontFamily: "Bold",
                                          color: FONT_COLOR,
                                          fontSize: 14),
                                      textAlign: TextAlign.start,
                                      onChanged: (value) {},
                                      decoration:  const InputDecoration(
                                          focusColor: PRIMARY_COLOR,
                                          // ]),
                                          //suffixIcon: widget.suffixIcon,
                                          contentPadding:
                                              EdgeInsets.only(
                                                  bottom: 18,
                                                  top: 5,
                                                  left: 10),
                                          border: InputBorder.none,
                                          // hintText: widget.hintText,
                                          hintStyle: TextStyle(
                                              fontFamily: "Bold",
                                              color: FONT_COLOR,
                                              fontSize: 14))),
                                ),
                                Divider(
                                  color: Color.fromRGBO(86, 134, 145, 1),
                                ),
                              ],
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_outline),
                        SizedBox(
                          width: 16,
                        ),
                        Icon(Icons.send_outlined)
                      ],
                    )
                  ],
                ),
              ),
            ),*/
                SizedBox(
                  height: 16,
                ),
                //-------------

                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: Post.getAllPosts(),
                    builder: (context, snapshot1) {
                      if (snapshot1.hasError) {
                        return Text(
                          "Désolé, Une erreur s'est produite:\n snap1Error : ${snapshot1.error} ",
                        );
                      }
                      if (snapshot1.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      /*  return StreamBuilder<QuerySnapshot>(
                      stream: agencyDocStream,
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> snapshot2) {
                        if (snapshot2.hasError || snapshot1.hasError) {
                          return Text(
                            "Désolé, Une erreur s'est produite:\n snap1Error : ${snapshot1.error} \n snap2Error: ${snapshot2.error}",
                          );
                        }
                        if (snapshot2.connectionState ==
                                ConnectionState.waiting ||
                            snapshot1.connectionState ==
                                ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ListView(
                          children: snapshot2.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            String name = data['nom'];
                            String profile = data['imageUrl'];

                            return Text(
                                'Data are displayed here...'); //CardPost()...
                          }).toList(),
                        );*/
                      // });
                      final List<DocumentSnapshot> documents =
                          snapshot1.data!.docs;

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          final DocumentSnapshot document = documents[index];
                          docPostId = document.id;
                          final Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          final String name = data['titre'] as String;
                          final String imageUrl = data['imageUrl'] as String;
                          final datePost = data['datePost'] as String;
                          final String description = data['description'];
                          final likes = data['likes'];
                          final String titre = data['titre'];
                          CardPost.staticNberComments = data["comments"].length;
                          final DocAgenceId = data['agenceId'] as String;
                          //final datePost = data['datePost'] as String;
                          return StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('agence')
                                .doc(DocAgenceId.trim())
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<DocumentSnapshot> snapshot2) {
                              if (snapshot2.hasError) {
                                return Text(
                                    "Désolé, une erreur s'est produite");
                              }

                              if (snapshot2.connectionState ==
                                  ConnectionState.waiting) {
                                return Visibility(
                                    visible: false,
                                    child: const CircularProgressIndicator());
                              }

                              var data2 = snapshot2.data!.data()
                                  as Map<String, dynamic>;
                              final String addresse =
                                  data2['addresse'] as String;
                              final String descriptionAgence =
                                  data2['description'] as String;
                              final int idAgence = data2['id'];
                              final String localisation =
                                  data2['localisation'] as String;
                              final String nomAgence = data2['nom'] as String;
                              final profilAgence =
                                  data2['profileUrl'] as String;

                              Agence monAgence = Agence(
                                nom: nomAgence,
                                description: descriptionAgence,
                                addresse: addresse,
                                localisation: localisation,
                                profileUrl: profilAgence,
                              );

                              return CardPost(
                                postDocId: docPostId,
                                monPost: Post(
                                  datePost: datePost,
                                  imageUrl: imageUrl,
                                  description: description,
                                  likes: likes,
                                  agenceId: DocAgenceId,
                                ),
                                monAgence: monAgence,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),

                  /*  child:
                
                Column(
                  children: List.generate(5, (index) => CardPost(post: ,)),
                )*/
                ),
                //----------
              ]),
            ),
            Positioned(
                top: 20,
                left: widht * .8,
                child: GestureDetector(
                  onTap: () {
                    search.open();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: WHITE_COLOR,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: const Icon(
                      Icons.search_outlined,
                      color: FONT_COLOR,
                    ),
                  ),
                )),
            const SizedBox(
              height: 16,
            ),
            if (search.isSearch)
              Align(
                alignment: Alignment.topCenter,
                child: SearchPoppUP(),
              ),
            if (comment.iscomment)
              Align(
                alignment: Alignment.topCenter,
                child: CommentPopup(),
              )
          ],
        ),
      )),
    );
  }
}
