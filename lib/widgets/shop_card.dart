import 'package:flutter/material.dart';
import 'package:flutter_inv/screens/itemlist_form.dart';

class InvItem {
  final String name;
  final IconData icon;

  InvItem(this.name, this.icon);
}

class InvCard extends StatelessWidget {
  final InvItem item;

  const InvCard(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    Color cardColor;

    switch (item.name) {
      case 'Add Item':
        cardColor = Colors.lightGreen;
        break;
      case 'Logout':
        cardColor = Colors.red;
        break;
      default:
        cardColor = Colors.indigo;
        break;
    }

    return Material(
      color: cardColor,
      child: InkWell(
        // Responsive touch area
        onTap: () {
          // Show a SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You clicked the ${item.name} button!")));

          if (item.name == "Add Item") {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopFormPage(),
                ));
          }
        },
        child: Container(
          // Container to hold Icon and Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
