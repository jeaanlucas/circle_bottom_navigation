# Circle Bottom Navigation

![demo](https://media.giphy.com/media/joflEnk6kMGdAuObPT/giphy.gif)

## Getting started
Add the plugin:

```yaml
dependencies:
  ...
  circle_bottom_navigation: ^1.0.6
```

## Minimum usage
```dart
bottomNavigationBar: CircleBottomNavigation(
  initialSelection: currentPage,
  tabs: [
    TabData(icon: Icons.home),
    TabData(icon: Icons.history),
    TabData(icon: Icons.search),
    TabData(icon: Icons.alarm),
  ],
  onTabChangedListener: (index) => setState(() => currentPage = index),
)
```

## Attributes
### Required
**initialSelection** -> The number of page you want to start/navigate, receive a `int`<br>
**tabs** -> List of `TabData` objects<br>
**onTabChangedListener** -> Function to handle a tap on a tab, receives `int position`

### Optional
**circleColor** -> Defaults to null, derives from `Theme`<br>
**activeIconColor** -> Defaults to null, derives from `Theme`<br>
**inactiveIconColor** -> Defaults to null, derives from `Theme`<br>
**textColor** -> Defaults to null, derives from `Theme`<br>
**barBackgroundColor** -> Defaults to null, derives from `Theme`<br>
**circleSize** -> Defaults to 60.0, size of intern circle<br>
**barHeight** -> Defaults to 60.0, height of bar<br>
**arcHeight** -> Defaults to 70.0, height of external circle arc<br>
**arcWidth** -> Defaults to 90.0, width of external circle arc<br>
**circleOutline** -> Defaults to 10.0<br>
**shadowAllowance** -> Defaults to 20.0, size of icon shadow<br>
**hasElevationShadows** -> Defaults to true, define if bar have elevation shadows<br>
**blurShadowRadius** -> Defaults to 8.0, size of bar shadow if *hasElevationShadows* is true <br>
**key** -> Defaults to null

## TabData
### Required
**icon** -> Icon to be used for the `TabData`<br>

### Optional
**title** -> `String` to be used for the tab<br>
**onClick** -> `Function` to be used when the circle itself is clicked, on an active tab<br>
**iconSize** -> Size of icon displayed active and not active<br>
**fontSize** -> Size of font in case of title has informed<br>
**fontWeight** -> Weight of font in case of title has informed

## Example
There is an example project in the `example` folder. Check it out.

## Showcase
If you use this package in a live app, let me know and I'll add your app here. ;)

## Contributing
Found a bug? Please, open an issue and if you wanna help, do a PR :D
