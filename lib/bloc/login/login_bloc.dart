import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:checkoutin/repository/login_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<InitLogin>(_initLogin);
    on<ProsesLogin>(_prosesLogin);
    on<ProsesLogout>(_prosesLogout);
  }
  _initLogin(InitLogin event, Emitter emit) async {
emit(LoginLoading());
final SharedPreferences prefs = await SharedPreferences.getInstance();
final String sessionToken = prefs.getString('session') ?? "";
if (sessionToken == "") {
  emit(LoginInitial());
} else {
  bool result = await loginRepository.checkSession(sessionToken);
  if (result == true) {
    emit(LoginSuccess(sessionToken: sessionToken));
  } else {
    emit(LoginInitial());
  }
}

  }
  _prosesLogin(ProsesLogin event, Emitter emit) async {
    String username = event.username;
    String password = event.password;

    emit(LoginLoading());
    Map res = await loginRepository.login(username: username, password: password);
    if (res['status'] == true) {
      emit(LoginSuccess(sessionToken: res['data']['session_token']));

    }else{
      emit(LoginFailure(error: 'Login Failed: ${res['data']['message']}'));
      emit(LoginInitial());
    }
  
  }
  _prosesLogout(ProsesLogout event, Emitter emit) async {

    emit(LoginLoading());
    await loginRepository.logout();
    emit(LoginInitial());
  }
}
