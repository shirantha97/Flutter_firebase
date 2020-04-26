import 'package:brew_crew/screens/home/quotes_list.dart';
import 'package:brew_crew/screens/home/update_form.dart';
import 'package:brew_crew/screens/models/quotes.dart';
import 'package:brew_crew/screens/services/auth.dart';
import 'package:brew_crew/screens/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {

    void showUpdatePanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          color: Colors.brown[100],
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: UpdateForm(),
        );
      });
    }

    return StreamProvider<List<Quotes>>.value(
        value: DatabaseService().quotes,
        child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Quotes'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                showUpdatePanel();
              },
              icon: Icon(Icons.update), 
              label: Text('Update')
            ),
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              }, 
              icon: Icon(Icons.person), 
              label: Text('Log Out')
            ),
            
          ],
          ),
          body: QuoteList(),
        ),
    );
  }
}