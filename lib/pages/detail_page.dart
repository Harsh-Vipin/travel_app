import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

import '../misc/colors.dart';
import '../widgets/app_buttons.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/mountain.jpeg"),
                        fit: BoxFit.cover)),
              )),
              Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                      )
                    ],
                  )),
              Positioned(
                  top: 320,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppLargeText(
                                  text: "Yosemite",
                                  color: Colors.black.withOpacity(0.8),
                                ),
                                const AppLargeText(
                                  text: "\$ 250",
                                  color: AppColors.mainColor,
                                )
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: "USA, California",
                                size: 16,
                                color: AppColors.textColor1,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < gottenStars
                                        ? AppColors.starColor
                                        : AppColors.textColor1,
                                  );
                                }),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              AppText(
                                text: "(4.0)",
                                color: AppColors.textColor2,
                                size: 16,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          AppLargeText(
                            text: "People",
                            size: 20,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const AppText(
                            text: "Number of people in your group",
                            color: AppColors.mainTextColor,
                            size: 16,
                          ),
                          Wrap(
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButtons(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    borderColor: AppColors.buttonBackground,
                                    size: 50,
                                    text: (index + 1).toString(),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppLargeText(
                            text: "Description",
                            size: 20,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppText(
                            text:
                                "You must go for a travel. Travelling helps get rid of pressure. Go to the mountains to see the nature.",
                            color: AppColors.mainTextColor,
                            size: 16,
                          )
                        ]),
                  )),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                          color: AppColors.textColor2,
                          backgroundColor: Colors.white,
                          borderColor: AppColors.textColor2,
                          icon: Icons.favorite_border,
                          size: 60),
                      SizedBox(
                        width: 20,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
