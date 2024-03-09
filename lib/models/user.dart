class User {

  int? id;
  String? name;
  String? username;
  String? email;
  String? photo;

  String? error;

  void setData(Map<String, dynamic> data) {
    id= data['id'];
    name= data['name'];
    username= data['username'];
    email= data['email'];
    photo= data['photo'];
  }

  void setError(String error) {
    this.error= error;
  }
}

class UserAddress {

  String? street;
  String? suite;
  String? city;
  String? zipCode;
  UserGeo? geo;

}

class UserGeo {

  String? lat;
  String? lang;
}