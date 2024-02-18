import 'package:checkoutin/bloc/produk/produk_bloc.dart';
import 'package:checkoutin/components/loading.dart';
import 'package:checkoutin/layout/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailProduk extends StatefulWidget {
  final String produkId;
  const DetailProduk({super.key, required this.produkId});

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
    void initState(){
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      context.read<ProdukBloc>().add(DetailProdukEvent(produkId: widget.produkId));

     });
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdukBloc, ProdukState>(builder: (context, state){
      if (state is ProdukLoadingState) {
        return LoadingIndicator();
      } else if(state is DetailProdukState){
        return DetailBarang(detail: state.detailProduk);
      }else if (state is ProdukErrorState) {
       return Center(
      child: Text('Error: ${state.error}'),
            );
      }else{
        return Container();
      }
    });
  }
}