import 'package:checkoutin/page_detail.dart';
import 'package:flutter/material.dart';

class ProdukWish extends StatelessWidget {
  final int index;
  const ProdukWish({super.key,
  required this.index
  });

  @override
  Widget build(BuildContext context) {
    return  Card( 
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: MaterialButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: ((context) => DetailBarang(index: index,))));
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
        child: _card()
      ),
   
    );
  }
  Widget _card(){


    String judulbarang = 'Kue Eyang';
    String harga = '140.000';
    return Container(
      constraints: const BoxConstraints(

      ),
      child: Column( 
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            constraints: const BoxConstraints(
              maxHeight: 200,
              maxWidth: 140
            ),
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24))
            ),
            child: Image.asset('lib/images/images.jpeg'),
            ),
          ),
            Container(
              margin: const EdgeInsets.only(
                
              ),
              constraints: const BoxConstraints(
                maxWidth: 150,
                
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
            Text( judulbarang.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            
            Text("Rp. "+ harga, style:const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 12),

            ),
            ],
          ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:[ 
              Icon(Icons.star, color: Colors.amber[300],),
              const SizedBox(width: 5), 
              const  Text("4,5", style: TextStyle(fontWeight: FontWeight.bold))
                ]
              ), 
                MaterialButton(onPressed: (){}, 
                child:
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 1.5),
                borderRadius: BorderRadius.circular(25)
                ),
                child: const Row(
                  children: [
                    Icon(Icons.shopping_cart_checkout,size: 12,),
                    Text('Keranjang', style: TextStyle(fontSize: 8),)
                  ],
                )
                )
              
              )
            ], 
            ),
        ],
      
      )
    
    );
  }


}