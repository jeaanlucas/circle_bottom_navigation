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
        circleSize: 35,
        arcHeight: 45,
        arcWidth: 75,
        barHeight: 55,
        initialSelection: currentPage,
        inactiveIconColor: Colors.grey,
        textColor: Colors.black,
        tabs: [
          TabData(
            iconData: Icons.home,
            title: "Home",
          ),
          TabData(
            iconData: Icons.history,
            title: "History",
          ),
          TabData(
            iconData: Icons.search,
            title: "Search",
          ),
          TabData(
            iconData: Icons.alarm,
            title: "Alarm",
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
