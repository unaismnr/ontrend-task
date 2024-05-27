import 'package:cloud_firestore/cloud_firestore.dart';

class RestoExploreModel {
  String name;
  String image;
  String price;
  String place;

  RestoExploreModel({
    required this.name,
    required this.image,
    required this.price,
    required this.place,
  });

  factory RestoExploreModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return RestoExploreModel(
      name: data['name'],
      image: data['image'],
      price: data['price'],
      place: data['place'],
    );
  }
}
