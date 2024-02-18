part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState extends Equatable {}

final class WishlistInitial extends WishlistState {
List<Object> get props => [];
}

class WishlistLoadingState extends WishlistState{
  List<Object> get props => [];
}


class LoadWishState extends WishlistState{
  final List produk;
LoadWishState({required this.produk});
  @override
  List<Object> get props => [produk];
}

class WishErrorState extends WishlistState {
  final String error;

WishErrorState({required this.error});
List<Object> get props => [error];
}

class WishNotFoundState extends WishlistState {
  final String Message;
  WishNotFoundState({required this.Message});
  List<Object> get props => [Message];
}
