import 'package:checkoutin/bloc/produk/produk_bloc.dart';
import 'package:checkoutin/layout/detail_produk.dart';
import 'package:flutter/material.dart';
import 'package:checkoutin/layout/detail_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class Produk extends StatelessWidget {
  final Map produk;

  const Produk({
    Key? key,
    required this.produk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String idProduk = produk['id_produk'].toString();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: MaterialButton(
onPressed: () async {
  // Navigasi ke halaman detail produk
  var value = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailProduk(produkId: idProduk),
    ),
  );
},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(10),
        child: _card(),
      ),
    );
  }

  Widget _card() {
    String deskripsi = produk['deskripsi'];
    String subDesk = deskripsi.length >= 100 ? '${deskripsi.substring(0, 100)}......' : deskripsi;

    return Container(
      height: 100,
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            width: 60,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Image.network(
                produk['url_gambar'],
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 80,
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 180,
              ),
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produk['nama_produk'].toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Text(
                    subDesk,
                    style: const TextStyle(color: Colors.black26, fontWeight: FontWeight.w500, fontSize: 10),
                  ),
                  Text(
                    produk['harga'],
                    style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 0,
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.amber[300]),
                const SizedBox(width: 5),
                Text(produk['rating'], style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
