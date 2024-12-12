import 'package:expenz/data/onboarding_data.dart';
import 'package:expenz/screens/onboarding/front_page.dart';
import 'package:expenz/screens/onboarding/shared_onboarding.dart';
import 'package:expenz/screens/user_data_screen.dart';
import 'package:expenz/utils/colors.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool showDetailPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                //Screens
                PageView(
                  onPageChanged: (index) {
                    if (index == 3) {
                      setState(() {
                        showDetailPage = true;
                      });
                    } else {
                      setState(() {
                        showDetailPage = false;
                      });
                    }
                  },
                  controller: _controller,
                  children: [
                    const FrontPage(),
                    SharedOnboarding(
                      image: OnboardingData.onboardingDataList[0].image,
                      title: OnboardingData.onboardingDataList[0].title,
                      description:
                          OnboardingData.onboardingDataList[0].description,
                    ),
                    SharedOnboarding(
                      image: OnboardingData.onboardingDataList[1].image,
                      title: OnboardingData.onboardingDataList[1].title,
                      description:
                          OnboardingData.onboardingDataList[1].description,
                    ),
                    SharedOnboarding(
                      image: OnboardingData.onboardingDataList[2].image,
                      title: OnboardingData.onboardingDataList[2].title,
                      description:
                          OnboardingData.onboardingDataList[2].description,
                    ),
                  ],
                ),
                Container(
                  alignment: const Alignment(0, 0.75),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: const WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                      dotHeight: 14,
                      dotWidth: 14,
                      spacing: 8,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  left: 0,
                  child: showDetailPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserDataScreen(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: CustomButton(
                              buttonName:
                                  showDetailPage ? 'Get Started' : 'Next',
                              color: kMainColor,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.animateToPage(
                                _controller.page!.toInt() + 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: CustomButton(
                              buttonName:
                                  showDetailPage ? 'Get Started' : 'Next',
                              color: kMainColor,
                            ),
                          ),
                        ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
