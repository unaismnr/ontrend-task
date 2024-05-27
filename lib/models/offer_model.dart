import 'package:cloud_firestore/cloud_firestore.dart';

class OfferModel {
  String title;
  String image;
  String originalPrice;
  String offerPrice;

  OfferModel({
    required this.title,
    required this.image,
    required this.originalPrice,
    required this.offerPrice,
  });

  factory OfferModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return OfferModel(
      title: data['title'],
      image: data['image'],
      originalPrice: data['originalPrice'],
      offerPrice: data['offerPrice'],
    );
  }
}
