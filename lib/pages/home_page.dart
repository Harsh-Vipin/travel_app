import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var image = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          //discover text
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: const AppLargeText(text: "Discover")),
          const SizedBox(
            height: 30,
          ),
          //tab bar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  indicator:
                      CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: const [
                    Tab(
                      text: "Places",
                    ),
                    Tab(
                      text: "Inspiration",
                    ),
                    Tab(
                      text: "Emotions",
                    ),
                  ]),
            ),
          ),
          //tab bar view
          Container(
            height: 300,
            width: double.maxFinite,
            padding: const EdgeInsets.only(left: 20),
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 200,
                      height: 300,
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage("img/mountain.jpeg"),
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
                Text("HI"),
                Text("HI"),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppLargeText(
                  text: "Explore more",
                  size: 22,
                ),
                AppText(
                  text: "See all",
                  color: AppColors.textColor1,
                  size: 16,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 120,
            width: double.maxFinite,
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          //margin: const EdgeInsets.only(right: 50,),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(
                                    "img/" + image.keys.elementAt(index)),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: AppText(
                            color: AppColors.textColor2,
                            size: 16,
                            text: image.values.elementAt(index),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
