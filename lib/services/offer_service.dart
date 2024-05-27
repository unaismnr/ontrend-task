import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ontrend_task/models/offer_model.dart';

class OfferService {
  final categories = FirebaseFirestore.instance.collection(
    'offers',
  );

  Stream<List<OfferModel>> fecthOffer() {
    return categories.snapshots().map((snapshot) {
      return snapshot.docs
          .map(
            (doc) => OfferModel.fromDocument(doc),
          )
          .toList();
    });
  }
}
