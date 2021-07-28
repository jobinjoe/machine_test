

class Employees {
  int id;
  String username;
  String name;
  String email;
  String profileImage;
  //String address;
  String phone;
  String website;
  Address address;
  Company company;

  Employees({this.id, this.username,this.name,this.email,this.profileImage,this.phone,this.website,this.address,this.company });

  factory Employees.fromJson(Map<String, dynamic> json) {
    return Employees(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      profileImage: json['profile_image'],
      phone:json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address']),
      company: json['company'] !=  null ?Company.fromJson(json['company']): Company()
    );
  }
}

class Address{
  String street;
  String suite;
  String city;
  String zipcode;
  double latitude;
  double longitude;

  Address({this.street, this.suite,this.city,this.zipcode,this.latitude,this.longitude});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      latitude: json['lat'],
      longitude: json['lng'],
    );
  }
}

class Company{
  String name = '';
  String catchPhrase= '';
  String bs = '';
  
  Company({this.name, this.catchPhrase,this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}
