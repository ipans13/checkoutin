import 'package:checkoutin/bloc/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login/login_bloc.dart';
import 'login_page.dart';
import '../components/loading.dart';
import 'buttom_bar.dart';
import '../components/error_message.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context,state){
      if (state is LoginInitial) {
        return LoginPage();
      }else if(state is LoginLoading || state is RegisterLoadingState){
        return LoadingIndicator();
      }else if(state is LoginSuccess){
        return MainMenu(sessionToken: state.sessionToken);
      }else if (state is LoginFailure){
        return ErrorMessage(message: state.error);
      }else{
      return Container();
      }
    });
  }
}