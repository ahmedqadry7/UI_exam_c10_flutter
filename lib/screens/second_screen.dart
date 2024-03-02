import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class SecondScreen extends StatefulWidget {
  static const String routeName = "SecondScreen";

  SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int tag = 1;
  int _selectedItem = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  List<String> imagesNames = [
    "assets/images/Plank.png",
    "assets/images/yoga_third_page.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/secondPageAvatar.png"),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, Jade",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Ready to workout?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
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
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image(
                                          image: AssetImage(
                                              "assets/images/heartIcon.png")),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text("Heart Rate"),
                                    ],
                                  ),
                                  Text(
                                    "81 BPM",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Container(
                                width: 0.5,
                                height: 50,
                                color: Colors.black,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image(
                                          image: AssetImage(
                                              "assets/images/listIcon.png")),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text("To-do"),
                                    ],
                                  ),
                                  Text(
                                    "32,5 %",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Container(
                                width: 0.5,
                                height: 50,
                                color: Colors.black,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image(
                                          image: AssetImage(
                                              "assets/images/calorieIcon.png")),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text("Calo"),
                                    ],
                                  ),
                                  Text(
                                    "1000 Cal",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Workout Programs",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TabBar(
                      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w300),
                      labelStyle: TextStyle(fontSize: 17,color: Color(0xFF363F71)),
                      unselectedLabelColor: Colors.black,
                      dividerHeight: 0.5,
                      indicatorColor: Color(0xFF363F71),
                      dividerColor: Colors.grey,
                      tabs: [
                        Tab(text: 'All Type'),
                        Tab(text: 'Full Body'),
                        Tab(text: 'Upper'),
                        Tab(text: 'Lower')
                      ],
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView.separated(
                itemBuilder: (context, index) {
                  if (index > 1) {
                    index = 0;
                  }
                  return Image(image: AssetImage(imagesNames[index]));
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: 10,
              ),
              Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Tab 2',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Tab 3',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              Container(
                color: Colors.amber,
                child: Center(
                  child: Text(
                    'Tab 4',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '*',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.telegram),
            label: '*',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            label: '*',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '*',
          ),
        ],
        currentIndex: _selectedItem,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(color: Color(0xFF363F71), fontSize: 14),
        unselectedLabelStyle: TextStyle(color: Color(0xFF363F71), fontSize: 14),
        selectedItemColor: Color(0xFF363F71),
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        onTap: _onItemTapped,
      ),
    );
  }
}
