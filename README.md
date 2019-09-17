# Circle Bottom Navigation

## Getting Started

Add the plugin:

```yaml
dependencies:
  ...
  circle_bottom_navigation: ^0.1.0
```

## Usage

```dart
bottomNavigationBar: CircleBottomNavigation(
  initialSelection: currentPage,
  tabs: [
    TabData(icon: Icons.home, title: "Home"),
    TabData(icon: Icons.history, title: "History"),
    TabData(icon: Icons.search, title: "Search"),
    TabData(icon: Icons.alarm, title: "Alarm"),
  ],
  onTabChangedListener: (index) {
    setState(() {
      currentPage = index;
    });
  },
)
```

## Attributes
### required
**initialSelection** -> The number of your main page<br/>
**tabs** -> List of `TabData` objects<br/>
**onTabChangedListener** -> Function to handle a tap on a tab, receives `int position`

### optional
**circleColor** -> Defaults to null, derives from `Theme`<br/>
**activeIconColor** -> Defaults to null, derives from `Theme`<br/>
**inactiveIconColor** -> Defaults to null, derives from `Theme`<br/>
**textColor** -> Defaults to null, derives from `Theme`<br/>
**barBackgroundColor** -> Defaults to null, derives from `Theme`<br/>
**circleSize** -> Defaults to 60, size of intern circle<br/>
**barHeight** -> Defaults to 60, height of bar<br/>
**arcHeight** -> Defaults to 70, height of external circle arc<br/>
**arcWidth** -> Defaults to 90, width of external circle arc<br/>
**circleOutline** -> Defaults to 10<br/>
**shadowAllowance** -> Defaults to 20, size of shadow<br/>
**key** -> Defaults to null

## TabData
**icon** -> Icon to be used for the tab<br/>
**title** -> String to be used for the tab<br/>
**onClick** -> Optional function to be used when the circle itself is clicked, on an active tab

## Showcase
If you use this package in a live app, let me know and I'll add you app here. ;)

## Contributing
Found a bug? Please submit a PR!
