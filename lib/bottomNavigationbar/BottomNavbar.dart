import 'package:flutter/material.dart';
import 'package:login_logout/Data/DataFile.dart';
import 'package:login_logout/ViewCarDetails/ViewCarDetails.dart';
import 'package:login_logout/bottomNavigationbar/BottomTabbar/TabBarEconomy.dart';
import 'package:login_logout/bottomNavigationbar/BottomTabbar/tabBarAll.dart';
import 'package:login_logout/bottomNavigationbar/BottomTabbar/tabBarLuxury.dart';
import 'package:login_logout/bottomNavigationbar/BottomTabbar/tabBarSports.dart';
import 'package:login_logout/bottomNavigationbar/BottomTabbar/tabBarSuv.dart';

class BottomNavigationHome extends StatefulWidget {
  const BottomNavigationHome({super.key});

  @override
  State<BottomNavigationHome> createState() => _BottomNavigationHomeState();
}

class _BottomNavigationHomeState extends State<BottomNavigationHome>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(35, 226, 243, 244),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey,
          elevation: 30,
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text("Option ${index + 1}"),
              );
            }),
          ),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const NeverScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                Row(children: [
                  Container(
                    height: 47,
                    width: 270,
                    margin: const EdgeInsets.only(left: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 15, left: 20),
                        hintText: " Search",
                        suffixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 217, 196, 6),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Icon(Icons.tune_rounded),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    isScrollable: true,
                    labelPadding: const EdgeInsets.only(left: 15, right: 20),
                    controller: tabController,
                    labelColor: Colors.black,
                    indicator: CircleTabIndicator(color: Colors.red, radius: 4),
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(
                        text: "All",
                      ),
                      Tab(
                        text: "Economy",
                      ),
                      Tab(
                        text: "Luxury",
                      ),
                      Tab(
                        text: "SUV",
                      ),
                      Tab(
                        text: "Sports",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    child:
                        TabBarView(controller: tabController, children: const [
                      BottomTabBarAll(),
                      BottomTabBarEconomy(),
                      BottomTabBarLuxury(),
                      BottomTabBarSUV(),
                      BottomTabBarSports()
                    ]),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const ListTile(
                          leading: Text(
                            "Top Offers",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.more_horiz),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 125,
                          width: double.maxFinite,
                          margin: const EdgeInsets.only(left: 15),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: topCars.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => ViewCarDetails(
                                          listName: topCars, index: index)),
                                    ),
                                  );
                                }),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 200,
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    Positioned(
                                      top: 35,
                                      left: 25,
                                      child: SizedBox(
                                        height: 50,
                                        width: 60,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.asset(
                                            topCars[index]['path'],
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 35,
                                      left: 95,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${topCars[index]['name']}",
                                            style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${topCars[index]['price']}",
                                            style: const TextStyle(
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 12,
                                      right: 30,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 227, 205, 4),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "+",
                                            style: TextStyle(
                                                fontSize: 32,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
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
  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint paint;
    paint = Paint()..color = color;
    paint = paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, paint);
  }
}
