import 'package:cloud_firestore/cloud_firestore.dart';

class Agence {
  final String nom;
  final String description;
  final String addresse;
  final String id;
  final String localisation;
  final String profileUrl;

  Agence({
    required this.nom,
    required this.description,
    required this.addresse,
    this.id = "",
    required this.localisation,
    required this.profileUrl,
  });

  Map<String, dynamic> toJson() => {
        'nom': nom,
        'description': description,
        'id': id,
        'addresse': addresse,
        'localisation': localisation,
        'profileUrl': profileUrl,
      };

  static Agence fromJson(Map<String, dynamic> json) => Agence(
      description: json['description'],
      id: json['id'],
      addresse: json['addresse'],
      localisation: json['localisation'],
      profileUrl: json['profileUrl'],
      nom: json['nom']);

  static Stream<List<Agence>> getAllAgences() => FirebaseFirestore.instance
      .collection('agence')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Agence.fromJson(doc.data())).toList());
}
