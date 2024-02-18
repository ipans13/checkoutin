import 'package:flutter/material.dart';

class About extends StatelessWidget {
  About({
    super.key});
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.purple,
      ),
      body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Aplikasi CheckOutin', style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            Text('Aplikasi CheckOutin adalah platform digital yang memungkinkan pengguna untuk menjelajahi, mencari, dan membeli berbagai jenis kue secara online. Banyak Menu Kue dan juga Makanan yang bisa dinikmati. DIbuatnya aplikasi ini untuk mempermudah Penjualan dari Toko Kue Ini'),
            SizedBox(height: 20),
            Text(' Copyright By RivanSetiawan_21552011056 dan YudiaMuhammad_21552011459', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),)
          ],
        ),
      );
  }
}
