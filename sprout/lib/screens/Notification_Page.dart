import 'package:flutter/material.dart';
import 'package:sprout/screens/Community_Screen.dart';
import 'package:sprout/screens/profile_content/profile.dart';
import 'package:sprout/utils/navigation_bar.dart';

import '../home.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _selectedIndex = 1;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeviewBody()),
        );
        break;
      case 1:
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommunityScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
    }
  }

  bool val = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color of the Scaffold
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white, // Keep AppBar background white
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text(
            'Notifications',
            style: TextStyle(
              color: Color(0xff2D3142),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          const SizedBox(width: 48), // Space for alignment purposes
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildNotificationTile(
              'Congratulations',
              '35% your daily challenge completed',
              '9:45 AM',
            ),
            _buildNotificationTile(
              'Attention',
              'Your subscription is going to expire very soon. Subscribe now.',
              '9:38 AM',
            ),
            _buildNotificationTile(
              'Daily Activity',
              'Time for your workout session',
              '8:25 AM',
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigateBar(
        onTabTapped: _onTabTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  Widget _buildNotificationTile(
    String title,
    String subtitle,
    String time,
  ) {
    return Dismissible(
      key: Key(title),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        color: const Color(0xffF9A0B1),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 24,
        ),
      ),
      onDismissed: (direction) {
        // Handle deletion logic here
      },
      child: Column(
        children: [
          ListTile(
            onTap: () {
              setState(() {
                val = !val;
              });
            },
            leading: val
                ? const Icon(
                    Icons.circle,
                    size: 8,
                    color: Color(0xff79B9A4),
                  )
                : null,
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color(0xff1E293B),
              ),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xff2D3142),
              ),
            ),
            trailing: Text(
              time,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff1E293B),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              height: 4,
              thickness: 0.5,
              color: Color(0xffDADADA),
            ),
          ),
        ],
      ),
    );
  }
}
