import 'package:brew_crew/screens/models/quotes.dart';
import 'package:flutter/material.dart';

class AuhtorTile extends StatelessWidget {
  final Quotes quote;

  AuhtorTile({this.quote});

  @override
  Widget build(BuildContext context) {

    // final quotes = Provider.of<List<Quotes>>(context) ?? [];
    // User user = Provider.of<User>(context);

    return GestureDetector(
        onTap: () async{
          print("on tap invoked");    
          // Navigator.pushNamed(
          //   context,
          //   '/quotes',
          //   arguments: quotes,
          // );
        },
        child: Container(
        height: 130.0,
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            margin:EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0) ,
            
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage("Assets/Images/quote.jpg"),
              ),
              title: Text(
                quote.author,
                style: TextStyle(fontSize: 20.0),
                maxLines: 5,
              ) ,
            ),
            ),
        ),
      ),
    );
  }
}