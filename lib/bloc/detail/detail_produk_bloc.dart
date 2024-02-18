import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:checkoutin/repository/repository.dart';
import 'package:checkoutin/repository/produk_repository.dart';

part 'detail_produk_event.dart';
part 'detail_produk_state.dart';

class DetailProdukBloc extends Bloc<DetailProdukEvent, DetailProdukState> {
  DetailProdukBloc() : super(DetailProdukInitial()) {
    on<LoadDetailEvent>(_loadProduk);
  }
  _loadProduk(LoadDetailEvent event, Emitter emit)async{
    String produkId = event.produkId;
  }
}
