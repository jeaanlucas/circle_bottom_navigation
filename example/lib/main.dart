import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Circle Bottom Navigation Example',
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'Test Circle Navigation'
          ),
        ),
      ),
      bottomNavigationBar: CircleBottomNavigation(
        barHeight: 70,
        circleSize: 65,
        initialSelection: currentPage,
        inactiveIconColor: Colors.grey,
        textColor: Colors.black,
        tabs: [
          TabData(
            icon: Icons.home,
            iconSize: 35,
            title: "Home",
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.history,
            iconSize: 35,
            title: "History",
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.search,
            iconSize: 35,
            title: "Search",
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.alarm,
            iconSize: 35,
            title: "Alarm",
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ],
        onTabChangedListener: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}
