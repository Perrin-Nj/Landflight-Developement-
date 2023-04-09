import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
 final  String id;
  final String description;
  final String imageUrl;
  final DateTime datePost;
  final String titre;
  final int likes;
  final String agenceId;
  final List comments;
  final int nberComments;
  bool hasLiked;
  Post({
    required this.id,
    required this.datePost,
    required this.description,
    this.imageUrl = "",
    this.titre = "po",
    required this.likes,
    required this.agenceId,
    required this.comments,
    this.nberComments = 0,
    this.hasLiked = false, 
  });

  Map<String, dynamic> toJson() => {
        'datePost': '$datePost',
        'description': description,
        'id': id,
        'imageUrl': imageUrl,
        'titre': titre,
        'likes': likes,
        'agenceId': agenceId,
        'comments': comments,
      };

  static Post fromJson(Map<String, dynamic> json) => Post(
        datePost: json['datePost'],
        description: json['description'],
        id: json['id'],
        imageUrl: json['imageUrl'],
        titre: json['titre'],
        likes: json['likes'],
        agenceId: json['agenceId'],
        comments: json['comments'],
      );

  static Stream<QuerySnapshot> getAllPosts() {
    return FirebaseFirestore.instance.collection('post').snapshots();
  }

  //static Stream<List<Agence>>
}
