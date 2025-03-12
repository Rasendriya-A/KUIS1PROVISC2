import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class KeuanganPage extends StatelessWidget {
  const KeuanganPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFECD1),
      
      // **Top Bar (AppBar) Sama dengan Akademik**
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
            // **Saldo dan Menu Keuangan**
            _buildSaldoSection(),
            const SizedBox(height: 20),
            _buildMenuGrid(),
            const SizedBox(height: 20),
            _buildSummarySection(),
            const SizedBox(height: 20),
            _buildExpensesChart(),
          ],
        ),
      ),
      
      // **Bottom Navigation Bar Sama dengan Akademik**
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

  // **Widget untuk Saldo dan Menu Keuangan**
  Widget _buildSaldoSection() {
    return Container(
      width: double.infinity, // Lebar penuh
      padding: const EdgeInsets.all(20), // Padding lebih besar agar kotak lebih besar
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Teks menjadi left alignment
        children: [
          Text(
            "Keuangan Rasen",
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Total Saldo",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 5),
          const Text(
            "Rp 1.000.000",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24, // Ukuran teks diperbesar
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildMenuGrid() {
    List<Map<String, dynamic>> menus = [
      {"icon": Icons.add, "label": "Top Up"},
      {"icon": Icons.arrow_upward, "label": "Transfer"},
      {"icon": Icons.download, "label": "Tarik Tunai"},
      {"icon": Icons.history, "label": "History"},
      {"icon": Icons.account_balance_wallet, "label": "Budgeting"},
      {"icon": Icons.school, "label": "UKT"},
      {"icon": Icons.receipt, "label": "Bills"},
      {"icon": Icons.apps, "label": "More"},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Tetap 4 kolom
        childAspectRatio: 1, // Ukuran kotak tetap proporsional
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: menus.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.shade900,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(menus[index]['icon'], color: Colors.white, size: 30),
              const SizedBox(height: 8),
              Text(
                menus[index]['label'],
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }


  // **Widget untuk Summary dengan Pie Chart**
  Widget _buildSummarySection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF043B64),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Summary",
            style: TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Maret 2025",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: PieChart(
                  PieChartData(
                    sections: _generatePieChartSections(),
                    centerSpaceRadius: 20,
                    sectionsSpace: 3,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Income: Rp 1.600.000", style: TextStyle(color: Colors.green, fontSize: 14)),
                  Text("Expenses: Rp 600.000", style: TextStyle(color: Colors.red, fontSize: 14)),
                  Text("Total: Rp 1.000.000", style: TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _generatePieChartSections() {
    return [
      PieChartSectionData(
        value: 1600000,
        color: Colors.green,
        title: 'Income',
        radius: 30,
        titleStyle: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: 600000,
        color: Colors.red,
        title: 'Expenses',
        radius: 30,
        titleStyle: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    ];
  }

  // **Widget untuk Grafik Expenses**
  Widget _buildExpensesChart() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF043B64),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Expenses - Last 7 days",
            style: TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 150,
            child: BarChart(
              BarChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: true),
                borderData: FlBorderData(show: false),
                barGroups: [
                  _makeBarData(0, 100),
                  _makeBarData(1, 50),
                  _makeBarData(2, 75),
                  _makeBarData(3, 30),
                  _makeBarData(4, 80),
                  _makeBarData(5, 90),
                  _makeBarData(6, 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _makeBarData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: y,
          color: Colors.green,
          width: 16,
        ),
      ],
    );
  }
}
