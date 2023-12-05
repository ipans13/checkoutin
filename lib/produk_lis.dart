import 'package:flutter/material.dart';

class ProdukAvailable {
  String nmbarang;
  String harga;
  String stok;
  String deskripsi;
  String rating;
  Image gambar;

  ProdukAvailable({
    required this.nmbarang,
    required this.harga,
    required this.stok,
    required this.deskripsi,
    required this.rating,
    required this.gambar,
  });
}

List<ProdukAvailable> produklist = [
  ProdukAvailable(
    nmbarang: 'Kue Eyang',
    harga: '14.000',
    stok: '10',
    rating: '4,6',
    deskripsi: 'Keu Eyang Paling enak',
    gambar: Image.asset('lib/images/images.jpeg')
  ),
  ProdukAvailable(
    nmbarang: 'Super Tiramisu Cake - Slice',
    harga: 'Rp68.400',
    stok: '20',
    rating: '4,8',
    deskripsi: 'Pilihan tepat untuk pencinta kopi yang ingin menikmati kue tiramisu bebas gluten. Super Tiramisu Cake bertekstur sangat lembut dan harus selalu berada didalam kulkas/chiller.',
    gambar: Image.asset('lib/images/tiramisu_cake.jpg')
  ),
  ProdukAvailable(
    nmbarang: 'Strawberry Short Cake',
    harga: 'Rp115.000',
    stok: '20',
    rating: '4,9',
    deskripsi: 'Kue tart best seller di Maqui’s, terbuat dari sponge cake vanilla yang lembut dibagian tengah ada lapisan fresh krim dan potongan strawberry.',
    gambar: Image.asset('lib/images/strawberry_cake.jpg')
  ),
  ProdukAvailable(
    nmbarang: 'Kue kering ',
    harga: 'Rp80.000',
    stok: '20',
    rating: '5.0',
    deskripsi: 'Kue Nastar dibuat dengan mentega premium (Wijsman & Orchid) sehingga rasanya lembut dan wangi. Selai nanas dibuat sendiri, manis dan asam segar. Homemade tanpa bahan pengawet.',
    gambar: Image.asset('lib/images/Nastar.png')
  ),
];
