import 'package:checkoutin/bloc/wishlist/wishlist_bloc.dart';
import 'package:checkoutin/bloc/produk/produk_bloc.dart';
import 'package:checkoutin/layout/profil_form.dart';
import '../components/loading.dart';
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkoutin/layout/dashboard_page.dart';
import 'package:checkoutin/layout/wishlist_page.dart';
import 'package:checkoutin/layout/profil_page.dart';
import '../bloc/profil/profil_bloc.dart';
class MainMenu extends StatefulWidget {
  const MainMenu({required sessionToken});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }
  late PageController pageController;
  @override
void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }
  void refreshData() {
    BlocProvider.of<ProdukBloc>(context).add(LoadListProdukEvent(keyword: ''));
    
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.home, color: Colors.deepPurple),
          Icon(Icons.favorite, color: Colors.deepPurple),
          Icon(Icons.person, color: Colors.deepPurple),
        ],
        inactiveIcons: const [
          
          Text("Home"),
          Text("Wishlist"),
          Text("My"),
        ],
        color: Colors.white,
        height: 60,
        circleWidth: 60,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          pageController.jumpToPage(tabIndex);
        },
        //padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
          // bottomRight: Radius.circular(24),
          // bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.deepPurple,
        elevation: 10,
      ),
      body: PageView(

        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: <Widget>[
        BlocBuilder<ProdukBloc, ProdukState>(
        builder: (context, state) {
          if (state is ProdukInitial) {
            // Jika state awal, kirim event untuk memuat data produk
            BlocProvider.of<ProdukBloc>(context).add(LoadListProdukEvent(keyword: ''));
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProdukLoadingState) {
            
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ListProdukState) {
            return HomePage(listProduk: state.produk, searchText: state.searchText);
          } else if (state is ProdukErrorState) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          } else {
            return Container();
          }
        },
),
         BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistInitial) {
            // Jika state awal, kirim event untuk memuat data produk
            BlocProvider.of<WishlistBloc>(context).add(LoadWishListEvent());
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WishlistLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadWishState) {
            return WishListPage(produklist: state.produk);
          } else if (state is WishNotFoundState) {
            return Center(
              child: Text(state.Message),
            );
          } else {
            return Container();
          }
        }
         ),

         BlocBuilder<ProfilBloc, ProfilState>(builder: (context, state){
           if (state is ProfilInitialState) {
            BlocProvider.of<ProfilBloc>(context).add(GetProfilEvent());
          return LoadingIndicator();
        }else if(state is ProfilLoadingState){
          return LoadingIndicator();
        } else if(state is ProfilLoadState){
          return ProfilForm(profil: [state.info], refreshData: refreshData);
        } else{
          return Container();
        }
         })
        ],
      ),
      
    );
    
  
  }
}