import 'package:flutter/material.dart';
import 'package:flutter_inv/widgets/left_drawer.dart';
import 'package:flutter_inv/widgets/shop_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<InvItem> items = [
    InvItem("View Items", Icons.checklist),
    InvItem("Add Item", Icons.add_shopping_cart),
    InvItem("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Item List',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // Add drawer as parameter of the Scaffold widget
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Scrolling wrapper widget
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding for the page
          child: Column(
            // Widget to display children vertically
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Text widget to display text with center alignment and appropriate style
                child: Text(
                  'Flutter Inventory', // Text indicating the app name
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container for our cards.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((InvItem item) {
                  // Iteration for each item
                  return InvCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
