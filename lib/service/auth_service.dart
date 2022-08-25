import 'package:cryptocurrency_tracker/model/users.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AUthService{

  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  UserModal? _userFromFirebase(User? user)
  {
    if(user==null)
      {
        return null;
      }
    else{
      return UserModal(uid: user.uid, email: user.email);
    }
  }

  Stream<UserModal?> get user{
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }
  
  Future<UserModal?> createWithEmailandPass(String email,String password) async
  {
    final credentials=await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(credentials.user);
  }

  Future<UserModal?> signInwithEmailandPass(String email,String password) async{
    final credentials=await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(credentials.user);
  }

  Future<void> signOut() async{
    return _firebaseAuth.signOut();
  }

}