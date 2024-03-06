import 'package:flutter/material.dart';
import 'package:nurtaj_ecom_home/Views/authentication/login/signIn_page.dart';

import '../cart/cart_page.dart';
import '../user profile/user_profile_page.dart';


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
              onTap: () {
                Navigator.pushNamed(context, UserProfilePage.routeName);
              },
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
            ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, CartPage.routeName);
                },
                leading: const Icon(Icons.shopping_cart),
                title: const Text('My Cart'),
              ),
            ListTile(
              title: Text("Orders"),
              leading: Icon(Icons.list_alt_outlined),
              trailing: Text("5"),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, SignInPage.routeName);
              },
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
