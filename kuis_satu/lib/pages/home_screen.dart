import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF043B64), // Warna background biru
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Quiz 1 Provis Kelompok 22',
              style: TextStyle(
                color: Colors.white, // Warna teks putih
                fontWeight: FontWeight.bold, // Teks lebih tebal
              ),
            ),
            SizedBox(height: 4), // Jarak antar teks
            Text(
              'Rasendriya Andhika (2305309) Muhammad Daffa Rizmawan Harahap (2310083)',
              textAlign: TextAlign.center, // Rata tengah
              style: TextStyle(
                color: Colors.white, // Warna teks putih
                fontSize: 12, // Ukuran lebih kecil dari judul utama
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF043B64), // Warna AppBar
        elevation: 0,
        centerTitle: true, // Teks berada di tengah
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            menuButton(context, 'Main Screen', '/'),
            menuButton(context, 'Mental Health Screen', '/mental_health'),
            menuButton(context, 'Akademik Screen', '/akademik'),
            menuButton(context, 'Keuangan Screen', '/keuangan'),
            menuButton(context, 'Medsos Screen', '/social'),
            menuButton(context, 'E-Learning Screen', '/e_learning'),
            menuButton(context, 'Jadwal & Todo Screen', '/jadwal_todo'),
            menuButton(context, 'Pesan & Group Screen', '/chat_group'),
            menuButton(context, 'Notifikasi Screen', '/notifikasi'),
          ],
        ),
      ),
    );
  }

  Widget menuButton(BuildContext context, String title, String routeName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Warna putih
            foregroundColor: Colors.black, // Warna teks hitam
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Sudut rounded
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, routeName);
          },
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

