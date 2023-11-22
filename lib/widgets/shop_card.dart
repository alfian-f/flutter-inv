import 'package:flutter/material.dart';
import 'package:flutter_inv/screens/itemlist_form.dart';
import 'package:flutter_inv/screens/list_item.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter_inv/screens/login.dart';

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
    final request = context.watch<CookieRequest>();

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
        onTap: () async {
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
          } else if (item.name == "View Items") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductPage()));
          } else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Change the URL to your Django app's URL. Don't forget to add the trailing slash (/) if needed.
                "https://alfian-fadhlurrahman-tugas.pbp.cs.ui.ac.id/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Good bye, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
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
