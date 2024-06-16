import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swecom_app/screens/auth/login.dart';
import 'package:swecom_app/screens/auth/sign_up.dart';
import 'package:swecom_app/theme/app_colors.dart';
import 'package:swecom_app/theme/app_styles.dart';
import 'package:swecom_app/widgets/primary_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
          children: [
            Image.asset(
              "assets/images/onboarding_top_logo.png",
              height: 150,
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Hey!",
                    style: AppStyles.smallBodyText.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: "We've Some",
                    style: AppStyles.smallBodyText.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Text(
              "EXCITING BUNDLES",
              style: AppStyles.bodyText.copyWith(
                height: 1,
                fontWeight: FontWeight.w800,

                color: AppColors.primaryLightColor,
              ),
            ),
            Text(
              "ready for you!",
                style: AppStyles.smallBodyText.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,)
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: PrimaryButton(
                buttonText: "Create an account",
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: PrimaryButton(
                buttonText: "Sign In",
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogInScreen(),
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
