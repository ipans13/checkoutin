import 'package:flutter/material.dart';

class DetailBarang extends StatefulWidget {
  final Map detail;

  const DetailBarang({required this.detail});

  @override
  _DetailBarangState createState() => _DetailBarangState();
}

class _DetailBarangState extends State<DetailBarang> {
  bool isWishlist = true;

  @override
  Widget build(BuildContext context) {
    var mediasize = MediaQuery.of(context);
    double widthsize = mediasize.size.width;
    String judulbarang = widget.detail['nama_produk'];
    String deskripsi = widget.detail['deskripsi'];
    String harga = widget.detail['harga'];
    String rating = widget.detail['rating'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop('Refresh');
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
                    child: Image.network(widget.detail['url_gambar']),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            judulbarang,
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
                                    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Wishlist"),
          content: Text(isWishlist ? "Produk telah ditambahkan ke Wishlist" : "Produk telah dihapus dari Wishlist"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
                                  },
                                  icon: Icon(isWishlist ? Icons.favorite : Icons.favorite_outline, size: 20),
                                  color: isWishlist ? Colors.red : Colors.purple,
                                ),
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.add, size: 14),
                                  label: Text('Keranjang', style: TextStyle(fontSize: 12)),
                                ),
                                SizedBox(width: 20),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber),
                                    Text(rating),
                                  ],
                                ),
                              ],
                            ),
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
