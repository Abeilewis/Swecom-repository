import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swecom_app/theme/app_styles.dart';

class NatureScreen extends StatefulWidget {
  const NatureScreen({super.key});

  @override
  State<NatureScreen> createState() => _NatureScreenState();
}

class _NatureScreenState extends State<NatureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/nature-bg.png"),
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
                    left: 40,
                    right: 20,
                  ),
                  child: Image.asset(
                    "assets/images/nature-top-card.png",
                    fit: BoxFit.cover,
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
                          "assets/images/nature-icon.png",
                          width: 90,
                        ),
                        Column(
                          children: [
                            GestureDetector(
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
                        "assets/images/nat-img-1.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/nat-img-2.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/nat-img-3.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/nat-img-4.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/nat-img-5.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/nat-img-6.png",
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
