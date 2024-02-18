part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent extends Equatable {}

final class LoadWishListEvent extends WishlistEvent {
  List<Object> get props => [];
}