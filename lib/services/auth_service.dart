import 'package:firebase_auth/firebase_auth.dart';
import 'package:mothers_kitchen_chef/models/users.dart';
import 'package:mothers_kitchen_chef/services/database.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid): null;
  }
  Stream<User> get user {
    return _auth.onAuthStateChanged
//.map((FirebaseUser user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password)async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password:  password,);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password)async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password:  password,);
      FirebaseUser user = result.user;
      await DatabaseService(uid:user.uid).updateChefKitchenDataCollection(
          'chefName',
          'chefEmailAddress',
          'chefAltEmailAddress',
          'chefMobile',
          'chefAltMobile',
          'chefAddress',
          'chefLocationCoordinates',
          'chefAdhaarCard',
          'chefPanCard',
          'http://xaosity.com/pics/ComingSoon2-fnasafety.png',
          'chefBankName',
          'chefBankAccountNo',
          'chefIfscCode',
          'chefUpiId',
          'chefKitchenName',
          'http://xaosity.com/pics/ComingSoon2-fnasafety.png',
          'kitchenId',
          'chefGstNo',
          5,
          'dishName',
          'dishId',
          'dishDescription',
          'dishIngredients',
          100,
          'dishType',
          5,
          5,
          'http://xaosity.com/pics/ComingSoon2-fnasafety.png');
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut()async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}