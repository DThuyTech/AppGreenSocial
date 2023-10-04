import 'package:either_dart/either.dart';

abstract class Authsate{}

class AuthStateLoading extends Authsate{}
class AuthStateInitiate extends Authsate{}
class SignUpResponsestate extends Authsate{
  Either<String,String> SignUp;
  SignUpResponsestate(this.SignUp);
}
class LoginResponseState extends Authsate{
  Either<String,String> login;
  LoginResponseState(this.login);
}