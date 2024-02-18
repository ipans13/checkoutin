import 'package:checkoutin/bloc/produk/produk_bloc.dart';
import 'package:checkoutin/components/Produt_edit.dart';
import 'package:checkoutin/layout/editProduk_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class EditProduk extends StatelessWidget {
  const EditProduk({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdukBloc, ProdukState>(
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
            return ProdukEditPage(produkList: state.produk);
          } else if (state is ProdukErrorState) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          } else {
            return Container();
          }
  }
    );
  
}
}