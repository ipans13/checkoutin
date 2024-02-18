import 'package:checkoutin/bloc/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login/login_bloc.dart';
import 'login_page.dart';
import '../components/loading.dart';
import 'buttom_bar.dart';
import '../components/error_message.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context,state){
      if (state is RegisterInitial) {
        return LoginPage();
      }else if(state is RegisterLoadingState){
        return LoadingIndicator();
      }else if(state is RegisterSuccessState){
        return Text(state.message);
      }else if (state is RegisterErrorState){
        return ErrorMessage(message: state.error);
      }else{
      return Container();
      }
    });
  }
}