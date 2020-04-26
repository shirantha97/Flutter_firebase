import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  final CollectionReference quotesCollection =  Firestore.instance.collection('quotes');

  DatabaseService({this.uid});

  Future updateUserData(String quote, String author) async{
    return await quotesCollection.document(uid).setData(
      {
        quote : quote,
        author : author
      }
    );
  }

  //stream to collect quotes
  Stream<QuerySnapshot> get quotes{
    return quotesCollection.snapshots();
  }

}