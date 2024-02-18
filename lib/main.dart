import 'package:checkoutin/bloc/produk/produk_bloc.dart';
import 'package:checkoutin/bloc/profil/profil_bloc.dart';
import 'package:checkoutin/bloc/register/register_bloc.dart';
import 'package:checkoutin/bloc/wishlist/wishlist_bloc.dart';
import 'package:checkoutin/layout/register_page.dart';
import 'package:checkoutin/repository/produk_repository.dart';
import 'package:checkoutin/repository/register_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkoutin/repository/login_repository.dart';
import 'bloc/login/login_bloc.dart';
import 'layout/home_page.dart';
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple, // Mengatur warna utama aplikasi
      ),
      home: SplashScreen(),
    ),
  );
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
        providers: [
          RepositoryProvider(
            create: (context) => LoginRepository(),
          ),
          RepositoryProvider(create: (context) => RegisterRepository()
          ),
          RepositoryProvider(create: (context) => ProdukRepository()
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
            LoginBloc(loginRepository: context.read<LoginRepository>())
            ..add(const InitLogin()),
            ),
            BlocProvider(create: (context) =>
            RegisterBloc(registerRepository: context.read<RegisterRepository>())
            ),
            BlocProvider(create: (context)=> ProfilBloc(loginRepository: context.read<LoginRepository>())
            ),
            BlocProvider(create: (context)=> ProdukBloc(produkRepository: context.read<ProdukRepository>())
            ),
            BlocProvider(create: (context)=> WishlistBloc(produkRepository: context.read<ProdukRepository>())
            ),
          ],
          child: 
          MaterialApp(
          home:
          HomePage()
          )
          
        ),
      );
   


    // Future.delayed(Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => LoginPage()),
    //   );
    // });

    // return Scaffold(
    //   body: Center(
    //     child: Image.asset('lib/images/logo.png',
    //     height: 100,
    //     width: 100,
    //     ), 
    //   ),
    // );
  }
}