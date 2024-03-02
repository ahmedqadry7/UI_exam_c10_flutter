// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_exam/scrolled_container.dart';

class ThirdScreen extends StatefulWidget {
  static const String routeName = "ThirdScreen";

  ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int _selectedItem = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  final List<String> images = [
    "assets/images/thirdScreenSwap1.png",
    "assets/images/thirdScreenSwap2.png"
  ];

  final PageController _controller = PageController(viewportFraction: 0.92);

  List<String> words = ["Discover", "News", "Most Viewed", "Saved", "Other"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/thirdScreenAppBarLogo.png")),
            SizedBox(
              width: 5,
            ),
            Text(
              "AliceCare",
              style: GoogleFonts.milonga(
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Articles, Video, Audio and More,...",
                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ScrolledContainer(
                      word: words[index],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: words.length,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Hot topics",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "See all",
                    style: TextStyle(
                        color: Color(0xFF7E56D8),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Color(0xFF7E56D8),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: double.infinity,
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
                          image: AssetImage(images[index]), fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Get Tips",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Image(
                  image: AssetImage("assets/images/thirdPageFrame.png"),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text("Cycle Phases and Period",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                  Spacer(),
                  Text(
                    "See all",
                    style: TextStyle(
                        color: Color(0xFF7E56D8),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Color(0xFF7E56D8),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Insights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedItem,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(color: Color(0xFF7E56D8), fontSize: 14),
        unselectedLabelStyle: TextStyle(color: Color(0xFF7E56D8), fontSize: 14),
        selectedItemColor: Color(0xFF7E56D8),
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        onTap: _onItemTapped,
      ),
    );
  }
}
