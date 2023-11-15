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

## Assignment 8
#### Explain the difference between  `Navigator.push()`  and  `Navigator.pushReplacement()`, accompanied by examples of the correct usage of both methods!

In Flutter,  `Navigator` is used for navigating between different screens or routes in your app. 

`Navigator.push()` adds a new screen on top, keeping the previous one in the stack for back navigation. It's used when moving to a new screen with an option to go back.
```dart
// Navigator.push() example
onTap: () {
	Navigator.push(
		context,
		MaterialPageRoute(
			builder: (context) =>  MyHomePage(),
		));
},
``` 

`Navigator.pushReplacement()` also adds a new screen but replaces the current one in the stack. Useful for scenarios like login or form completion, ensuring back leads to a specific screen or exits the app.

```dart
// Navigator.pushReplacement() example
onTap: () {
	Navigator.pushReplacement(
		context,
		MaterialPageRoute(
			builder: (context) =>  MyHomePage(),
		));
},
``` 

---

#### Explain each layout widget in Flutter and their respective usage contexts!
`Container` : The Container widget is a versatile box model that can contain other widgets and provides properties for customization such as padding, margin, color, and decoration.

`Row and Column` : Arranges children widgets horizontally and vertically.They are used to create flexible and responsive UIs, especially when dealing with different screen sizes and orientations.

`Stack` :  The Stack widget allows you to overlay widgets on top of each other, like placing a button on an image.

`ListView` and `SingleChildScrollView` :

- ListView : Displays a scrollable list of widgets.
- SingleChildScrollView : Allows a single child to be scrolled. 

Useful when you have a small number of children or a dynamically changing list of children.
These widgets are used for displaying lists of items.

`GridView` : Displays a scrollable grid of widgets. It's handy for creating a grid of items, such as a gallery of images.

`Expanded` and `Flexible` :

- Expanded : Expands a child widget to fill the available space along the main axis in a Row or Column.
- Flexible : Allows a child widget to take a share of the available space, based on a flex factor.

These are often used in combination with Row or Column to control how space is allocated among child widgets.

`Wrap` : Used to create a flow of widgets that wraps to the next line when it reaches the edge of the screen.

`SizedBox` : Set specific dimensions for its child. Used to add spacing or enforce a minimum size for a widget.


`Align` : The Align widget positions a child within its parent. Used to precisely position a widget relative to a certain corner or edge.

`Positioned` : Similar to Align, the Positioned widget allows you to position a child widget at an absolute position within its parent. It's often used within a Stack.

---

#### List the form input elements you used in this assignment and explain why you used these input elements!

`Form` widget is used as the container for grouping multiple 	`TextFormField`
`TextFormField` is used because it provides a text input field for the user. It is particularly designed for capturing text-based user input. 

input elements :
- name
- amount 
- price
- category
- description

The reason i used these input elements is so that in this item list application, I know that I have an item named [name], how many I have of that item [amount], the price when i bought the item [price], what type of the item it is [category], and a description to describe that said item [description]

---

#### How is clean architecture implemented in a Flutter application?
Clean architecture can be implemented in flutter by splitting dart file's in /lib into separate file like screens and widgets, with the screens file containing all the .dart file that make a page, while the widgets file contains .dart file that have a reusable widget or any general widget that is used in the application.

---

#### Explain how you implemented the  _checklist_  above step-by-step! (not just following the tutorial)
1. Creating menu drawer for navigation

Created a new dart file named `left_drawer.dart` that contains a `LeftDrawer` class for building the drawer widget. Drawer widget contains a ListView with ListTile and each ListTile contains a title that when pressed lead to a certain page with navigator function. After creating the drawer, I imported with import `'package:flutter_inv/widgets/left_drawer.dart';` to the `menu.dart` since I want to access the drawer from the menu with `drawer:  const LeftDrawer(),`

3. Creating form for adding items into the app

Created a new file named `itemlist_form.dart`  that contains a `FormPage` class since this class is a stateful widget, I created a new class for the `FormPage` state.  in the state class i added some variable which is :
```dart
final _formKey = GlobalKey<FormState>();  
String _name = "";  
int _price = 0;  
String _description = "";
```
these variable will be used for the form function. then with that said class, I build the widget with `TextFormField` and a button for the form submission. Each `TextFormField` contains a validator to validate the input. When the submit button is pressed it will return a pop-up message with the list of user input in the form.

4. Adding navigations to buttons

I did this by using the navigator function under the `InkWell` widget in `menu.dart`, so when the `item.name` is equal to the desired name, then when the widget is pressed, it will redirect to the new page with navigator.

5. Refactoring files

Grouped the dart files into screens & widgets, leaving `main.dart` outside in `/lib`, screens folder contains dart files that creates a screen, while widgets folder contains dart files for creating widgets that can be used in multiple screen.

---