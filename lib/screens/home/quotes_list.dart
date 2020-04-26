import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  @override
  Widget build(BuildContext context) {
    final quotes = Provider.of<QuerySnapshot>(context);
    print(quotes.documents);
    for(var doc in quotes.documents){
      print(doc.data);
    }
    return Container(
      
    );
  }
}