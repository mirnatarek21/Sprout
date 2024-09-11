import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sprout/screens/sign_up/ready_view.dart';
import '../../constants.dart';
import '../../utils/card3d_widget.dart';
import '../../utils/class_card3d.dart';
import '../../utils/custom_app_button.dart';
import '../../utils/custom_linear_progress_indicator.dart';

class ProfileScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const ProfileScreen(
      {Key? key, required this.currentStep, required this.totalSteps})
      : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedProfile = '';
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 0.7);

  void selectProfile(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 85),
                  CustomLinerStepper(
                    width: 120,
                    totalSteps: widget.totalSteps.toDouble(),
                    step: widget.currentStep.toDouble(),
                    backgroundColor:
                        textColor.withOpacity(0.2), // Adjust as needed
                    activeColor: buttonColor,
                  ),
                  const SizedBox(width: 50),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ReadyScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SharedAxisTransition(
                              animation: animation,
                              secondaryAnimation: secondaryAnimation,
                              transitionType:
                                  SharedAxisTransitionType.horizontal,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      "STEP ${widget.currentStep}/7",
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Profile Picture",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        letterSpacing: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Image.asset('assets/icons/dropdown.png'),
                    const SizedBox(height: 30),
                    Container(
                      height: 120,
                      width: 180, // Set this to the height of your cards
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: 4,
                        onPageChanged: selectProfile,
                        itemBuilder: (context, index) {
                          return AnimatedBuilder(
                            animation: _pageController,
                            builder: (context, child) {
                              double scale = 1;
                              if (_pageController.position.haveDimensions) {
                                double pageOffset = _pageController.page ??
                                    _pageController.initialPage.toDouble();
                                scale = 1 - (pageOffset - index).abs() * 0.3;
                                scale = scale.clamp(0.8,
                                    1.2); // Adjust the scale range as needed
                              }
                              return Transform.scale(
                                scale: scale,
                                child: InkWell(
                                  onTap: () => selectProfile(index),
                                  child: Card23DWidget(
                                    card: Card23D(
                                      image:
                                          'assets/images/card_${index + 1}.png',
                                    ),
                                    width: 100,
                                    height: 100,
                                    color: _currentPage == index
                                        ? pinkShade
                                        : Colors.white,
                                    isSelected: _currentPage == index,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    Image.asset('assets/icons/dropup.png'),
                    const SizedBox(height: 30),
                    const Text(
                      "You can select a photo from one of \nthese emojis or add your own photo as profile picture",
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Add Custom Photo",
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    CustomAppButton(
                      label: "Continue",
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    ReadyScreen(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return SharedAxisTransition(
                                animation: animation,
                                secondaryAnimation: secondaryAnimation,
                                transitionType:
                                    SharedAxisTransitionType.horizontal,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
