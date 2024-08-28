class UserModel {
  final int? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? gender;

  UserModel(
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.gender,
  );
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        json['id'],
        json['username'],
        json['firstName'],
        json['lastName'],
        json['gender'],
      );
}
