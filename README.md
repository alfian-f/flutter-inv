# flutter_inv
Alfian Fadhlurrahman | 2206821683
Flutter Assignment for PBP Course.

## Assignment 7
#### What are the main differences between stateless and stateful widget in Flutter?

In stateless widget, they do not change by themselves through some internal action or behavior. They are changed by external events on parent widgets in the widgets tree. While stateful widget change their descriptions dynamically during their lifetimes.

---
#### Explain all widgets that you used in this assignment.

`main.dart`
- `MaterialApp` : the root widget of the application
- `MyHomePage` : a home widget in `menu.dart` for the application

`menu.dart`
1. `MyHomePage`
- `Scaffold` : define the basic app structure
- `AppBar` : a rectangle container on the top of the screen
- `Text` : a widget to display text
- `SingleChildScrollView` : scrolling wrapper widget to scroll the content when it doesn't fit on the screen.
- `Padding` : a widget for padding around its child widget
- `Column` : a widget that allows its children to be placed vertically
- `Gridview` : a widget that creates a grid layout to display `InvCard`
2. `InvCard`
- `Material` : a widget for background color for each `InvItem`
- `InkWell` : a widget that handles the tap interaction by providing a responsive touch area
- `SnackBar` : a widget to display brief messages to the user at the bottom of the screen
- `Text` : a widget to display text
- `Container` : a widget to create a container for the icon and text for each `InvItem`
- `Center` : a widget to center its child widget
- `Column` : a widget that allows its children to be placed vertically
- `Icon` : a widget to display icon for each `InvItem`
- `Padding` : a widget for padding around its child widget

---
#### Explain how you implemented the checklist above step-by-step (not just following the tutorial).

1. Initialization
I started off by creating the app with `flutter create flutter_inv` and run the project in the project directory using `flutter run` in command prompt.

2. Organizing Project Structure
I did this by creating a new file in `flutter_inv/lib` called `menu.dart` that import the material package and a MyHomePage class. Then I import MyHomePage class in `main.dart` from `menu.dart`. Made the `main.dart` to only contain MyApp class.

3. Creating Widget
Created a stateless widget for `MyHomePage` class that return a scaffold that contains an app bar, and a grid view that contains ItemCards. For the `ItemCard` widget I took the data from the InvItem class and created a widget that displays a card for each InvItem with a corresponding icon. The `InvItem` class contains a string for its name and IconData for its icon. Finally I added the items in MyHomePage class using
```dart
final  List<InvItem> items = [
InvItem("View Items", Icons.checklist),
InvItem("Add Item", Icons.add_shopping_cart),
InvItem("Logout", Icons.logout),
];
```

4. Bonus
For the bonus part, i created a new `cardColor` variable and a switch case using `item.name` that changes the `cardColor` for different item name.

---