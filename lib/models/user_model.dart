

import 'address_model.dart';

const String collectionUser = 'Users';

const String userFieldId = 'userId';
const String userFieldDisplayName = 'displayName';
const String userFieldAddressModel = 'addressModel';
const String userFieldGender = 'gender';
const String userFieldAge = 'age';
const String userFieldPhone = 'phone';
const String userFieldEmail = 'email';
const String userFieldImageUrl = 'imageUrl';

class UserModel {
  String userId;
  String? displayName;
  AddressModel? addressModel;
  String? gender;
  String? age;
  String? phone;
  String email;
  String? imageUrl;

  UserModel(
      {required this.userId,
        this.displayName,
        this.addressModel,
        this.gender,
        this.age,
        this.phone,
        this.imageUrl,
        required this.email});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      userFieldId: userId,
      userFieldDisplayName: displayName,
      userFieldAddressModel: addressModel?.toMap(),
      userFieldGender: gender,
      userFieldAge: age,
      userFieldPhone: phone,
      userFieldEmail: email,
      userFieldImageUrl: imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    userId: map[userFieldId],
    displayName: map[userFieldDisplayName],
    addressModel: map[userFieldAddressModel] == null
        ? null
        : AddressModel.fromMap(map[userFieldAddressModel]),
    gender: map[userFieldGender],
    age: map[userFieldAge],
    phone: map[userFieldPhone],
    email: map[userFieldEmail],
    imageUrl: map[userFieldImageUrl],
  );
}
List<UserModel> userList=[
  UserModel(
      userId: "NT188",
      email: 'najib@gmail.com')
];