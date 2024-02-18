part of 'detail_produk_bloc.dart';

@immutable
sealed class DetailProdukState extends Equatable {}

final class DetailProdukInitial extends DetailProdukState {
  List<Object?> get props => [];
}

final class LoadedDetailState extends DetailProdukState {
final Map produk;

LoadedDetailState({required this.produk});

List<Object?> get props => [produk];
}

final class LoadFailedState extends DetailProdukState {
  final String msg;

  LoadFailedState({this.msg = "Failed to Load Detail Produk"});
  List<Object?> get props => [msg];
}
