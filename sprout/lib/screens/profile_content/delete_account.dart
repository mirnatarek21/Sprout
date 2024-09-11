import 'package:flutter/material.dart';

class deleteaccount extends StatefulWidget {
  const deleteaccount({super.key});

  @override
  State<deleteaccount> createState() => _deleteaccountState();
}

class _deleteaccountState extends State<deleteaccount> {
  bool isobs = true;
  bool state = true;

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
                      'Delete Account',
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
                      "assets/images/download.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Are you sure you want to delete your account?",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "We’re sorry to see you go! Deleting your account is permanent and cannot be undone. This action will remove all your data, including workout history, meal plans, and any saved preferences.",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Divider(
                        height: 4,
                        thickness: 1,
                        color: Color(0xffCCCCCC),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Important Information",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Data Loss:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        Text(
                          "All your fitness progress, personal data, and settings will be permanently deleted.",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Subscription Status:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        Text(
                          "If you have an active subscription, it will be canceled immediately, and you will not be charged again.",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Reactivation:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D3142)),
                        ),
                        Text(
                          "Once your account is deleted, you will not be able to reactivate it or recover any of your data.",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Divider(
                        height: 4,
                        thickness: 1,
                        color: Color(0xffCCCCCC),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: state,
                          onChanged: (val) {
                            state = val!;
                            setState(() {});
                          },
                          checkColor: Color(0xff468671),
                          activeColor: Colors.white.withOpacity(0.5),
                          side: BorderSide(
                            color: Color(0xff468671),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "I understand that my data will be permanently deleted and want to delete my account. ",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff666666)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Divider(
                        height: 4,
                        thickness: 1,
                        color: Color(0xffCCCCCC),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter Your Password",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff666666)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: isobs ? true : false,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                isobs = !isobs;
                                setState(() {});
                              },
                              icon: isobs
                                  ? Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Color(0xffBCDCD1),
                                    )
                                  : Icon(
                                      Icons.visibility_off_outlined,
                                      color: Color(0xffBCDCD1),
                                    ),
                            ),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffBCDCD1),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffBCDCD1),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 50,
                      width: 270,
                      decoration: BoxDecoration(
                        color: Color(0xffFF296A),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Delete My Account",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
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
