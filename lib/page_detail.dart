import 'package:flutter/material.dart';
import 'package:checkoutin/produk_lis.dart';

class DetailBarang extends StatelessWidget {
  final int index;
  const DetailBarang({super.key,
  required this.index
  
  });

  @override
  Widget build(BuildContext context) {
    var mediasize = MediaQuery.of(context);
    double widthsize = mediasize.size.width;
    String judulbarang = produklist[index].nmbarang;
    String deskripsi = produklist[index].deskripsi;
    String harga = produklist[index].harga;
    String rating = produklist[index].rating;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        backgroundColor: Colors.purple,
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
  children: [
    Positioned(
      top: 0,
      child: Expanded(
        child: ListView(
          children: [
            Container(
              height: 300,
              width: widthsize,
              margin: const EdgeInsets.all(5),
              constraints: const BoxConstraints(
                maxHeight: 400,
              ),

              child: produklist[index].gambar,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration:const  BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey,
                  offset: Offset(0, -2)
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(judulbarang,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Text(
                        harga,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {

                            },
                            icon:const Icon(Icons.favorite_outline, size: 20),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(Colors.purple),
                              side: MaterialStateProperty.all(BorderSide(color: Colors.purple)),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon:const Icon(Icons.add, size: 14),
                            label: Text('Keranjang', style: TextStyle(fontSize: 12)),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(Colors.purple),
                              side: MaterialStateProperty.all(BorderSide(color: Colors.purple)),
                            ),
                          ),
                          SizedBox(width: 20),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Text(rating),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    constraints: const BoxConstraints(
                      minHeight: 250,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Deskripsi: ', style: TextStyle(fontSize: 14)),
                        const SizedBox(height: 10),
                        Text(deskripsi),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  ],
)

      
      
      

      );
  }
}