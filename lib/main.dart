import 'package:brew_crew/screens/home/author_list.dart';
import 'package:brew_crew/screens/home/quotes_list.dart';
import 'package:brew_crew/screens/models/user.dart';
import 'package:brew_crew/screens/services/auth.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
        home: Wrapper(),
        routes: <String, WidgetBuilder>{
          '/quotes': (context) => QuoteList(),
          '/authors': (context) => AuthorList()
        },
      ),
    );
  }
}


  