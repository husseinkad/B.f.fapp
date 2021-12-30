import 'package:meta/meta.dart';
import 'dart:convert';

SignIn signInFromJson(String str) => SignIn.fromJson(json.decode(str));

String signInToJson(SignIn data) => json.encode(data.toJson());

class SignIn {
  SignIn({
    required this.token,
    required this.account,
  });

  Token token;
  Account account;

  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
    token: Token.fromJson(json["token"]),
    account: Account.fromJson(json["account"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token.toJson(),
    "account": account.toJson(),
  };
}

class Account {
  Account({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.address1,
    required this.address2,
  });

  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String address1;
  String address2;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    address1: json["address1"],
    address2: json["address2"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone_number": phoneNumber,
    "address1": address1,
    "address2": address2,
  };
}

class Token {
  Token({
    required this.access,
  });

  String access;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    access: json["access"],
  );

  Map<String, dynamic> toJson() => {
    "access": access,
  };
}
