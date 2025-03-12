import 'package:flutter/material.dart';

class ELearningPage extends StatelessWidget {
  const ELearningPage({super.key});

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
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.account_circle, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCourseCard(
            title: "Pemrograman Visual dan Piranti Gerak",
            schedule: "Selasa, 09.30 - 12.00",
            students: "48 siswa",
            lecturer: "Dr. Yudi Wibisono, S.T., M.T.",
            backgroundColor: const Color(0xFF0D5C63),
            titleColor: Colors.orange,
          ),
          _buildCourseCard(
            title: "Analisis dan Desain Algoritma",
            schedule: "Selasa, 15.00 - 18.00",
            students: "48 siswa",
            lecturer: "Yaya Wihardi, S.Kom., M.Kom.",
            backgroundColor: const Color(0xFF6B8999),
            titleColor: const Color(0xFF043B64), // Warna biru navbar
          ),
          _buildCourseCard(
            title: "Metodologi Penelitian",
            schedule: "Kamis, 09.30 - 12.00",
            students: "48 siswa",
            lecturer: "Rizky Rachman Judhie Putra, M.Kom.",
            backgroundColor: Colors.orange,
            titleColor: const Color(0xFF043B64), // Warna biru navbar
          ),
          _buildCourseCard(
            title: "Projek Konsultasi",
            schedule: "Kamis, 12.00 - 15.30",
            students: "48 siswa",
            lecturer: "Eddy Prasetyo Nugroho, M.T.",
            backgroundColor: const Color(0xFF0D5C63),
            titleColor: Colors.orange,
          ),
          _buildCourseCard(
            title: "Big Data Platforms",
            schedule: "Senin, 07.00 - 08.40",
            students: "48 siswa",
            lecturer: "Prof. Dr. Lala Septem Riza, M.T.",
            backgroundColor: const Color(0xFF6B8999),
            titleColor: const Color(0xFF043B64), // Warna biru navbar
          ),
          _buildCourseCard(
            title: "Desain dan Pemrograman Berbasis Objek",
            schedule: "Senin, 13.00 - 15.30",
            students: "48 siswa",
            lecturer: "Rosa Ariani Sukamto, M.T.",
            backgroundColor: Colors.orange,
            titleColor: const Color(0xFF043B64), // Warna biru navbar
          ),
        ],
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

  Widget _buildCourseCard({
    required String title,
    required String schedule,
    required String students,
    required String lecturer,
    required Color backgroundColor,
    Color titleColor = Colors.black,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            schedule,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                students,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Text(
                lecturer,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
