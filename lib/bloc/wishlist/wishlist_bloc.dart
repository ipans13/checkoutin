import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:checkoutin/repository/produk_repository.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  ProdukRepository produkRepository;
  WishlistBloc({required this.produkRepository}) : super(WishlistInitial()) {
    on<LoadWishListEvent>(_loadWish);
  }
  _loadWish(LoadWishListEvent event, Emitter emit) async {
  emit(WishlistLoadingState());

   try {
       Map res = await produkRepository.getWishlist();

       log("Haii");
      if (res['success'] == true){
      emit(LoadWishState(produk: res['data']));
      } else{
      emit(WishNotFoundState(Message: "Wishlist Belum Ditambahkan"));  
      }

    } catch (error) {
      emit(WishErrorState(error: 'Failed to load products'));
    }
}
}
