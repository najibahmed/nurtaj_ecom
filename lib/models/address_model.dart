const String addressFieldAddressLine1 = 'addressLine1';
const String addressFieldAddressLine2 = 'addressLine2';
const String addressFieldCity = 'city';
const String addressFieldZipcode = 'zipcode';

class AddressModel {
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? zipcode;

  AddressModel({this.addressLine1, this.addressLine2, this.city, this.zipcode});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      addressFieldAddressLine1: addressLine1,
      addressFieldAddressLine2: addressLine2,
      addressFieldCity: city,
      addressFieldZipcode: zipcode,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) => AddressModel(
    addressLine1: map[addressFieldAddressLine1],
    addressLine2: map[addressFieldAddressLine2],
    city: map[addressFieldCity],
    zipcode: map[addressFieldZipcode],
  );
}
List<AddressModel> addressList=[
  AddressModel(
    addressLine1: '6(i)/Fare Diya Complex',
    addressLine2: '11/8,free school street,Panthapath',
    city: 'Dhaka'
  )
];