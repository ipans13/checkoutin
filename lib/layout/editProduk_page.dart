import 'package:checkoutin/components/Produt_edit.dart';
import 'package:flutter/material.dart';

class ProdukEditPage extends StatelessWidget {
  final List produkList;
  const ProdukEditPage({super.key, required this.produkList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Produk"),
      ),
      backgroundColor: Colors.white70,
      body:  Column(
        children: [
          Expanded(child: 
          ListView(
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
                  return ProdukEdit(produk: produkItem);
                },
              ).toList(),
            ),   
      ],
    ),
  )
  ]
  )
          )
        ],
      ),
    );
  }
  }