// class UserModel {
//   final int? id;
//   final String? username;
//   final String? firstName;
//   final String? lastName;
//   final String? gender;

//   UserModel(
//     this.id,
//     this.username,
//     this.firstName,
//     this.lastName,
//     this.gender,
//   );
//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         json['id'],
//         json['username'],
//         json['firstName'],
//         json['lastName'],
//         json['gender'],
//       );
// }

// class Address {
//   // final String address;
//   // final String city;
//   // final String state;
//   // final String stateCode;
//   // final String postalCode;
//   final Coordinates coordinates;
//   // final String country;

//   Address({
//     required this.coordinates,
//   });

//   // Factory method to create an Address object from JSON
//   factory Address.fromJson(Map<String, dynamic> json) {
//     return Address(
//       // address: json['address'],
//       // city: json['city'],
//       // state: json['state'],
//       // stateCode: json['stateCode'],
//       // postalCode: json['postalCode'],
//       coordinates: Coordinates.fromJson(json['coordinates']),
//       // country: json['country'],
//     );
//   }
// }

// class Coordinates {
//   final double lat;
//   final double lng;

//   Coordinates({
//     required this.lat,
//     required this.lng,
//   });

//   // Factory method to create Coordinates object from JSON
//   factory Coordinates.fromJson(Map<String, dynamic> json) {
//     return Coordinates(
//       lat: json['lat'],
//       lng: json['lng'],
//     );
//   }
// }

class UserModel {
  final int? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final Address? address;
  final String? country; // Add Address to UserModel

  UserModel(
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.gender,
    this.address,
    this.country, // Include address in the constructor
  );

  // Factory method to create a UserModel object from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      json['id'],
      json['username'],
      json['firstName'],
      json['lastName'],
      json['gender'],
      json['address'] != null ? Address.fromJson(json['address']) : null,
      json['country']);
}

class Address {
  final Coordinates coordinates;

  Address({
    required this.coordinates,
  });

  // Factory method to create an Address object from JSON
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      coordinates: Coordinates.fromJson(json['coordinates']),
    );
  }
}

class Coordinates {
  final double lat;
  final double lng;

  Coordinates({
    required this.lat,
    required this.lng,
  });

  // Factory method to create Coordinates object from JSON
  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
