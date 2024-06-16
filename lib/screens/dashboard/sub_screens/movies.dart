import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swecom_app/theme/app_colors.dart';
import 'package:swecom_app/theme/app_styles.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/movies-bg.png"),
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
                      Wrap(
                        spacing: 13,
                        runSpacing: 20,
                        children: [
                          Image.asset(
                            "assets/images/movie-card-1.png",
                            width: 115,
                          ),
                          Image.asset(
                            "assets/images/movie-card-2.png",
                            width: 115,
                          ),
                          Image.asset(
                            "assets/images/movie-card-3.png",
                            width: 115,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending News",
                            style: AppStyles.smallBodyText
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Container(
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
                          )
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
                          "assets/images/movies-icon.png",
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
                        "assets/images/movie-img-1.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/movie-img-2.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/movie-img-3.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/movie-img-4.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/movie-img-5.png",
                        width: 120,
                      ),
                      Image.asset(
                        "assets/images/movie-img-6.png",
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
