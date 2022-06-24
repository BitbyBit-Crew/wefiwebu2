import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MarketplaceContoller extends GetxController {
  Future queryData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('marketplace')
        .where('Product Name', isGreaterThanOrEqualTo: queryString)
        .get();
  }
}
