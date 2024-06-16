import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swecom_app/screens/dashboard/pay.dart';
import 'package:swecom_app/screens/dashboard/sub_screens/news.dart';
import 'package:swecom_app/theme/app_colors.dart';
import 'package:swecom_app/theme/app_styles.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({super.key});

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sports-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
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
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "News & Articles",
                            style: AppStyles.smallBodyText
                                .copyWith(fontWeight: FontWeight.w700,fontSize: 16,),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NewsScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10,),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 2, color: AppColors.primaryColor,),
                              ),
                              child: Text(
                                "More",
                                style: AppStyles.smallBodyText.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 13,
                        runSpacing: 20,
                        children: [
                          Image.asset(
                            "assets/images/sports-card-1.png",
                            width: 120,
                          ),
                          Image.asset(
                            "assets/images/sports-card-2.png",
                            width: 120,
                          ),
                          Image.asset(
                            "assets/images/sports-card-3.png",
                            width: 120,
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    margin: const EdgeInsets.only(left: 30, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage("assets/images/main-detail-bg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/sports-icon.png",
                          width: 90,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PaymentScreen(),
                                  ),
                                );
                              },
                              child: SvgPicture.asset(
                                "assets/icons/icon-card.svg",
                                width: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "make payment",
                              style: AppStyles.labels,
                            )
                          ],
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runSpacing: 30,
                    children: [
                      Image.asset(
                        "assets/images/sport-img-1.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/sport-img-2.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/sport-img-3.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/sport-img-4.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/sport-img-5.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/sport-img-6.png",
                        width: 120,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
