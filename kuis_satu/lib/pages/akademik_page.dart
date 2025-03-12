import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AkademikPage extends StatelessWidget {
  const AkademikPage({super.key});

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // SKS, IPK, Lama Studi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildStatBox("Perolehan SKS", "65"),
                buildStatBox("IPK", "4.69"),
                buildStatBox("Lama Studi", "4 Semester"),
              ],
            ),
            const SizedBox(height: 20),
            // Grafik IPK
            buildGraphBox(
              "TREN IPK",
              LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(1, 3),
                        const FlSpot(2, 3.5),
                        const FlSpot(3, 4),
                        const FlSpot(4, 4),
                      ],
                      isCurved: true,
                      color: Colors.orange,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Grafik Perolehan Nilai
            buildGraphBox(
              "Jumlah Perolehan Nilai",
              BarChart(
                BarChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    makeBarData(0, 14),
                    makeBarData(1, 9),
                    makeBarData(2, 4),
                    makeBarData(3, 3),
                    makeBarData(4, 1),
                    makeBarData(5, 1),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Menu Akademik
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildMenuIcon(Icons.menu_book, "Transkrip Nilai"),
                buildMenuIcon(Icons.note_alt, "IRS"),
                buildMenuIcon(Icons.article, "PRS"),
                buildMenuIcon(Icons.assignment, "KRS"),
              ],
            ),
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

  // Widget untuk Statistik
  Widget buildStatBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF043B64),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Widget untuk Grafik
  Widget buildGraphBox(String title, Widget graph) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF043B64),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(height: 150, child: graph),
        ],
      ),
    );
  }

  // Widget untuk Grafik Bar Chart
  BarChartGroupData makeBarData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          fromY: 0, // Mulai dari 0
          toY: y, // Nilai tujuan
          color: Colors.grey, // Warna batang
          width: 16,
        ),
      ],
    );
  }


  // Widget untuk Menu Akademik
  Widget buildMenuIcon(IconData icon, String label) {
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
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF043B64))),
      ],
    );
  }
}
