import 'package:brew_crew/screens/home/author_tile.dart';
import 'package:brew_crew/screens/models/quotes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AuthorList extends StatefulWidget {
  @override
  _AuthorListState createState() => _AuthorListState();
}

class _AuthorListState extends State<AuthorList> {
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
        return AuhtorTile(quote: quotes[index]);
        
      },
      // scrollDirection: Axis.vertical,
      
    );
  }
}