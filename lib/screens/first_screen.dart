import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:badges/badges.dart' as badges;

class FirstScreen extends StatefulWidget {
  static const String routeName = "firstScreen";

  FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _selectedItem = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  final List<String> images = [
    "assets/images/walkingthedog1.png",
    "assets/images/walkingthedog2.png"
  ];

  final PageController _controller = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/first_screen_logo.png"),
        title: Text(
          "Moody",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: badges.Badge(
              badgeContent: Text(
                '',
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(Icons.notifications, size: 30),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '*',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: '*',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '*',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '*',
          ),
        ],
        currentIndex: _selectedItem,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(color: Color(0xFF027948), fontSize: 20),
        selectedItemColor: Color(0xFF027948),
        unselectedItemColor: Colors.grey,
        iconSize: 35,
        onTap: _onItemTapped,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  "Hello, ",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  "Sara Rose",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              "How are you feeling today ?",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage("assets/images/love.png"),
                      height: 80,
                    ),
                    Text("Love"),
                  ],
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage("assets/images/cool.png"),
                      height: 80,
                    ),
                    Text("Cool"),
                  ],
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage("assets/images/happy.png"),
                      height: 80,
                    ),
                    Text("Happy"),
                  ],
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage("assets/images/sad.png"),
                      height: 80,
                    ),
                    Text("Sad"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  "Feature",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "See more",
                  style: TextStyle(
                      color: Color(0xFF027948), fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 3),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Color(0xFF027948),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 350,
              child: PageView.builder(
                controller: _controller,
                itemCount: images.length,
                itemBuilder: (context, index) => Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Positive vibes",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Boost your mood with",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            Text(
                              "positive vibes",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.green,
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("10 mins")
                              ],
                            )
                          ],
                        ),
                        Image(image: AssetImage(images[index]))
                      ],
                    ),
                  ),
                  margin: EdgeInsets.all(10),
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFECFDF3),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: SmoothPageIndicator(
                  effect: ScrollingDotsEffect(),
                  controller: _controller,
                  count: images.length),
            ),
            Row(
              children: [
                Text(
                  "Exercise",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                Text(
                  "See more",
                  style: TextStyle(
                      color: Color(0xFF027948), fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 3),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Color(0xFF027948),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF9F5FF),
                  ),
                  width: 150,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image(image: AssetImage("assets/images/relaxation.png")),
                      Text(
                        "Relaxation",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFDF2FA),
                  ),
                  width: 150,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image(image: AssetImage("assets/images/meditation.png")),
                      Text(
                        "Meditaion",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFFFAF5),
                  ),
                  width: 150,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image(image: AssetImage("assets/images/breathing.png")),
                      Text(
                        "Breathing",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF0F9FF),
                  ),
                  width: 150,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image(image: AssetImage("assets/images/yoga.png")),
                      Text(
                        "Yoga",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
