import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swecom_app/screens/auth/firebase/auth_config.dart';
import 'package:swecom_app/screens/auth/login.dart';
import 'package:swecom_app/screens/helper/widgets.dart';
import 'package:swecom_app/theme/app_colors.dart';
import 'package:swecom_app/theme/app_styles.dart';
import 'package:swecom_app/widgets/primary_button.dart';
import 'package:swecom_app/widgets/text_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/splash_screen.png"),
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/onboarding_top_logo.png",
                    height: 150,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Sign up with ",
                                  style: AppStyles.bodyText.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                                TextSpan(
                                  text: "Email",
                                  style: AppStyles.smallHeader.copyWith(
                                      height: 1,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryLightColor),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email:",
                              style: AppStyles.bodyText.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            controller: _emailController,
                            sideIcon: Icon(
                              Icons.mail_outline,
                              color: AppColors.mediumGrey,
                            ),
                            placeholder: "john@gmail.com",
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Email is required.";
                              }
                              if (!_isValidEmail(val)) {
                                return "Please enter a valid email.";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Password:",
                              style: AppStyles.bodyText.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Stack(
                            children: [
                              CustomTextField(
                                controller: _passwordController,
                                obscureText: hidePassword,
                                sideIcon: Icon(
                                  Icons.lock_outline,
                                  color: AppColors.mediumGrey,
                                ),
                                placeholder: "********************",
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Password is required";
                                  }
                                  if (val.length < 6) {
                                    return "Password must contain at least 6 characters";
                                  }
                                  return null;
                                },
                              ),
                              Positioned(
                                right: 8,
                                top: 20,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  child: Icon(
                                    hidePassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 25,
                                    color: AppColors.darkGrey,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Confirm Password:",
                              style: AppStyles.bodyText.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Stack(
                            children: [
                              CustomTextField(
                                controller: _confirmPasswordController,
                                obscureText: hideConfirmPassword,
                                sideIcon: Icon(
                                  Icons.lock_outline,
                                  color: AppColors.mediumGrey,
                                ),
                                placeholder: "********************",
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Confirm Password is required";
                                  }
                                  if (val.length < 6) {
                                    return "Password must contain at least 6 characters.";
                                  }
                                  if (val != _passwordController.text) {
                                    return "Passwords do not match.";
                                  }
                                  return null;
                                },
                              ),
                              Positioned(
                                right: 8,
                                top: 20,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      hideConfirmPassword =
                                          !hideConfirmPassword;
                                    });
                                  },
                                  child: Icon(
                                    hideConfirmPassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 25,
                                    color: AppColors.darkGrey,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: PrimaryButton(
                              buttonText: "Sign Up",
                              onClick: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  final response =
                                      await AuthService().registration(
                                    context: context,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "already have an account?",
                            style: AppStyles.bodyText.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LogInScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "login",
                              style: AppStyles.bodyText.copyWith(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        if (isLoading) showIsLoading()
      ],
    );
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }
}
