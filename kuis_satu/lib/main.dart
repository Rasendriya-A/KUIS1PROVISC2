import 'package:flutter/material.dart';
import 'pages/home_screen.dart'; // Import halaman utama
import 'pages/mental_health_page.dart';
import 'pages/akademik_page.dart';
import 'pages/keuangan_page.dart';
import 'pages/notif_page.dart';
import 'pages/social_page.dart';
import 'pages/e_learning_page.dart';
import 'pages/jadwal_todo_page.dart';
import 'pages/chat_group_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Menu Navigation',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home_screen', // Menjadikan HomeScreen halaman pertama
      routes: {
         '/': (context) => const HomePage(), // Halaman utama
        '/home_screen': (context) => HomeScreen(),
        '/mental_health': (context) => const MentalHealthPage(),
        '/akademik': (context) => const AkademikPage(),
        '/keuangan': (context) => const KeuanganPage(),
        '/social': (context) => const SocialPage(),
        '/e_learning': (context) => const ELearningPage(),
        '/jadwal_todo': (context) => const JadwalTodoPage(),
        '/chat_group': (context) => ChatGroupPage(),
        '/notifikasi': (context) => const NotifPage(),
      },

    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFECD1),
        appBar: AppBar(
          backgroundColor: const Color(0xFF043B64), // Warna biru tua
          elevation: 0,
          title: Row(
            children: [
              const Icon(Icons.menu, color: Colors.white), // Ikon menu (tidak bisa diklik)
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search, color: Color(0xFF043B64)), // Ikon search
                      SizedBox(width: 8),
                      Text(
                        "Cari",
                        style: TextStyle(
                          fontFamily: 'SF Pro Display', // Gunakan font SF Pro Display
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.account_circle, color: Colors.white), // Ikon profile (tidak bisa diklik)
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white), // Ikon notifikasi
                onPressed: () {
                 Navigator.pushNamed(context, '/notifikasi');
                },
              ),
            ),
          ],
        ),


        body: SingleChildScrollView( // Tambahkan SingleChildScrollView di sini
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Top Menu
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    menuIcon(context, Icons.favorite, 'Mental Health', '/mental_health'),
                    menuIcon(context, Icons.menu_book, 'Akademik', '/akademik'),
                    menuIcon(context, Icons.account_balance_wallet, 'Keuangan', '/keuangan'),
                    menuIcon(context, Icons.apps, 'More', '/notifikasi'),
                  ],
                ),
                const SizedBox(height: 20),
                // Berita Pendidikan
                const Text(
                  'Berita Pendidikan Hari ini',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF043B64)),
                ),
                const SizedBox(height: 12),
                buildNewsCard(),
                const SizedBox(height: 20),
                // Kuliah Hari Ini
                buildSectionBox(
                  'Kuliah Hari Ini',
                  const Color(0xFFFF8A18),
                  [
                    buildItemCard(Icons.menu_book, 'Pemrograman Visual (C-302)', 'Ruang C-302. Selasa, 09.30 - 12.00'),
                    buildItemCard(Icons.menu_book, 'Analisis dan Desain Algoritma', 'Ruang C-103. Selasa, 15.00 - 18.00'),
                  ],
                ),
                const SizedBox(height: 20),
                // Tugas
                buildSectionBox(
                  'Tugas',
                  Colors.orange,
                  [
                    buildItemCard(Icons.build, 'Tubes Provis', 'Deadline: Rabu, 12 Maret 2025'),
                    buildItemCard(Icons.build, 'Worksheet Andal', 'Deadline: Rabu, 12 Maret 2025'),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF043B64),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Social'),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'E-Learning'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Schedule'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/social');
                break;
              case 1:
                Navigator.pushNamed(context, '/e_learning');
                break;
              case 2:
                Navigator.pushNamed(context, '/jadwal_todo');
                break;
              case 3:
                Navigator.pushNamed(context, '/chat_group');
                break;
            }
          },
        ),
      ),
    );
  }

  // === WIDGETS ===
  Widget menuIcon(BuildContext context, IconData icon, String label, String routeName) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF043B64),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }


  Widget buildNewsCard() {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFF043B64), borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            child: Image.asset('assets/images/kucing.jpg', width: 100, height: 100, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Kiko, Sang Kucing SC, memiliki...',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 4),
                  Text('Lorem ipsum dolor sit amet...', style: TextStyle(color: Colors.white70, fontSize: 13)),
                  SizedBox(height: 6),
                  Text('Eren Yaeger, 23 Mei 1990', style: TextStyle(fontSize: 12, color: Colors.white)),
                ],
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget buildSectionBox(String title, Color titleColor, List<Widget> items) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF043B64), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: titleColor)),
          const SizedBox(height: 16),
          ...items,
        ],
      ),
    );
  }

  Widget buildItemCard(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: const Color(0xFF043B64), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF043B64))),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}