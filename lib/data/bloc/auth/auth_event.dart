abstract class  AuthEvent{}

class AuthRequest extends AuthEvent{
  String email;
  String password;
  String confirmpass;
  bool login;
  AuthRequest(this.confirmpass,this.login,this.email,this.password);
}