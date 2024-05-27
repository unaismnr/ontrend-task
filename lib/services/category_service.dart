import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ontrend_task/models/category_model.dart';

class CategoryService {
  final categories = FirebaseFirestore.instance.collection(
    'categories',
  );

  Stream<List<CategoryModel>> fecthCategories() {
    return categories.snapshots().map((snapshot) {
      return snapshot.docs
          .map(
            (doc) => CategoryModel.fromDocument(doc),
          )
          .toList();
    });
  }
}
