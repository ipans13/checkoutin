part of 'detail_produk_bloc.dart';

@immutable
sealed class DetailProdukEvent extends Equatable{}

class LoadDetailEvent extends DetailProdukEvent {
  final String produkId;

  LoadDetailEvent({required this.produkId});

  List<Object?> get props => [produkId];
}
