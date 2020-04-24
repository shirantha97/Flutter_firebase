import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/screens/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFireBaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
      .map((FirebaseUser user) => _userFromFireBaseUser(user));
  }

  Future signInAnon() async {
    try{
      AuthResult result =  await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      
      // String name;
      // String uid;
      // _auth.onAuthStateChanged
      //   .firstWhere((user) => user != null)
      //   .then((user) {
      //     name = user.displayName;
      //     uid = user.uid;
      // });
      // print(name);
      // print(uid);

      return _userFromFireBaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}