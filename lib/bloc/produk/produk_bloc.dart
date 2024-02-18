import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:checkoutin/repository/repository.dart';
import 'package:checkoutin/repository/produk_repository.dart';

part 'produk_event.dart';
part 'produk_state.dart';

class ProdukBloc extends Bloc<ProdukEvent, ProdukState> {
  ProdukRepository produkRepository;

  ProdukBloc({required this.produkRepository}) : super(ProdukInitial()) {
    on<LoadListProdukEvent>(_listProduk);
    on<DetailProdukEvent>(_loadProduk);
  }

_loadProduk(DetailProdukEvent event, Emitter emit ) async {
    String produkId = event.produkId;

    emit(ProdukLoadingState());

    Map res = await produkRepository.selectProduk(produkId);
    
   if (res['status'] == true) {
     emit(DetailProdukState(detailProduk: res));
   } else{
    emit(ProdukErrorState(error: res['msg']));
   }

  }

  _listProduk(LoadListProdukEvent event, Emitter emit) async{
    emit(ProdukLoadingState());
    
    try {
      final List res = await produkRepository.getProdukList(event.keyword);
      emit(ListProdukState(produk: res, searchText: event.keyword));
    } catch (error) {
      emit(ProdukErrorState(error: 'Failed to load products'));
    }
  }
}
