import 'package:flutter/material.dart';

class MentalHealthPage extends StatelessWidget {
  const MentalHealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFECD1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF043B64),
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.menu, color: Colors.white),
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
                    Icon(Icons.search, color: Color(0xFF043B64)),
                    SizedBox(width: 8),
                    Text(
                      "Cari",
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
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
            child: Icon(Icons.account_circle, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/notif');
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Selamat Malam & Emoji Mood
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF043B64),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    "Selamat malam, Rasen!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Bagaimana perasaanmu hari ini?",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.emoji_emotions,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Menu Kategori
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                categoryMenu(Icons.book, "Jurnal"),
                categoryMenu(Icons.self_improvement, "Meditasi"),
                categoryMenu(Icons.support, "Konseling"),
                categoryMenu(Icons.favorite, "Health Tracker"),
              ],
            ),

            const SizedBox(height: 20),

            // Artikel
            const Text(
              "Helpful Articles",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF043B64)),
            ),
            const SizedBox(height: 12),

            buildArticleCard(),
            buildArticleCard(),
            buildArticleCard(),
          ],
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
      ),
    );
  }

  // Widget untuk kategori menu
  Widget categoryMenu(IconData icon, String title) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF043B64),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Widget untuk artikel
  Widget buildArticleCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF043B64),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
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
}
