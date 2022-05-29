import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wefiwebu_2/model/lostnfound_prod.dart';

class LostProdService {
  final FirebaseFirestore _firebaseFire = FirebaseFirestore.instance;
  Stream<List<LostnfoundData>> getlnfProd() {
    return _firebaseFire.collection("lostnfound").snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => LostnfoundData.fromSnapShot(doc))
          .toList();
    });
  }

  Future<void> addlnfProduct(LostnfoundData lnfprod) {
    return _firebaseFire.collection('lostnfound').add(lnfprod.toMap());
  }
}
