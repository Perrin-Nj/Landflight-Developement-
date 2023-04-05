import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String id;
  final String description;
  final String imageUrl;
  final String datePost;
  final String titre;
  final int likes;
  final String agenceId;
  Post(
      {this.id = "AE",
      required this.datePost,
      required this.description,
      this.imageUrl="",
      this.titre = "po",
      required this.likes,
      required this.agenceId});

  Map<String, dynamic> toJson() => {
        'datePost': '$datePost',
        'description': description,
        'id': id,
        'imageUrl': imageUrl,
        'titre': titre,
        'likes': likes,
        'agenceId': agenceId
      };

  static Post fromJson(Map<String, dynamic> json) => Post(
      datePost: json['datePost'],
      description: json['description'],
      id: json['id'],
      imageUrl: json['imageUrl'],
      titre: json['titre'],
      likes: json['likes'],
      agenceId: json['agenceId']);

  static Stream<QuerySnapshot> getAllPosts() {
    return FirebaseFirestore.instance.collection('post').snapshots();
  }

  //static Stream<List<Agence>>
}
