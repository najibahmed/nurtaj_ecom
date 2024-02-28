import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              height: 150,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
            ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.shopping_cart),
                title: const Text('My Cart'),
              ),
            ListTile(
              title: Text("Orders"),
              leading: Icon(Icons.list_alt_outlined),
              trailing: Text("5"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.person),
              title: const Text('Login/Register'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
            ),
          ],
        ),
      ),

    );
  }
}
