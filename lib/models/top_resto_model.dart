import 'package:cloud_firestore/cloud_firestore.dart';

class TopRestoModel {
  String name;
  String image;

  TopRestoModel({
    required this.name,
    required this.image,
  });

  factory TopRestoModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TopRestoModel(
      name: data['name'],
      image: data['image'],
    );
  }
}
