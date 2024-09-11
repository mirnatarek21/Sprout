import 'package:flutter/material.dart';
import 'package:sprout/constants.dart';

class NavigateBar extends StatefulWidget {
  final Function(int) onTabTapped;
  final int selectedIndex;

  const NavigateBar({
    Key? key,
    required this.onTabTapped,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  _NavigateBarState createState() => _NavigateBarState();
}

class _NavigateBarState extends State<NavigateBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.notifications_outlined),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/community.png',
            width: 24,
            height: 24,
          ),
          label: 'Community',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: buttonColor,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontSize: 10),
      backgroundColor: Colors.white,
      onTap: (index) {
        widget.onTabTapped(index);
      },
    );
  }
}
