import 'package:checkoutin/bloc/login/login_bloc.dart';
import 'package:checkoutin/bloc/profil/profil_bloc.dart';
import 'package:checkoutin/layout/about_page.dart';
import 'package:checkoutin/layout/profiledit_form.dart';
import 'package:flutter/material.dart';
import 'package:checkoutin/user.dart';
import '../components/loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './profiledit_page.dart';

class ProfilePage extends StatelessWidget {
  final List profil;
  final Function refreshData;
  ProfilePage({ required this.profil, required this.refreshData});

  @override
  Widget build(BuildContext context) {
    final Map infoProfil = profil[0];
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                       border: Border(bottom: BorderSide(color:Colors.black.withOpacity(0.3) ))
                      ),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                    ClipOval(
                      child: Image.asset('lib/images/user.png',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                      
                      ),
                      
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 45),
                        Text(infoProfil['data']['nama'], style: const TextStyle(fontSize: 18),),
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => EditProfile(previousText: infoProfil['data']['nama'], indexchange: 0,))));
                        }, icon: const Icon( Icons.mode_sharp), iconSize: 18,)
                      ],
                    )
                      ]
                    )
                    )
                  ],
                ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color:Colors.black.withOpacity(0.3) ))
                    
                  ),
                  padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: const Text('Nomer Telepon'),
                    ),
                    Expanded(child:
                    InkWell(
                      onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: ((context) => EditProfile(previousText: infoProfil['data']['no_telp'], indexchange: 1,))));
                      },
                      child:
                    TextField(
                      enabled: false,
                        decoration: InputDecoration(
                          hintText: infoProfil['data']['no_telp'],
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                          ),
                          suffixIcon: const Icon(Icons.mode_edit, color: Colors.black, size: 18,),
                          hintStyle:const  TextStyle(color:Colors.black)
                        ),
                      ),
                    )
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child:const Text('Alamat'),
                    ),
                    Expanded(child:
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => EditProfile(previousText: infoProfil['data']['alamat'], indexchange: 2,))));
                      },
                      child:
                    TextField(
                      enabled: false,
                        decoration: InputDecoration(
                          hintText: infoProfil['data']['alamat'],
                          disabledBorder:const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                          ),
                          suffixIcon:const Icon(Icons.mode_edit, color: Colors.black, size: 18,),
                          hintStyle:const TextStyle(color:Colors.black)
                        ),
                      ),
                    )
                    )
                  ],
                ),
                  ],

                )                
                ),
                Container(
                  child: InkWell(
                      onTap: (){
                        
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => About())));
                      },
                      child: const TextField(
                      enabled: false,
                        decoration: InputDecoration(
                          hintText: 'About',
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                          ),
                          prefixIcon: Icon(Icons.info, color: Colors.black45, size: 18,),
                          hintStyle: TextStyle(color:Colors.black87)
                        ),
                      ),
                    )

                  ),
                  Container(
                  child: InkWell(
                      onTap: (){
                        
                        context.read<LoginBloc>().add(const ProsesLogout());
                      },
                      child: const TextField(
                      enabled: false,
                        decoration: InputDecoration(
                          hintText: 'Logout',
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                          ),
                          prefixIcon: Icon(Icons.logout, color: Colors.black45, size: 18,),
                          hintStyle: TextStyle(color:Colors.black87)
                        ),
                      ),
                    )

                  )
            ],
          ),
        );
}
}

