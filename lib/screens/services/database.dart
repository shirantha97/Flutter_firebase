import 'package:brew_crew/screens/models/quotes.dart';
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

  List<Quotes> _quoteListfromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
        return Quotes(
          quote: doc.data['newQuote'] ?? '',
          author: doc.data['newAuthor'] ?? ''
        );
      }
    ).toList();
  }

  //stream to collect quotes
  Stream<List<Quotes>> get quotes{
    return quotesCollection.snapshots().map(_quoteListfromSnapshot);
  }

}