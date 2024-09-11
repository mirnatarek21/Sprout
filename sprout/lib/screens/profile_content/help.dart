import 'package:flutter/material.dart';
import '../../utils/navigation_bar.dart';
import '../Community_Screen.dart';
import '../Notification_Page.dart';
import 'package:sprout/screens/profile_content/profile.dart';

class helpScreen extends StatefulWidget {
  const helpScreen({super.key});

  @override
  State<helpScreen> createState() => _helpScreenState();
}

class _helpScreenState extends State<helpScreen> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotificationPage()),
        );
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
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Help',
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 42,
                  height: 42,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/home_imgs/personal_image.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 46,
              decoration: BoxDecoration(
                color: Color(0xffF4F6FA),
                border: Border.all(color: Color(0xffBCDCD1), width: .5),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "FAQs",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff2D3142)),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 305,
              decoration: BoxDecoration(
                color: Color(0xffF4F6FA),
                border: Border.all(color: Color(0xffBCDCD1), width: .5),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact Us",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff2D3142)),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset(
                            "assets/icons/customer.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Customer Service",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff2D3142)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset(
                            "assets/icons/facebook.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Facebook",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff2D3142)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset(
                            "assets/icons/whatsapp.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "WhatsApp",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff2D3142)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset(
                            "assets/icons/insta.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Instagram",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff2D3142)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset(
                            "assets/icons/x.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "X",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff2D3142)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
}
