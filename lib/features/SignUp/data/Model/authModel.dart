class AuthModel{
  final String email;
  final String password;
   String ?id;

  AuthModel({required this.email, required this.password,this.id});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      password:json['password'],

    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    data['id'] = id;


    return data;
  }
}