import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoppingapp/until/exception.dart';

abstract class  IAuthenticationDatasource{
  Future<void> register(String email,String password,String passconfirm);
  Future<void> login(String email,String password);
}

class AuthenticationRemote implements IAuthenticationDatasource{
  @override
  Future<void> login(String email,String password) async{
    try{
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(ex){
      throw expention(ex.message.toString());
    }
  }
  @override
  Future<void> register(String email, String password, String passconfirm) async{
    try{
      if(passconfirm == password) {
        final response = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      }else{
        throw expention('password is not correct');
      }
    }on FirebaseAuthException catch (ex){
      throw expention(ex.message.toString());
    }
  }


}