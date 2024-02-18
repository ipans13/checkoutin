import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkoutin/bloc/profil/profil_bloc.dart';
import './profil_page.dart';
import '../components/loading.dart';

class ProfilForm extends StatelessWidget {
  final List profil;
  final Function refreshData;

  ProfilForm({required this.profil, required this.refreshData});

  @override
  Widget build(BuildContext context) {
    final Map infoProfil = profil[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ProfilBloc, ProfilState>(
          builder: (context, state) {
            if (state is ProfilInitialState || state is ProfilLoadingState) {
              return LoadingIndicator();
            } else if (state is ProfilLoadState) {
              return ProfilePage(profil: [state.info],refreshData: refreshData,);
            } else {
              return Center(
                child: Text('Error: Gagal memuat profil'),
              );
            }
          },
        ),
      ),
    );
  }
}