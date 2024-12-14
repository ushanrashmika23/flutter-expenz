import 'package:expenz/utils/colors.dart';
import 'package:flutter/material.dart';

class SharedOnboarding extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const SharedOnboarding({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: kMainColor,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: kGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
