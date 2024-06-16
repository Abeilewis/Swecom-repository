import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swecom_app/screens/auth/firebase/auth_config.dart';
import 'package:swecom_app/screens/auth/onboarding.dart';
import 'package:swecom_app/theme/app_colors.dart';
import 'package:swecom_app/theme/app_styles.dart';
import 'package:swecom_app/widgets/primary_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgPicture.asset(
                    "assets/icons/back-icon.svg",
                    width: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/profile-item-bg.png"),
                        fit: BoxFit.cover),
                    border: Border(
                        bottom:
                            BorderSide(width: 2, color: AppColors.darkColor))),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/active-bundle.svg",
                      width: 35,
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Text(
                      "active bundles",
                      textAlign: TextAlign.center,
                      style: AppStyles.bodyText.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/profile-item-bg.png"),
                        fit: BoxFit.cover),
                    border: Border(
                        bottom:
                            BorderSide(width: 2, color: AppColors.darkColor))),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/notice-icon.svg",
                      width: 30,
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Text(
                      "notices",
                      textAlign: TextAlign.center,
                      style: AppStyles.bodyText
                          .copyWith(fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/profile-item-bg.png"),
                        fit: BoxFit.cover),
                    border: Border(
                        bottom:
                            BorderSide(width: 2, color: AppColors.darkColor))),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/settings-icon.svg",
                      width: 35,
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Text(
                      "settings",
                      textAlign: TextAlign.center,
                      style: AppStyles.bodyText
                          .copyWith(fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/profile-item-bg.png"),
                        fit: BoxFit.cover),
                    border: Border(
                        bottom:
                            BorderSide(width: 2, color: AppColors.darkColor))),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/customer-service-icon.svg",
                      width: 35,
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Text(
                      "customer service",
                      textAlign: TextAlign.center,
                      style: AppStyles.bodyText
                          .copyWith(fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/profile-item-bg.png"),
                        fit: BoxFit.cover),
                    border: Border(
                        bottom:
                            BorderSide(width: 2, color: AppColors.darkColor))),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/about-us-icon.svg",
                      width: 35,
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Text(
                      "about us",
                      textAlign: TextAlign.center,
                      style: AppStyles.bodyText
                          .copyWith(fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await AuthService().signOut(context);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/profile-item-bg.png"),
                          fit: BoxFit.cover),
                      border: Border(
                          bottom: BorderSide(
                              width: 2, color: AppColors.darkColor))),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/logout.svg",
                        width: 35,
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Text(
                        "logout",
                        textAlign: TextAlign.center,
                        style: AppStyles.bodyText
                            .copyWith(fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
