import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ontrend_task/models/top_resto_model.dart';

class TopRestoService {
  final categories = FirebaseFirestore.instance.collection(
    'topresto',
  );

  Stream<List<TopRestoModel>> fecthTopResto() {
    return categories.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => TopRestoModel.fromDocument(doc))
          .toList();
    });
  }
}
