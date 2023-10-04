import 'package:either_dart/either.dart';
import 'package:shoppingapp/data/datasource/auth_firebase.dart';
import 'package:shoppingapp/until/exception.dart';

abstract class IAuthenticationRepository{
  Future<Either<String,String>> Register(String email,String password,String passconfirm);
  Future<Either<String,String>> Login(String email,String password);
}

class AuthenticationRepository extends IAuthenticationRepository{
  final AuthenticationRemote _dataSource = AuthenticationRemote();
  @override
  Future<Either<String, String>> Login(String email, String password) async {
    // TODO: implement Login
    try{
        await _dataSource.login(email, password);
        return Right('wellcome');
    }on expention catch(ex){
      return Left(ex.message ?? '');
    }
  }

  @override
  Future<Either<String, String>> Register(String email, String password, String passconfirm) async {
    // TODO: implement Register
    try{
      await _dataSource.register(email, password, passconfirm);
      return Right('Register Done');

    }on expention catch(ex){
      return Left(ex.message ?? '');
    }
  }
}