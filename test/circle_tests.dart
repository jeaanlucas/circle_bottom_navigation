import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';

void main() {
  Widget makeWidget({
    Widget child,
  }) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      home: Scaffold(
        body: Center(),
        bottomNavigationBar: child,
      ),
    );
  }

  testWidgets('Circle has correct tabs', (WidgetTester tester) async {
    CircleBottomNavigation child = CircleBottomNavigation(
      tabs: [
        TabData(
          iconData: Icons.home,
          title: "Home",
        ),
        TabData(
          iconData: Icons.history,
          title: "History",
        ),
      ],
      onTabChangedListener: (position) {},
    );

    await tester.pumpWidget(
      makeWidget(
        child: child,
      ),
    );

    final homeTabFinder = find.text("Home");
    expect(homeTabFinder, findsOneWidget);

    final homeIconTabFinder = find.byIcon(Icons.home);
    expect(homeIconTabFinder, findsNWidgets(2));

    final searchTabFinder = find.text("History");
    expect(searchTabFinder, findsOneWidget);

    final searchIconTabFinder = find.byIcon(Icons.history);
    expect(searchIconTabFinder, findsOneWidget);

    final randomTabFinder = find.text("Search");
    expect(randomTabFinder, findsNothing);

    final randomIconTabFinder = find.byIcon(Icons.search);
    expect(randomIconTabFinder, findsNothing);
  });
}
