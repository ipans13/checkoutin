import 'package:checkoutin/bloc/profil/profil_bloc.dart';
import 'package:checkoutin/layout/about_page.dart';
import 'package:flutter/material.dart';
import 'package:checkoutin/user.dart';
import '../components/loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatelessWidget {
  final String previousText;
  final int indexchange;
  EditProfile({required this.previousText,required this.indexchange});
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = previousText;
    String label = indexchange == 0 ? 'Nama' : indexchange == 2 ? 'Alamat' : indexchange == 1 ? 'Nomer Telepon' : '';
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
        backgroundColor: Colors.purple,
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: label,
                border:const OutlineInputBorder(),
              ),
            ),
           const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
indexchange == 0 ? 

context.read<ProfilBloc>().add(EditProfilEvent(nama: nameController.text))
 : indexchange == 2 ? 
 context.read<ProfilBloc>().add(EditProfilEvent(alamat: nameController.text))
 : 
 indexchange == 1 ? 
 context.read<ProfilBloc>().add(EditProfilEvent(nohp: nameController.text)):''; 
 LoadingIndicator();
 context.read<ProfilBloc>().add(GetProfilEvent());
  Navigator.of(context).pop();
              },
              child:const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
