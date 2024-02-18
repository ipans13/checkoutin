import 'package:checkoutin/bloc/profil/profil_bloc.dart';
import 'package:checkoutin/components/loading.dart';
import 'package:checkoutin/layout/profiledit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class EditForm extends StatelessWidget {
final String previousText;
final int indexchange;
  const EditForm({super.key, required this.indexchange, required this.previousText});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilBloc, ProfilState>(
      builder: (context, state) {
        if(state is EditInitialState){
          return EditProfile(previousText: previousText, indexchange: indexchange);
        }  else if(state is ProfilLoadingState){
          return LoadingIndicator();
        }else if(state is EditSuccessState){
          return Text(state.message);
        }
        else{
          return Container();
        }
      },
    );
  }
}