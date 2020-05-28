import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // Collection Reference
  final CollectionReference conversationCollection =
      Firestore.instance.collection('persons');

  Future<void> updateUserData(String name) async {
    return await conversationCollection.document(uid).setData({'Name': name});
  }

  // Get Persons Stream
  Stream<QuerySnapshot> get persons {
    return conversationCollection.snapshots();
  }
}
