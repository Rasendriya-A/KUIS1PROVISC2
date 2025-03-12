import 'package:flutter/material.dart';

class ChatGroupPage extends StatelessWidget {
  final List<Map<String, dynamic>> chats = [
    {
      "name": "Lorem ipsum",
      "message": "Lorem ipsum dolor sit amet, cons...",
      "time": "Yesterday",
      "image": "assets/images/profile.jpg",
    },
    {
      "name": "Lorem ipsum",
      "message": "Lorem ipsum dolor sit amet, cons...",
      "time": "Yesterday",
      "image": "assets/images/profile.jpg",
    },
    {
      "name": "Lorem ipsum",
      "message": "Lorem ipsum dolor sit amet, cons...",
      "time": "Yesterday",
      "image": "assets/images/profile.jpg",
    },
    {
      "name": "Lorem ipsum",
      "message": "Lorem ipsum dolor sit amet, cons...",
      "time": "Yesterday",
      "image": "assets/images/profile.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5E6CC), // Warna background utama
      appBar: AppBar(
        backgroundColor: Color(0xFF0A3D62),
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
            Expanded(
              child: Text(
                "Cari",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          var chat = chats[index];
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF0A3D62), // Warna biru tua
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(chat["image"]),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat["name"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.done_all, color: Colors.white, size: 16),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              chat["message"],
                              style: TextStyle(color: Colors.white, fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      chat["time"],
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    SizedBox(height: 5),
                    Icon(Icons.push_pin, color: Colors.white70, size: 20),
                  ],
                ),
              ],
            ),
          );
        },
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
}
