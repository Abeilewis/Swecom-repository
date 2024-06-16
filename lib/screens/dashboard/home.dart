import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swecom_app/screens/dashboard/profile.dart';
import 'package:swecom_app/screens/dashboard/sub_screens/business.dart';
import 'package:swecom_app/screens/dashboard/sub_screens/education.dart';
import 'package:swecom_app/screens/dashboard/sub_screens/movies.dart';
import 'package:swecom_app/screens/dashboard/sub_screens/nature.dart';
import 'package:swecom_app/screens/dashboard/sub_screens/news.dart';
import 'package:swecom_app/screens/dashboard/sub_screens/sports.dart';
import 'package:swecom_app/theme/app_colors.dart';
import 'package:swecom_app/theme/app_styles.dart';
import 'package:swecom_app/widgets/primary_button.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        automaticallyImplyLeading: false,
        leading: Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset("assets/icons/icon-menu.svg"),
            ),
          );
        }),
        title: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            child: SvgPicture.asset("assets/icons/icon-user.svg"),
          ),
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Container(
          // height: MediaQuery.of(context).size.height,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/sidebar-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Image.asset("assets/images/sidebar-top-img.png"),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Wrap(
                    spacing: 30,
                    runSpacing: 30,
                    alignment: WrapAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SportsScreen(),
                            ),
                          );
                        },
                        child: Image.asset("assets/images/sports.png"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MoviesScreen(),
                            ),
                          );
                        },
                        child: Image.asset("assets/images/movies.png"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EducationScreen(),
                            ),
                          );
                        },
                        child: Image.asset("assets/images/education.png"),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NewsScreen(),
                              ),
                            );
                          },
                          child: Image.asset("assets/images/news.png")),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NatureScreen(),
                            ),
                          );
                        },
                        child: Image.asset("assets/images/nature.png"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BusinessScreen(),
                            ),
                          );
                        },
                        child: Image.asset("assets/images/business.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        Container(
                          height: 250,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/carousel_bg.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Text(
                            'text $i',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    AppColors.darkColor,
                                    Colors.transparent
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Big Brother Titants ...",
                                  style: AppStyles.smallHeader.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: PrimaryButton(
                                      buttonText: "Get Now", onClick: () {}),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 250,
                aspectRatio: 16 / 9,
                viewportFraction: 0.99,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,

                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 1,
                color: AppColors.grey,
              ))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/img-1.png",
                    height: 100,
                    width: 130,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Premium Subscribers can get 100% off on their Showmax subscription - The world's best entertainment for free!",
                          style: AppStyles.smallBodyText.copyWith(
                              color: AppColors.darkColor,
                              height: 1.1,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Our new packages make the best  viewing experience even better.",
                          style: AppStyles.smallBodyText.copyWith(
                              color: AppColors.darkColor, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              'Know More',
                              style: AppStyles.smallBodyText.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 1,
                color: AppColors.grey,
              ))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/img-2.png",
                    height: 100,
                    width: 130,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enjoy your Best Shows!",
                          style: AppStyles.smallBodyText.copyWith(
                              color: AppColors.darkColor,
                              height: 1.1,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Your DStv decoder and satellite dish allow you to switch on the fun and connect to a whole new world of entertainment. you'll be ready to watch and enjoy the great entertainment that DStv has to offer!",
                          style: AppStyles.smallBodyText.copyWith(
                              color: AppColors.darkColor, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                            'Know More',
                            style: AppStyles.smallBodyText.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.footerBg,
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Other Services",
                    style: AppStyles.smallHeader.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          constraints: BoxConstraints(
                            maxWidth: 140,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.footerBgLight,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Column(
                            children: [
                              Image.asset("assets/images/package-img.png"),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Package Insurance",
                                textAlign: TextAlign.center,
                                style: AppStyles.bodyText.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "One-for-all package policy",
                                textAlign: TextAlign.center,
                                style: AppStyles.smallBodyText,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          constraints: BoxConstraints(
                            maxWidth: 140,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.footerBgLight,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Column(
                            children: [
                              Image.asset("assets/images/fibre-img.png"),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Fibre",
                                textAlign: TextAlign.center,
                                style: AppStyles.bodyText.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Wait no more! Get a new  connection now.",
                                textAlign: TextAlign.center,
                                style: AppStyles.smallBodyText,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          constraints: BoxConstraints(
                            maxWidth: 140,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.footerBgLight,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Column(
                            children: [
                              Image.asset("assets/images/home-safety-img.png"),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Home Safety",
                                textAlign: TextAlign.center,
                                style: AppStyles.bodyText.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Most trusted app to  keep you and your family safe",
                                textAlign: TextAlign.center,
                                style: AppStyles.smallBodyText,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          constraints: BoxConstraints(
                            maxWidth: 140,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.footerBgLight,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Column(
                            children: [
                              Image.asset("assets/images/fsp-img.png"),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "FSP",
                                textAlign: TextAlign.center,
                                style: AppStyles.bodyText.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Simplifying financial decisionsy",
                                textAlign: TextAlign.center,
                                style: AppStyles.smallBodyText,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
