part of 'produk_bloc.dart';

@immutable
sealed class ProdukEvent extends Equatable{}

final class LoadListProdukEvent extends ProdukEvent {
  final String keyword;

  LoadListProdukEvent({this.keyword =""});

  List<Object> get props => [];
}
final class DetailProdukEvent extends ProdukEvent {
  final String produkId;
  DetailProdukEvent({required this.produkId});
  List<Object> get props => [produkId];
}

