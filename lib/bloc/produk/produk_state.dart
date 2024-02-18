part of 'produk_bloc.dart';

@immutable
sealed class ProdukState extends Equatable{}

final class ProdukInitial extends ProdukState {
  List<Object> get props => [];
}

class ProdukLoadingState extends ProdukState {
  List<Object> get props => [];
}

class ProdukSuccessState extends ProdukState {
  final String message;

ProdukSuccessState({required this.message});
  List<Object> get props => [];
}

class ProdukErrorState extends ProdukState {
  final String error;

ProdukErrorState({required this.error});
List<Object> get props => [error];
}

class ListProdukState extends ProdukState {
  final List produk;
 final String searchText;
 ListProdukState({required this.produk , this.searchText = ""});
  @override
  List<Object> get props => [produk,searchText];
}

class DetailProdukState extends ProdukState {
  final Map detailProduk;

  DetailProdukState({required this.detailProduk});
  List<Object> get props => [detailProduk];

}




