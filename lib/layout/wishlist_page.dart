import 'package:flutter/material.dart';
import 'package:checkoutin/components/produk_wish.dart';

class WishListPage extends StatelessWidget {
  final List produklist;
  const WishListPage({super.key, required this.produklist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // body: Column(
    // children: [
    //   _WishListBanner(),
    //   Container(
    //   child: Expanded(
    //     child: Container( 
    //   color: Colors.white,
    // child: GridView.builder(
    //   shrinkWrap: true,
    //             gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 2,
    //               crossAxisSpacing: 4.0,
    //               mainAxisSpacing: 4.0,
    //               childAspectRatio: 4/5
    //             ),
                
    //             itemCount: produklist.length,
    //             itemBuilder:(BuildContext context, index){
    //               Map wishproduk = produklist[index];
    //               return ProdukWish(Produk: wishproduk);
    //               ;
    //             }
    //   )
    // )
    //   )
    //   )
    // ]
    // )
    );
  }
    Widget _WishListBanner(){
    return Container(
      padding: const  EdgeInsets.symmetric(vertical: 0, horizontal: 40),
      decoration: BoxDecoration(
        color:Colors.white,
        border: Border(bottom: BorderSide(color:Colors.black.withOpacity(0.3) )),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 2,
            offset: const Offset(0, 2)
          )
        ],
      ),
child: Container(
child:Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text('WISHLIST', style: TextStyle(fontWeight: FontWeight.bold, ),),
    
    Padding(padding:const EdgeInsets.symmetric(horizontal: 10),
   child: IconButton(onPressed: () {}, icon:const Icon(Icons.shopping_cart), color: Colors.purple,hoverColor: Colors.transparent,focusColor: Colors.transparent ,)
    )
  ],
) 
) 
);
  }
}