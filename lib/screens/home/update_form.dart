import 'package:brew_crew/screens/models/user.dart';
import 'package:brew_crew/screens/services/database.dart';
import 'package:brew_crew/shared/load.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constant.dart';
import 'package:provider/provider.dart';

class UpdateForm extends StatefulWidget {
  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {

  final _formKey = GlobalKey<FormState>();
  String _currentQuote = '';
  String _currentAuthor = '';
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData = snapshot.data;
          return Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Text(
                'Update your Quotes',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration,
                initialValue: userData.quote,
                validator: (val) => val.isEmpty ? 'Please enter a quote' : null,
                onChanged: (val) => setState(() => _currentQuote = val),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration,
                initialValue: userData.author,
                validator: (val) => val.isEmpty ? 'Please enter author' : null,
                onChanged: (val) => setState(() => _currentAuthor = val),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.brown[200],
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    await DatabaseService(uid: user.uid).updateUserData(
                      _currentQuote ?? userData.quote , 
                      _currentAuthor ?? userData.author
                    );
                    Navigator.pop(context);
                  }else{
                    setState(() {
                      _autoValidate = true;
                    });
                  }            
                }
              ),
            ],
          ),
        );
        }else{
          Load();
        }
        return Container();
      }
    
    );
  }
}
