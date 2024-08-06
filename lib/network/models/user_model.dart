class UserModel {
  final List<User>? users;
  final int? total;
  final int? skip;
  final int? limit;

  UserModel({
    this.users,
    this.total,
    this.skip,
    this.limit,
  });

}

class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? maidenName;
  final int? age;
  final Gender? gender;
  final String? email;
  final String? phone;
  final String? username;
  final String? password;
  final String? birthDate;
  final String? image;
  final String? bloodGroup;
  final double? height;
  final double? weight;
  final String? eyeColor;
  final Hair? hair;
  final String? ip;
  final Address? address;
  final String? macAddress;
  final String? university;
  final Bank? bank;
  final Company? company;
  final String? ein;
  final String? ssn;
  final String? userAgent;
  final Crypto? crypto;
  final Role? role;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
    this.crypto,
    this.role,
  });

}

class Address {
  final String? address;
  final String? city;
  final String? state;
  final String? stateCode;
  final String? postalCode;
  final Coordinates? coordinates;
  final Country? country;

  Address({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.coordinates,
    this.country,
  });

}

class Coordinates {
  final double? lat;
  final double? lng;

  Coordinates({
    this.lat,
    this.lng,
  });

}

enum Country {
  UNITED_STATES
}

class Bank {
  final String? cardExpire;
  final String? cardNumber;
  final String? cardType;
  final String? currency;
  final String? iban;

  Bank({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

}

class Company {
  final String? department;
  final String? name;
  final String? title;
  final Address? address;

  Company({
    this.department,
    this.name,
    this.title,
    this.address,
  });

}

class Crypto {
  final Coin? coin;
  final Wallet? wallet;
  final Network? network;

  Crypto({
    this.coin,
    this.wallet,
    this.network,
  });

}

enum Coin {
  BITCOIN
}

enum Network {
  ETHEREUM_ERC20
}

enum Wallet {
  THE_0_XB9_FC2_FE63_B2_A6_C003_F1_C324_C3_BFA53259162181_A
}

enum Gender {
  FEMALE,
  MALE
}

class Hair {
  final String? color;
  final Type? type;

  Hair({
    this.color,
    this.type,
  });

}

enum Type {
  CURLY,
  KINKY,
  STRAIGHT,
  WAVY
}

enum Role {
  ADMIN,
  MODERATOR,
  USER
}
