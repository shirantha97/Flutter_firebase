import 'package:brew_crew/screens/home/quote_tile.dart';
import 'package:brew_crew/screens/models/quotes.dart';
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
    final quotes = Provider.of<List<Quotes>>(context) ?? [];
    // quotes.forEach((quote) {
    //   print(quote.quote);
    //   print(quote.author);
    // });
    return ListView.builder(
      itemCount: quotes.length,
      itemBuilder: (context,index){
        return QuoteTile(quote: quotes[index]);
      },
      
    );
  }
}