import 'package:flutter/material.dart';
import 'package:nurtaj_ecom_home/models/address_model.dart';
import 'package:nurtaj_ecom_home/models/user_model.dart';

import '../../common/Helper Function/widget_function.dart';


class UserProfilePage extends StatefulWidget {


  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
   late AddressModel addressModel;
  late UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('My Profile'),
      ),
      body: ListView(
        children: [
          _headerSection(context),
          ListTile(
            leading: const Icon(Icons.call),
            title: Text( 'Not set yet'),
            trailing: IconButton(
              onPressed: () {
                showSingleTextInputDialog(
                  context: context,
                  title: 'Mobile Number',
                  onSubmit: (value) {
                    userModel.phone = value;
                    // print('input: $value');
                    // Navigator.pushNamed(
                    //     context, OtpVerificationPage.routeName,
                    //     arguments: value);
                  },
                );
              },
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: Text('Not set yet'),
            subtitle: const Text('Date of Birth'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text('Not set yet'),
            subtitle: const Text('Gender'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: Text('Not set yet'),
            subtitle: const Text('Address Line 1'),
            trailing: IconButton(
              onPressed: () {
                showSingleTextInputDialog(
                  context: context,
                  title: 'Address Line 1',
                  onSubmit: (value) {
                    setState(() {
                      addressModel.addressLine1 = value;
                    });
                    // userProvider.updateUserProfileField(
                    //   '$userFieldAddressModel.$addressFieldAddressLine1',
                    //   value,
                    // );
                  },
                );
              },
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: Text('Not set yet'),
            subtitle: const Text('Address Line 2'),
            trailing: IconButton(
              onPressed: () {
                showSingleTextInputDialog(
                  context: context,
                  title: 'Address Line 2',
                  onSubmit: (value) {
                    addressModel.addressLine2 = value;
                  },
                );
              },
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: Text('Not set yet'),
            subtitle: const Text('City'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: Text('Not set yet'),
            subtitle: const Text('Zip Code'),
            trailing: IconButton(
              onPressed: () {
                showSingleTextInputDialog(
                  context: context,
                  title: 'Zip Code',
                  onSubmit: (value) {
                    addressModel.zipcode = value;
                  },
                );
              },
              icon: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
   Container _headerSection(BuildContext context) {
     return Container(
       height: 150,
       color: Theme.of(context).primaryColor,
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10),
         child: Row(
           children: [
             Card(
               shape:
               RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
               elevation: 5,
               child: const Icon(
                 Icons.person,
                 size: 90,
                 color: Colors.grey,
               )
             ),
             const SizedBox(
               width: 15,
             ),
             Column(
               mainAxisSize: MainAxisSize.min,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'Najib Ahmed',
                   style: Theme.of(context)
                       .textTheme
                       .headline6!
                       .copyWith(color: Colors.white),
                 ),
                 Text(
                   'najib@gmail.com',
                   style: TextStyle(color: Colors.white60),
                 ),
               ],
             ),
           ],
         ),
       ),
     );
   }

}
