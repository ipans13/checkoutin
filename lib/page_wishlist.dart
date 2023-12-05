import 'package:flutter/material.dart';
import 'package:checkoutin/components/ProdukWish.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
    children: [
      _WishListBanner(),
      Container(
      child: const Expanded(
        child:GridList()
      )
      )
    ]
    )
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
class GridList extends StatefulWidget {
  const GridList({super.key});

  @override
  State<GridList> createState() => _GridListState();
}

class _GridListState extends State<GridList> {
  @override
  Widget build(BuildContext context) {
    return 
    Container( 
      color: Colors.white,
    child: GridView.builder(
      shrinkWrap: true,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 4/5
                ),
                
                itemCount: 10,
                itemBuilder:(BuildContext context, index){
                  return const ProdukWish(index: 0)
                  ;
                }
      )
    );
  }
}