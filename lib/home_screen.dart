import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = ["assets/images/1.jpg", "assets/images/2.jpg"];
  //////////////////////////////////////////
  final PageController _controller = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    /////////////////////////////////////////
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          ////////////////////////////////////////
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.settings),
              ),
              Tab(
                icon: Icon(Icons.person),
              )
            ],
          ),
          title: Text("Exam"),
        ),
        ////////////////////////////////////////////
        body: TabBarView(
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                Container(
                  height: 300,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: images.length,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.all(10),
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 91, 80, 50),
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "Warm effect",
                      style: TextStyle(fontSize: 20),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                          controller: _controller, count: images.length),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "Expanding Dots effect",
                      style: TextStyle(fontSize: 20),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: images.length,
                        effect: ExpandingDotsEffect(),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "Jumping Dots effect",
                      style: TextStyle(fontSize: 20),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: images.length,
                        effect: JumpingDotEffect(),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "Scrolling Dots effect",
                      style: TextStyle(fontSize: 20),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: images.length,
                        effect: ScrollingDotsEffect(),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "Scrolling Dots effect",
                      style: TextStyle(fontSize: 20),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: images.length,
                        effect: SwapEffect(),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              color: Colors.orange,
            ),
            Center(
              child: badges.Badge(
                badgeContent: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(Icons.settings, size: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
