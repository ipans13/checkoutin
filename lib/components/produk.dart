import 'package:flutter/material.dart';
import 'package:checkoutin/page_detail.dart';
import 'package:checkoutin/produk_lis.dart';

class Produk extends StatelessWidget {
  final int index;
  const Produk({super.key,
  required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Card( 
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
       margin: const EdgeInsets.only(bottom: 20),
      child: MaterialButton(onPressed: (){

        Navigator.push(context, MaterialPageRoute(builder: ((context) => DetailBarang(index: index,))));
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
        padding: const EdgeInsets.all(10),
        child: _card()
      ),
   
     
    );
  }
  Widget _card(){


    String judulbarang = produklist[index].nmbarang;
    String deskripsi = produklist[index].deskripsi;
    if(deskripsi.length >= 20){
      deskripsi = deskripsi.substring(0,20)+ '.......';
    }
    String harga = 'Rp. '+ produklist[index].harga;
    String rating = produklist[index].rating;

    return Container(
      height: 100,
      padding: const EdgeInsets.all(10.0),
      child: Stack( 
        
        children: [
          Positioned( left: 0,
            width: 60,
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24))
            ),
            child: produklist[index].gambar,
            ),
          ),
          
            
            Positioned(
              left: 80,
              child: Container(
              constraints: const BoxConstraints(
                maxWidth: 100,
                
              ),
              height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
            Text( judulbarang.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
            
            Text(deskripsi, style: const TextStyle(color: Colors.black26, fontWeight: FontWeight.w500, fontSize: 10),
            
            ),
            Text(harga, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 12),
            
            ),
            ],
          ),
              )
            ),
            Positioned(right: 20,top: 0,
            child: Row(
            children: [
              Icon(Icons.star, color: Colors.amber[300],),
              const SizedBox(width: 5), 
              Text(rating, style:const TextStyle(fontWeight: FontWeight.bold)),
            ], 
            )
            ),
        ],
      
      )
    
    );
  }


}