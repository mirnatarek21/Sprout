import 'package:flutter/material.dart';

class privacypolicy extends StatefulWidget {
  const privacypolicy({super.key});

  @override
  State<privacypolicy> createState() => _privacypolicyState();
}

class _privacypolicyState extends State<privacypolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Privacy Policy',
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
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "1. Information We Collect",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Personal Information:",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "When you create an account or use our services, we may collect personal information that can identify you, such as your name, email address, phone number, and payment information.",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Usage Data:",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "We may also collect information about how you access and use our website, including your IP address, browser type, device information, pages visited, and the time and date of your visit.",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Health Information:",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "To provide personalized fitness and nutrition plans, we may collect health-related information such as your age, weight, height, dietary preferences, and fitness goals.",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Divider(
                        height: 4,
                        thickness: 0.5,
                        color: Color(0xffDADADA),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "2. How We Use Your Information",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "We use the information we collect for various purposes, including:"
                          "- To provide and maintain our services"
                          "- To personalize your experience"
                          "- To communicate with you regarding your account or services"
                          "- To process transactions and manage billing"
                          "- To improve our website and services through analytics"
                          "- To send you promotional content and updates (you can opt out at any time)"
                          "- To comply with legal obligations",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "3. Disclosure of Your Information",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "We do not sell or rent your personal information to third parties. We may share your information in the following situations:",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "With Service Providers:",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "We may share your information with third-party service providers who assist us in operating our website and delivering our services.",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "For Legal Reasons:",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "We may disclose your information if required to do so by law or in response to valid requests by public authorities.",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Business Transfers:",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "If Sprout is involved in a merger, acquisition, or asset sale, your personal information may be transferred as part of that transaction.",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "4. Data Security",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "We take reasonable measures to protect the information we collect from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your personal information, we cannot guarantee its absolute security.",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "5. Your Rights",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Depending on your location and applicable laws, you may have certain rights regarding your personal information, including:"
                          "- The right to access the personal information we hold about you."
                          "- The right to request correction of inaccurate or incomplete data."
                          "- The right to request deletion of your personal information."
                          "- The right to withdraw consent where we rely on consent to process your personal information.",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "6. Third-Party Links",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Our website may contain links to third-party websites that are not operated by us. If you click on a third-party link, you will be directed to that third",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
