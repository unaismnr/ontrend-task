import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ontrend_task/models/resto_explore_model.dart';

class RestoExploreService {
  final categories = FirebaseFirestore.instance.collection(
    'restoexplore',
  );

  Stream<List<RestoExploreModel>> fecthRestoExplore() {
    return categories.snapshots().map((snapshot) {
      return snapshot.docs
          .map(
            (doc) => RestoExploreModel.fromDocument(doc),
          )
          .toList();
    });
  }
}
