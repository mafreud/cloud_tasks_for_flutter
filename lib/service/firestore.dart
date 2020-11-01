import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createPost() async {
    String title = 'おはよう';
    String subtitle = 'めっちゃおはよう！';
    var data = {'title': title, 'subtitle': subtitle, 'expiresIn': 2};
    await _firestore.collection('posts').add(data);
  }

  Stream<QuerySnapshot> timelineStream() {
    return _firestore.collection('posts').snapshots();
  }
}
