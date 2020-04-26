import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constant.dart';

class UpdateForm extends StatefulWidget {
  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  final _formKey = GlobalKey<FormState>();
  String _currentQuote;
  String _currentAuthor;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.6,
        maxChildSize: 1.0,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text("Enter quotes", style: TextStyle(fontSize: 20.0)),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a quote' : null,
                    onChanged: (val) {
                      setState(() {
                        _currentQuote = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter the author' : null,
                    onChanged: (val) {
                      setState(() {
                        _currentAuthor = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                      color: Colors.brown[300],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {})
                ],
              ),
            ),
          );
        });
    // return Form(
    //   key: _formKey,
    //   child: Column(
    //     children: <Widget>[
    //       Text(
    //         'Update your brew settings.',
    //         style: TextStyle(fontSize: 18.0),
    //       ),
    //       SizedBox(height: 20.0),
    //       TextFormField(
    //         decoration: textInputDecoration,
    //         validator: (val) => val.isEmpty ? 'Please enter a name' : null,
    //         onChanged: (val) => setState(() => _currentName = val),
    //       ),
    //       SizedBox(height: 10.0),
    //       DropdownButtonFormField(
    //         value: _currentSugars ?? '0',
    //         decoration: textInputDecoration,
    //         items: sugars.map((sugar) {
    //           return DropdownMenuItem(
    //             value: sugar,
    //             child: Text('$sugar sugars'),
    //           );
    //         }).toList(),
    //         onChanged: (val) => setState(() => _currentSugars = val ),
    //       ),
    //       SizedBox(height: 10.0),
    //       RaisedButton(
    //         color: Colors.pink[400],
    //         child: Text(
    //           'Update',
    //           style: TextStyle(color: Colors.white),
    //         ),
    //         onPressed: () async {
    //           print(_currentName);
    //           print(_currentSugars);
    //           print(_currentStrength);
    //         }
    //       ),
    //     ],
    //   ),
    // );
  }
}
