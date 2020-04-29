import 'package:brew_crew/screens/models/quotes.dart';
import 'package:flutter/material.dart';

class QuoteTile extends StatelessWidget {
  final Quotes quote;
  QuoteTile({this.quote});

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 130.0,
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin:EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0) ,
          
          child: ListTile(
            onLongPress: (){},
            leading: CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage("Assets/Images/quote.jpg"),
            ),
            title: Text(
              quote.quote,
              maxLines: 5,
            ) ,
            // subtitle: Text(quote.author)
          ),
          ),
      ),
    );
  }
}