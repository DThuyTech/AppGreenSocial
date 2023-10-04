import 'package:bloc/bloc.dart';
import 'package:shoppingapp/data/bloc/auth/auth_event.dart';
import 'package:shoppingapp/data/bloc/auth/auth_state.dart';

import '../../repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent,Authsate>{
  final IAuthenticationRepository _repository = AuthenticationRepository();
  AuthBloc():super(AuthStateInitiate()){
    on<AuthRequest>((event,emit ) async{
      if(event.login){
      var loginResponse= await _repository.Login(event.email, event.password);
      emit(LoginResponseState(loginResponse));
    }else {
        var SignupResponse = await _repository.Register(
            event.email, event.password, event.confirmpass);
        emit(SignUpResponsestate(SignupResponse));
      }
    });
  }
}