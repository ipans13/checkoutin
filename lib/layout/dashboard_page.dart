import 'package:checkoutin/bloc/produk/produk_bloc.dart';
import 'package:flutter/material.dart';
import 'package:checkoutin/components/produk.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePage extends StatefulWidget {
  final List listProduk;
  final String searchText;
  const HomePage({required this.listProduk, required this.searchText});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool shouldReload = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          _searchbar(),
          Expanded(
            child: shouldReload ? _buildList() : Container(), // Only build the list if shouldReload is true
          ),
        ],
      ),
    );
  }
    Widget _buildList() {
    return ProdukListView(produkList: widget.listProduk);
  }
  Widget _searchbar(){
    TextEditingController _search = TextEditingController(text: widget.searchText);
    return Container(
      padding: const  EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      decoration: BoxDecoration(
        color:Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset:const Offset(0, 2)
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          
        )
      ),
child: Row(
  children: [
    const Text('CHECKOUTIN', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 18),),
    const SizedBox(
      width: 40,
    )
    ,
    Expanded(
      child:Container(
        constraints:const BoxConstraints(
          maxHeight: 50,
          minWidth: 100
        ),
        padding: const EdgeInsets.only(
        ),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(25)
        ),
      child: TextField(
        controller: _search,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 1),
          hintText: 'Cari......',
          prefixIcon: const Icon(Icons.search, size: 18,),
          
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.purple, width: 2)
            
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.purple, width: 3)
          )
        ),
        style: const TextStyle(
          fontSize: 12
        ),
      ),
      ),
    ),
    ElevatedButton(onPressed: (){
            final search = _search.text;

            context
            .read<ProdukBloc>()
            .add(LoadListProdukEvent(keyword: search));
          }, child:  const Icon(Icons.search, size: 18,),
      )
  ],
)
    
);
  }
}
class ProdukListView extends StatelessWidget {
  final List produkList;
  const ProdukListView({required this.produkList});

  @override
  Widget build(BuildContext context) {
    return ListView(
  children: [
    const SizedBox(height: 150),
    Container(
      constraints:const BoxConstraints(
        minHeight: 500
      ),
    decoration: BoxDecoration(
      color:const Color.fromARGB(255, 238, 237, 237),
      borderRadius:const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          offset:const Offset(0, -3)
        )
      ]
    ),
    padding:const EdgeInsets.only( left: 40, right: 40),
    margin:const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding:const EdgeInsets.symmetric(vertical: 20),
          child:const Text('List Produk', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.start,),
        ),
  Column(
              children: List.generate(
                produkList.length,
                (index) {
                  final Map produkItem = produkList[index];
                  return Produk(produk: produkItem);
                },
              ).toList(),
            ),   
      ],
    ),
  )
  ]
  );
  }
  
}

