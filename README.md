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

## Assignment 9


#### Can we retrieve JSON data without creating a model first? If yes, is it better than creating a model before retrieving JSON data?

For smaller projects or simple use cases, retrieving JSON data without a model might be sufficient and more straightforward. However, for larger projects or situations where type safety and code maintainability are crucial, creating a model is often the recommended approach.

---

#### Explain the function of CookieRequest and explain why a CookieRequest instance needs to be shared with all components in a Flutter application.


`CookieRequest` is used to manage the cookies required for authentication with the Django Project Server. Sharing a `CookieRequest` instance across all components in a Flutter application via a `Provider` is essential to ensure consistent authentication state. This approach guarantees that all components can interact with and access the same authentication state established by the `CookieRequest`.

---

#### Explain the mechanism of fetching data from JSON until it can be displayed on Flutter.

To fetch and display data from JSON in a Flutter application, start by making an HTTP request using a package like http. Decode the received JSON data using the `dart:convert` library. Create the Dart model classes for better organization. Deserialize the JSON into Dart objects, and then use Flutter widgets like `FutureBuilder` along with UI components such as `ListView` to display the data. 

---

#### Explain the authentication mechanism from entering account data on Flutter to Django authentication completion and the display of menus on Flutter.

  
Upon user login in the Flutter app, an HTTP request is sent to the Django Project, containing the entered username and password. Within the Django Project, authentication involves validating these credentials against stored user data. If the credentials are confirmed, the Django app responds to the Flutter app, indicating successful or failed authentication. Subsequently, the Flutter app updates its local state and transitions to a corresponding screen based on the authentication outcome.

---

#### List all the widgets you used in this assignment and explain their respective functions.

`login.dart` :

- `Scaffold` : Provides the basic structure of the visual interface.
- `AppBar` : App bar on top of the screen, to display a text widget 'Login'
- `Text` : Displays text content.
- `Container` : A box model that can contain other widgets. For customization of its child's position and appearance.
- `Column` : A widget that arranges its children in a vertical column. 
- `TextField` : A widget that allows the user to input text. For username and password.
- `SizedBox` : A box with a specified size.
- `ElevatedButton` : A material design raised button. It is used for triggering actions. In this case, it is used for logging in.
- `SnackBar` : A small, temporary message that appears at the bottom of the screen.
- `AlertDialog` : A dialog that interrupts the user with important information or a decision that requires their input.
- `TextButton` : A material design text button. It can be used for actions similar to `ElevatedButton` but has a flat appearance.

`list_item.dart` :

- `Scaffold`: Provides the basic structure for the visual interface.
- `AppBar`: Represents the app bar at the top of the screen.
- `Text`: Displays text content.
- `FutureBuilder`: A widget that makes it easy to work with futures, displaying different widgets depending on the state of the future.
- `Center` : Centers its child within the parent widget.
- `CircularProgressIndicator` : Displays a circular loading indicator.
- `Column` : Arranges its children in a vertical column.
- `SizedBox` : Creates a box of a specified size.
- `ListView` : A scrollable list of widgets.
- `Container` : A box that can contain other widgets, providing customization of its child's position and appearance.
- `Align` : Aligns its child within the parent widget.
- `Padding` : Adds padding around its child.
- `ElevatedButton` : Represents a raised button for triggering actions.
- `AlertDialog` : A dialog box that interrupts the user with important information or a decision that requires their input.
- `SingleChildScrollView` : A scrollable widget that allows its single child to be scrolled. It's useful when the content may overflow the screen.

---

#### Explain how you implement the checklist above step by step! (not just following the tutorial).

1. Django-Flutter Authentication Integration

Created a `django-app` named `authentication` and install `django-cors-headers` in the django project directory. Then create a new view method for login in `authentication/views.py` and route it with the `urls.py` file.

2. Integrate Authentication System in Flutter

In the flutter project directory, install `provider` and `pbp_django_auth` with `flutter pub add`. Then modify the root widget to provide `CookieRequest` library to all child widgets using `Provider`. Create `login.dart` file in `lib/screens/` and fill it with a `LoginPage` class that build a widget for the Login Page Screen.

3. Custom Model Creation

copy the `JSON` endpoint in the django project to the [Quicktype](https://app.quicktype.io/) website. then change the setup name to `Item`, source type to `JSON`, and language to `Dart`. Then click the `Copy Code` Button add insert the code to `lib/models/Item.dart`.

4. Fetch Data from Django and Show Data in the Flutter App

Add the http package with `flutter pub add http`, then add `<uses-permission  android:name="android.permission.INTERNET"  />` to the `android/app/src/main/AndroidManifest.xml` file. Create a new screen called `list_item.dart` and inside that file create a new class named `ProductPage` that will build a widget for listing the user item. Then add the `ProductPage` to the left drawer widget & shop card widget.

5. Implement Logout Feature

Create a new logout function in `authentication/views.py`  and route it using `urls.py` then in the flutter project set request to CookieRequest in `shop_card.dart` and an if statement if the item name is "Logout", then use that request to Logout.