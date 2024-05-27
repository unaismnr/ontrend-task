import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String category;
  String image;

  CategoryModel({
    required this.category,
    required this.image,
  });

  factory CategoryModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CategoryModel(
      category: data['category'],
      image: data['image'],
    );
  }
}
