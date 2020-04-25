import 'package:brew_crew/screens/services/auth.dart';
import 'package:brew_crew/shared/load.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constant.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});
  
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';
  String hint = 'Email';
  bool load = false;
  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return load ? Load() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign Up'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            }, 
            icon: Icon(Icons.person),
            label: Text('Sign In')
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal:50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:hint),
                validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0), 
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText:'Password'),
                validator: (val) => val.length<6 ? 'must be more than 6 characters' : null,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.brown[300],
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    setState(() {
                      load = true;
                    });
                    dynamic result = await _auth.registerwithEmail(email, password);
                    print(result);
                    if(result == null){
                      setState(() {
                        error = 'Please enter a valid email';
                        load = false;
                      });
                    }
                    print(email);
                    print(password);
                  }
                },
              ),
              SizedBox(height: 20.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
   
  }
}