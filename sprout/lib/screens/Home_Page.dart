import 'package:flutter/material.dart';
import 'package:sprout/utils/home_widgets/most_active_days.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _Home_PageScreenState();
}

class _Home_PageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 60,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  "assets/images/download.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 7),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Welcome Back",
                                  style: const TextStyle(
                                    color: const Color(0xff79B9A4),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Text(
                                  "Sara Draz!",
                                  style: const TextStyle(
                                    color: const Color(0xff2D3142),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xffBCDCD1),
                                  width: 1,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications_none,
                                size: 22,
                                color: const Color(0xff1E293B),
                              ),
                            ),
                            Positioned(
                              top: 15,
                              right: 15,
                              child: Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: .6),
                                  shape: BoxShape.circle,
                                  color: const Color(0xffFF296A),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Today’s Activity",
                          style: const TextStyle(
                            color: const Color(0xff2D3142),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See Details",
                            style: const TextStyle(
                              color: const Color(0xff468671),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 115,
                          width: 90,
                          decoration: const BoxDecoration(
                            color: const Color(0xff79B9A4),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 49,
                                  height: 49,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                      "assets/images/img.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "1.250",
                                  style: const TextStyle(
                                    color: const Color(0xff2D3142),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Text(
                                  "Calories",
                                  style: const TextStyle(
                                    color: const Color(0xff1E293B),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Container(
                            height: 115,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff79B9A4),
                                width: .5,
                              ),
                              color: const Color(0xffDEFFF4),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: const Color(0xffFF296A),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Squads",
                                                  style: const TextStyle(
                                                    color:
                                                        const Color(0xff2D3142),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const Text(
                                                  "calves, legs, thighs",
                                                  style: const TextStyle(
                                                    color:
                                                        const Color(0xff1E293B),
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            const Text(
                                              "15",
                                              style: const TextStyle(
                                                color: const Color(0xff2D3142),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Text(
                                              "x3",
                                              style: const TextStyle(
                                                color: const Color(0xff2D3142),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    64, 117, 205, .58),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Push-Ups",
                                                  style: const TextStyle(
                                                    color:
                                                        const Color(0xff2D3142),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const Text(
                                                  "biceps, triceps, shoulders",
                                                  style: const TextStyle(
                                                    color:
                                                        const Color(0xff1E293B),
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            const Text(
                                              "12",
                                              style: const TextStyle(
                                                color: const Color(0xff2D3142),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Text(
                                              "x4",
                                              style: const TextStyle(
                                                color: const Color(0xff2D3142),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const MostActiveCard(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Workout Lessons",
                          style: const TextStyle(
                            color: const Color(0xff2D3142),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See Details",
                            style: const TextStyle(
                              color: const Color(0xff468671),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 270,
                            height: 187,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Image.asset(
                                    'assets/images/download1.png',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: 270,
                                    height: 86,
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.greenAccent.withOpacity(0.3),
                                      // color: Color.fromRGBO(222, 225, 224, 0.6),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: const Radius.circular(10),
                                        bottomRight: const Radius.circular(10),
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Body Pumping',
                                              style: const TextStyle(
                                                color: const Color(0xff2D3142),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Text(
                                              'Calories Loss',
                                              style: const TextStyle(
                                                color: const Color(0xff1E293B),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const Row(
                                              children: [
                                                const Text(
                                                  '1.250',
                                                  style: const TextStyle(
                                                    color:
                                                        const Color(0xff2D3142),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                const Text(
                                                  '+4.3%',
                                                  style: const TextStyle(
                                                    color:
                                                        const Color(0xffFF296A),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 28,
                                          height: 28,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: const Center(
                                            child: const Text(
                                              '45%',
                                              style: const TextStyle(
                                                color: const Color(0xffFF296A),
                                                fontSize: 8,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 270,
                            height: 187,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Image.asset(
                                    'assets/images/download1.png',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: 270,
                                    height: 86,
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.greenAccent.withOpacity(0.3),
                                      // color: Color.fromRGBO(222, 225, 224, 0.6),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: const Radius.circular(10),
                                        bottomRight: const Radius.circular(10),
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Body Pumping',
                                              style: const TextStyle(
                                                color: const Color(0xff2D3142),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Text(
                                              'Calories Loss',
                                              style: const TextStyle(
                                                color: const Color(0xff1E293B),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const Row(
                                              children: [
                                                const Text(
                                                  '1.250',
                                                  style: const TextStyle(
                                                    color:
                                                        const Color(0xff2D3142),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                const Text(
                                                  '+4.3%',
                                                  style: const TextStyle(
                                                    color:
                                                        const Color(0xffFF296A),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 28,
                                          height: 28,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: const Center(
                                            child: const Text(
                                              '45%',
                                              style: const TextStyle(
                                                color: const Color(0xffFF296A),
                                                fontSize: 8,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "nutrition plans ",
                          style: const TextStyle(
                            color: const Color(0xff2D3142),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See Details",
                            style: const TextStyle(
                              color: const Color(0xff468671),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 270,
                            height: 187,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Image.asset(
                                    'assets/images/download1.png',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: 270,
                                    height: 86,
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.greenAccent.withOpacity(0.3),
                                      // color: Color.fromRGBO(222, 225, 224, 0.6),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: const Radius.circular(10),
                                        bottomRight: const Radius.circular(10),
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Body Pumping',
                                              style: const TextStyle(
                                                color: const Color(0xff2D3142),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Text(
                                              'Calories Loss',
                                              style: const TextStyle(
                                                color: const Color(0xff1E293B),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const Row(
                                              children: [
                                                const Text(
                                                  '1.250',
                                                  style: const TextStyle(
                                                    color:
                                                        const Color(0xff2D3142),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                const Text(
                                                  '+4.3%',
                                                  style: const TextStyle(
                                                    color:
                                                        const Color(0xffFF296A),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 28,
                                          height: 28,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: const Center(
                                            child: const Text(
                                              '45%',
                                              style: const TextStyle(
                                                color: const Color(0xffFF296A),
                                                fontSize: 8,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 270,
                            height: 187,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Image.asset(
                                    'assets/images/download1.png',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: 270,
                                    height: 86,
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.greenAccent.withOpacity(0.3),
                                      // color: Color.fromRGBO(222, 225, 224, 0.6),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: const Radius.circular(10),
                                        bottomRight: const Radius.circular(10),
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Body Pumping',
                                              style: const TextStyle(
                                                color: const Color(0xff2D3142),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Text(
                                              'Calories Loss',
                                              style: const TextStyle(
                                                color: const Color(0xff1E293B),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const Row(
                                              children: [
                                                const Text(
                                                  '1.250',
                                                  style: const TextStyle(
                                                    color:
                                                        const Color(0xff2D3142),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                const Text(
                                                  '+4.3%',
                                                  style: const TextStyle(
                                                    color:
                                                        const Color(0xffFF296A),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 28,
                                          height: 28,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: const Center(
                                            child: const Text(
                                              '45%',
                                              style: const TextStyle(
                                                color: const Color(0xffFF296A),
                                                fontSize: 8,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: 'Notifications',
          ),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.people),
            label: 'Community',
          ),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
