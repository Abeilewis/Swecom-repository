import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swecom_app/screens/auth/onboarding.dart';
import 'package:swecom_app/theme/app_colors.dart';
import 'package:swecom_app/theme/app_styles.dart';
import 'package:swecom_app/widgets/primary_button.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash_screen.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                "assets/images/logo.png",
                height: 150,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "welcome!",
              style: AppStyles.header.copyWith(
                fontWeight: FontWeight.w400,
                height: 1.1,
                color: AppColors.white,
              ),
            ),
            Text(
              "Let's Start Your",
              style: AppStyles.header.copyWith(
                fontWeight: FontWeight.w400,
                height: 1.1,
                color: AppColors.white,
              ),
            ),
            Text(
              "Entertainment",
              style: AppStyles.header.copyWith(
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                  color: AppColors.white,
                  fontSize: 32),
            ),
            Text(
              "Journey",
              style: AppStyles.header.copyWith(
                height: 1.1,
                  fontWeight: FontWeight.w800,
                  color: AppColors.white,
                  fontSize: 32),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: PrimaryButton(
                buttonText: "Get Started",
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
