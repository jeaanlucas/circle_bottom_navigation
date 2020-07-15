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
        body: const Center(),
        bottomNavigationBar: child,
      ),
    );
  }

  Widget _returnCircleNav() {
    return CircleBottomNavigation(
      initialSelection: 0,
      tabs: [
        TabData(
          icon: Icons.home,
          title: 'Home',
        ),
        TabData(
          icon: Icons.history,
          title: 'History',
        ),
      ],
      onTabChangedListener: (position) {},
    );
  }

  testWidgets('Test if circle has correct tabs', (WidgetTester tester) async {
    await tester.pumpWidget(
      makeWidget(
        child: _returnCircleNav(),
      ),
    );

    final homeTabFinder = find.text('Home');
    final homeIconTabFinder = find.byIcon(Icons.home);
    final historyTabFinder = find.text('History');
    final historyIconTabFinder = find.byIcon(Icons.history);
    final randomTabFinder = find.text('Search');
    final randomIconTabFinder = find.byIcon(Icons.search);

    expect(homeTabFinder, findsOneWidget);
    expect(homeIconTabFinder, findsNWidgets(2));
    expect(historyTabFinder, findsOneWidget);
    expect(historyIconTabFinder, findsOneWidget);
    expect(randomTabFinder, findsNothing);
    expect(randomIconTabFinder, findsNothing);
  });

  testWidgets('Test if clicking icon moves the circle', (WidgetTester tester) async {
    await tester.pumpWidget(
      makeWidget(
        child: _returnCircleNav(),
      ),
    );

    final homeIconTabFinder = find.byIcon(Icons.home);
    final historyIconTabFinder = find.byIcon(Icons.history);

    await tester.tap(historyIconTabFinder);
    await tester.pumpAndSettle();

    await tester.tap(homeIconTabFinder);
    await tester.pumpAndSettle();
  });
}
