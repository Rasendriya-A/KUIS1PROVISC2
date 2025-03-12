import 'package:flutter/material.dart';

class JadwalTodoPage extends StatelessWidget {
  const JadwalTodoPage({super.key});

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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Maret",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF7F00),
              ),
            ),
            const SizedBox(height: 10),
            _buildCalendar(),
            const SizedBox(height: 20),
            _buildTaskList(),
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

  Widget _buildCalendar() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFD1D9DA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildCalendarHeader(),
          const SizedBox(height: 10),
          _buildCalendarGrid(),
        ],
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(Icons.chevron_left, color: Colors.black54),
        Text(
          "Today",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        Icon(Icons.chevron_right, color: Colors.black54),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    List<List<String>> dates = [
      ["", "", "", "1", "2", "3", "4"],
      ["5", "6", "7", "8", "9", "10", "11"],
      ["12", "13", "14", "15", "16", "17", "18"],
      ["19", "20", "21", "22", "23", "24", "25"],
      ["26", "27", "28", "29", "30", "31", ""],
    ];

    List<Map<String, dynamic>> events = [
      {"date": "12", "title": "Kuis Provis"},
      {"date": "16", "title": "TP 5 DPBO"},
      {"date": "19", "title": "WS Andal"},
    ];

    return Column(
      children: [
        _buildCalendarRow(["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], isHeader: true),
        for (var week in dates) _buildCalendarRow(week, events: events),
      ],
    );
  }

  Widget _buildCalendarRow(List<String> days, {bool isHeader = false, List<Map<String, dynamic>>? events}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((day) {
        bool hasEvent = events?.any((event) => event["date"] == day) ?? false;
        List<String> eventTitles = hasEvent
    ? events!.where((event) => event["date"] == day).map<String>((e) => e["title"] as String).toList()
    : [];


        return Expanded(
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Column(
              children: [
                Text(
                  day,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                ),
                for (var eventTitle in eventTitles)
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: const Color(0xFF043B64),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      eventTitle,
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTaskList() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF043B64),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "List Tugas",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
          _buildTaskRow(["Nama", "Status", "Deadline"], isHeader: true),
          _buildTaskRow(["Kuis Provis", "Complete", "12 - 03 - 2025"]),
          _buildTaskRow(["TP 5 DPBO", "Progress", "16 - 03 - 2025"]),
          _buildTaskRow(["WS Andal", "Progress", "19 - 03 - 2025"]),
        ],
      ),
    );
  }

  Widget _buildTaskRow(List<String> items, {bool isHeader = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isHeader ? Colors.transparent : const Color(0xFFD1D9DA),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          return Expanded(
            child: Text(
              item,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                color: isHeader ? Colors.orange : const Color(0xFF043B64),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
